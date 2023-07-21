package service

import (
	"context"
	"otomo/internal/app/domain/entity/message"
)

type MessageMaker interface {
	MakeFromMessage(ctx context.Context, msg *message.MessageWithOtomo) (
		*message.MessageWithOtomo, error,
	)
}
