package main

import (
	"context"
	"net"
	"otomo/internal/app/domain/model"
	"otomo/internal/app/interface/controller"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/internal/app/interface/gateway/repository"
	"otomo/pkg/logs"

	"cloud.google.com/go/firestore"
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
	if err := envconfig.Process("", &conf); err != nil {
		return err
	}
	if err := sentry.Init(sentry.ClientOptions{
		Dsn:   conf.SentryDsn,
		Debug: conf.Debug,
	}); err != nil {
		return err
	}
	defer sentry.Recover()
	if err := setupLogger(conf.LogEncoding, conf.Debug); err != nil {
		return err
	}
	printEnv(conf)

	chat, err := openai.NewChat(
		openai.WithToken(conf.OpenAIApiKey),
		openai.WithModel(conf.OpenAIModel),
	)
	if err != nil {
		return err
	}

	fsClient, err := firestore.NewClient(context.Background(), conf.GcpProjectID)
	if err != nil {
		return err
	}

	s := grpc.NewServer()
	grpcgen.RegisterHealthServiceServer(s, controller.NewHealthController())
	grpcgen.RegisterChatServiceServer(s, controller.NewChatController(
		chat,
		model.NewMessageFactory(),
		repository.NewMessageRepository(fsClient),
	))
	reflection.Register(s)

	var (
		network = "tcp"
		address = "" + ":" + "50051"
	)
	lis, err := net.Listen(network, address)
	if err != nil {
		return err
	}

	logs.Logger.Info("Listen Info", logs.String("Address", address))
	logs.Logger.Info("============ Start serve ============")
	return s.Serve(lis)
}
