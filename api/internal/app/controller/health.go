package controller

import (
	"context"
	"otomo/internal/app/grpcgen"
	"otomo/internal/pkg/logs"

	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"google.golang.org/protobuf/types/known/emptypb"
)

var _ grpcgen.HealthServiceServer = (*HealthController)(nil)
var _ grpc_auth.ServiceAuthFuncOverride = (*HealthController)(nil)

type HealthController struct {
}

func NewHealthController() *HealthController {
	return &HealthController{}
}

func (*HealthController) Check(ctx context.Context, _ *emptypb.Empty) (*grpcgen.HealthCheckResponse, error) {
	logs.Logger.Error("Alert check")
	return &grpcgen.HealthCheckResponse{
		Health: true,
	}, nil
}

func (*HealthController) AuthFuncOverride(
	ctx context.Context, fullMethodName string,
) (context.Context, error) {
	logs.FromContext(ctx).Info("Skip authorization")
	return ctx, nil
}
