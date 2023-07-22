package middleware

import (
	"go.uber.org/zap"
	"google.golang.org/grpc"
)

func OtomoServerOption(
	logger *zap.Logger,
	gcpProjectID string,
) grpc.ServerOption {
	return grpc.ChainUnaryInterceptor(
		ContextUnaryServerInterceptor(),
		GRPCZapUnaryServerInterceptor(logger),
		InjectTraceUnaryServerInterceptor(logger, gcpProjectID),
		WithUserIDLoggerUnaryServerInterceptor(),
	)
}
