package middleware

import (
	"fmt"
	"otomo/pkg/log"

	grpc_recovery "github.com/grpc-ecosystem/go-grpc-middleware/recovery"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func RecoverServerOption() grpc.ServerOption {
	opts := []grpc_recovery.Option{
		grpc_recovery.WithRecoveryHandler(func(p interface{}) (err error) {
			log.Logger.Error(fmt.Sprintf("%v", p))
			return status.Errorf(codes.Internal, "Unexpected error: %v", p)
		}),
	}

	return grpc.ChainUnaryInterceptor(
		grpc_recovery.UnaryServerInterceptor(opts...),
	)

}
