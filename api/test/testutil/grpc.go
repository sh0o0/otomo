package testutil

import (
	"context"
	"net"
	"testing"

	"google.golang.org/grpc"
	"google.golang.org/grpc/interop"
	"google.golang.org/grpc/interop/grpc_testing"
	"google.golang.org/grpc/test/bufconn"
)

func CallTestService(
	ctx context.Context,
	conn *grpc.ClientConn,
	opts ...grpc.CallOption,
) error {
	client := grpc_testing.NewTestServiceClient(conn)
	_, err := client.EmptyCall(
		ctx,
		&grpc_testing.Empty{},
		opts...,
	)

	return err
}

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

func NewListener() *bufconn.Listener {
	return bufconn.Listen(1024 * 1024)
}

func ServeTestService(
	t *testing.T,
	lis net.Listener,
	opts ...grpc.ServerOption,
) *grpc.Server {
	s := grpc.NewServer(opts...)
	grpc_testing.RegisterTestServiceServer(s, interop.NewTestServer())
	go func() {
		if err := s.Serve(lis); err != nil {
			t.Log(err)
		}
	}()
	return s
}
