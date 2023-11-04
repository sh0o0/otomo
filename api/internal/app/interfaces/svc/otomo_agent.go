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
		opts OtomoAgentOptions,
	) (*model.Otomo, *model.Message, error)
	Message(
		ctx context.Context,
		otomo *model.Otomo,
		opts OtomoAgentOptions,
	) (*model.Otomo, *model.Message, error)
}

type OtomoAgentOptions struct {
	MessagingFunc model.MessagingFunc
}
