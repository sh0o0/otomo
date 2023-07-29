package main

import (
	"net"
	"otomo/internal/app/interface/controller"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/pkg/log"
	"otomo/tools/middleware"

	"github.com/getsentry/sentry-go"
	"github.com/kelseyhightower/envconfig"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	if err := execute(); err != nil {
		log.Logger.Panic(err.Error())
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

	if err := setupLogger(conf.LogEncoding, conf.Debug); err != nil {
		return err
	}
	printEnv(conf)

	server := grpc.NewServer(
		middleware.RecoverServerOption(),
		middleware.OtomoServerOption(
			log.Logger,
			conf.GcpProjectID,
		),
	)
	if err := registerServices(server); err != nil {
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

	log.Logger.Info("Listen Info", log.String("Address", address))
	log.Logger.Info("============ Start serve ============")
	return server.Serve(lis)
}

func registerServices(
	s *grpc.Server,
) error {
	grpcgen.RegisterHealthServiceServer(s, controller.NewHealthController())
	reflection.Register(s)
	return nil
}
