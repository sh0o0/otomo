package middleware

import (
	"context"

	"go.uber.org/zap"
	"google.golang.org/grpc"

	"fmt"
	"otomo/internal/pkg/logs"

	grpc_recovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func OtomoServerOption(
	logger *zap.Logger,
	gcpProjectID string,
	authFunc func(ctx context.Context) (context.Context, error),
) grpc.ServerOption {
	return grpc.ChainUnaryInterceptor(
		contextUnaryServerInterceptor(),
		gRPCZapUnaryServerInterceptor(logger),
		injectTraceUnaryServerInterceptor(logger, gcpProjectID),
		authInterceptor(authFunc),
		withUserIDLoggerUnaryServerInterceptor(),
	)
}

func RecoverServerOption() grpc.ServerOption {
	opts := []grpc_recovery.Option{
		grpc_recovery.WithRecoveryHandler(func(p interface{}) (err error) {
			logs.Logger.Error(fmt.Sprintf("%v", p))
			return status.Errorf(codes.Internal, "Unexpected error: %v", p)
		}),
	}

	return grpc.ChainUnaryInterceptor(
		grpc_recovery.UnaryServerInterceptor(opts...),
	)

}
