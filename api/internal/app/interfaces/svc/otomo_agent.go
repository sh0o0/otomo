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
	) (*model.Otomo, *model.Message, error)
	Message(
		ctx context.Context,
		otomo *model.Otomo,
	) (*model.Otomo, *model.Message, error)
}
