package main

import (
	"net"
	"otomo/internal/app/interface/controller"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/pkg/logs"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	if err := execute(); err != nil {
		panic(err)
	}
}

func execute() error {
	s := grpc.NewServer()
	grpcgen.RegisterHealthServiceServer(s, controller.NewHealthController())
	grpcgen.RegisterChatServiceServer(s, controller.NewChatController())
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
