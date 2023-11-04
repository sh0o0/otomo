package svc

import (
	"context"
	"otomo/internal/app/model"
)

type OtomoAgentService interface {
	Respond(
		ctx context.Context,
		otomo *model.Otomo,
		msg *model.Message,
		opts ConversationOptions,
	) (*model.Otomo, *model.Message, error)
	Message(
		ctx context.Context,
		otomo *model.Otomo,
		opts ConversationOptions,
	) (*model.Otomo, *model.Message, error)
}

type OtomoAgentOptions struct {
	MessagingFunc SpeakingFunc
}
