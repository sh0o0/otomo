package presenter

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/internal/app/interface/controller/present"
)

var _ present.ChatWithOtomoPresenter = (*ChatWithOtomoPresenter)(nil)

type ChatWithOtomoPresenter struct {
	ErrorPresenter
}

func NewChatWithOtomoPresenter() *ChatWithOtomoPresenter {
	return &ChatWithOtomoPresenter{}
}

func (p *ChatWithOtomoPresenter) MessageToOtomoOutput(
	ctx context.Context,
	msg *message.MessageWithOtomo,
) (*grpcgen.ChatWithOtomoMessageToOtomoResponse, error) {
	panic("not implemented") // TODO: Implement
}
