package middleware

import (
	"context"

	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"google.golang.org/grpc"
)

func authUnaryServerInterceptor(
	authFunc func(ctx context.Context) (context.Context, error),
) grpc.UnaryServerInterceptor {
	return grpc_auth.UnaryServerInterceptor(authFunc)
}

func authStreamServerInterceptor(
	authFunc func(ctx context.Context) (context.Context, error),
) grpc.StreamServerInterceptor {
	return func(srv interface{}, ss grpc.ServerStream, info *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
		// if this code is not exist, below error will be occurred.
		// ERROR: evans: failed to run REPL mode: failed to instantiate a new spec: failed to instantiate the spec: failed to list packages by gRPC reflection: failed to list services from reflection enabled gRPC server: rpc error: code = Unauthenticated desc = request unauthenticated
		// Reference: https://github.com/grpc/grpc-go/issues/3163
		if info.FullMethod == "/grpc.reflection.v1alpha.ServerReflection/ServerReflectionInfo" {
			return handler(srv, ss)
		}
		return grpc_auth.StreamServerInterceptor(authFunc)(srv, ss, info, handler)
	}
}
