package service

import (
	"context"
	"otomo/internal/app/model"
)

var _ model.Converser = (*ConversationService)(nil)

type ConversationService struct{}

func (cs *ConversationService) Respond(
	ctx context.Context,
	msg *model.Message,
	memory *model.Memory,
) (*model.Message, error) {
	panic("not implemented") // TODO: Implement
}

func (cs *ConversationService) Message(
	ctx context.Context,
	memory *model.Memory,
) (*model.Message, error) {
	panic("not implemented") // TODO: Implement
}
