package testgrpc

import (
	"net"
	"testing"

	"google.golang.org/grpc"
	"google.golang.org/grpc/interop"
	"google.golang.org/grpc/interop/grpc_testing"
)

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
