package controller

import (
	"context"
	"otomo/internal/app/interface/controller/grpc/grpcgen"

	"google.golang.org/protobuf/types/known/emptypb"
)

var _ grpcgen.HealthServiceServer = (*HealthController)(nil)

type HealthController struct {
}

func NewHealthController() *HealthController {
	return &HealthController{}
}

func (ctrl *HealthController) Check(
	ctx context.Context,
	_ *emptypb.Empty,
) (*grpcgen.HealthCheckResponse, error) {
	return &grpcgen.HealthCheckResponse{
		Health: true,
	}, nil
}
