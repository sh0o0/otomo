package svc

import (
	"context"
	"otomo/internal/app/model"
)

type ChatService interface {
	Send(
		ctx context.Context,
		userID model.UserID,
		msg *model.Message,
		history string,
		streamingFunc func(ctx context.Context, chunk []byte) error,
	) (*model.Message, error)
}
