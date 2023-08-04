package main

import (
	"net"
	"otomo/internal/app/interface/controller"
	"otomo/internal/app/interface/controller/grpc/grpcgen"

	"google.golang.org/grpc"
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

	var (
		network = "tcp"
		address = "" + ":" + "50051"
	)
	lis, err := net.Listen(network, address)
	if err != nil {
		return err
	}

	return s.Serve(lis)
}
