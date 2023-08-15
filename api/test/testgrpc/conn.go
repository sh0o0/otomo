package testgrpc

import (
	"context"
	"net"

	"google.golang.org/grpc"
	"google.golang.org/grpc/test/bufconn"
)

func NewClientConn(lis *bufconn.Listener) (*grpc.ClientConn, error) {
	dial := func(context.Context, string) (net.Conn, error) {
		return lis.Dial()
	}

	return grpc.DialContext(
		context.Background(),
		"bufnet",
		[]grpc.DialOption{
			grpc.WithContextDialer(dial),
			grpc.WithInsecure(),
		}...,
	)
}
