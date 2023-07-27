package controller

import (
	"context"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/internal/app/interface/controller/present"
	"otomo/internal/app/usecase/ucboundary"
	"otomo/pkg/ctxs"
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
	userID, err := ctxs.UserIDFromContext(ctx)
	if err != nil {
		return nil, ctrl.presenter.ErrorOutput(ctx, err).Err()
	}
	msg, err := ctrl.useCase.MessageToOtomo(ctx, user.ID(userID), req.Text)
	if err != nil {
		return nil, ctrl.presenter.ErrorOutput(ctx, err).Err()
	}

	return ctrl.presenter.MessageToOtomoOutput(ctx, msg)
}
