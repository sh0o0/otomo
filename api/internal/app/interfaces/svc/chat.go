package svc

import (
	"context"
	"otomo/internal/app/model"
)

type ChatService interface {
	Send(
		ctx context.Context,
		msg *model.Message,
		history string,
		streamingFunc func(ctx context.Context, chunk []byte) error,
	) (*model.Message, error)
}
