package controller

import (
	"context"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/internal/app/interface/controller/present"
	"otomo/internal/app/usecase/ucboundary"
)

var _ grpcgen.ChatWithOtomoServiceServer = (*ChatWithOtomoController)(nil)

type ChatWithOtomoController struct {
	useCase   ucboundary.ChatWithOtomoUseCase
	presenter present.ChatWithOtomoPresenter
}

func NewChatWithOtomoController(
	useCase ucboundary.ChatWithOtomoUseCase,
	presenter present.ChatWithOtomoPresenter,
) *ChatWithOtomoController {
	return &ChatWithOtomoController{
		useCase:   useCase,
		presenter: presenter,
	}
}

func (ctrl *ChatWithOtomoController) MessageToOtomo(
	ctx context.Context,
	req *grpcgen.ChatWithOtomoMessageToOtomoRequest,
) (*grpcgen.ChatWithOtomoMessageToOtomoResponse, error) {
	panic("not implemented") // TODO: Implement
}
