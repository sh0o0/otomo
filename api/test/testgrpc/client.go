package testgrpc

import (
	"context"

	"google.golang.org/grpc"
	"google.golang.org/grpc/interop/grpc_testing"
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
