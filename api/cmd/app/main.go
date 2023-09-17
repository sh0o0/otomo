package main

import (
	"context"
	"net"
	"otomo/internal/app/controller"
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/model"
	"otomo/internal/app/repository"
	"otomo/internal/app/service"
	"otomo/internal/pkg/logs"
	middleware "otomo/internal/pkg/middleware/grpc"
	"otomo/internal/pkg/secret"

	firebase "firebase.google.com/go/v4"
	"github.com/asaskevich/EventBus"
	"github.com/getsentry/sentry-go"
	"github.com/kelseyhightower/envconfig"
	"github.com/tmc/langchaingo/llms/openai"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	if err := execute(); err != nil {
		panic(err)
	}
}

func execute() error {
	// Environments
	if err := envconfig.Process("", &conf); err != nil {
		return err
	}
	conf.Print()

	// Sentry
	if err := sentry.Init(sentry.ClientOptions{
		Dsn:   conf.SentryDsn,
		Debug: conf.Debug,
	}); err != nil {
		return err
	}
	defer sentry.Recover()

	// Log
	if err := setupLogger(conf.LogEncoding, conf.Debug); err != nil {
		return err
	}

	// Server
	s, err := newServer()
	if err != nil {
		return err
	}

	var (
		network = "tcp"
		address = conf.ServerHost + ":" + conf.ServerPort
	)
	lis, err := net.Listen(network, address)
	if err != nil {
		return err
	}

	logs.Logger.Info("Listen Info", logs.String("Address", address))
	logs.Logger.Info("============ Start serve ============")
	return s.Serve(lis)
}

func newFirebaseApp() (*firebase.App, error) {
	firebaseCredentialOpt, err := secret.GcpCredentialsOption(
		conf.GoogleApplicationCredentialsJSON,
		conf.GoogleApplicationCredentialsJSONPath,
	)
	if err != nil {
		return nil, err
	}

	return firebase.NewApp(
		context.Background(),
		&firebase.Config{
			ProjectID: conf.GcpProjectID,
		},
		firebaseCredentialOpt,
	)
}

func newServer() (*grpc.Server, error) {
	// infrastructures
	chat, err := openai.NewChat(
		openai.WithToken(conf.OpenAIApiKey),
		openai.WithModel(conf.OpenAIModel),
	)
	if err != nil {
		return nil, err
	}

	fbApp, err := newFirebaseApp()
	if err != nil {
		return nil, err
	}
	fbAuth, err := fbApp.Auth(context.Background())
	if err != nil {
		return nil, err
	}
	fsClient, err := fbApp.Firestore(context.Background())
	if err != nil {
		return nil, err
	}

	var (
		messagingBus = EventBus.New()
	)

	// presenters
	var (
		errorPresenter = controller.NewErrorPresenter()
	)

	// factories
	var (
		msgFactory = model.NewMessageFactory()
	)

	// repositories
	var (
		msgRepo   = repository.NewMessageRepository(fsClient)
		otomoRepo = repository.NewOtomoRepository(fsClient)
	)

	// services
	var (
		summaryService      = service.NewSummaryService(chat)
		conversationService = service.NewConversationService(chat)
		msginSub            = service.NewMessagingSubscriber(messagingBus)
		msginPub            = service.NewMessagingPublisher(messagingBus)
	)
	if err := msginSub.Init(); err != nil {
		logs.Logger.Panic(err.Error())
	}

	var (
		healthCtrl = controller.NewHealthController()
		authCtrl   = controller.NewAuthController(
			service.NewAuthVerifyService(fbAuth, conf.BasicAuthPairs),
		)
		chatCtrl = controller.NewChatController(
			errorPresenter,
			msgFactory,
			msgRepo,
			otomoRepo,
			msginSub,
			msginPub,
			conversationService,
			summaryService,
		)
	)

	s := grpc.NewServer(
		middleware.RecoverServerOption(),
		middleware.OtomoUnaryServerOption(
			logs.Logger,
			conf.GcpProjectID,
			authCtrl.Authorization,
		),
		middleware.OtomoStreamServerOption(
			logs.Logger,
			conf.GcpProjectID,
			authCtrl.Authorization,
		),
	)
	grpcgen.RegisterHealthServiceServer(s, healthCtrl)
	grpcgen.RegisterChatServiceServer(s, chatCtrl)
	reflection.Register(s)

	return s, nil
}
