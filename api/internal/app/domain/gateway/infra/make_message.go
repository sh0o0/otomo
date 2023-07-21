package infra

import (
	"context"
	"otomo/internal/app/domain/entity/message"
)

type MessageMaker interface {
	MakeFromMessageWithOtomo(ctx context.Context, msg *message.MessageWithOtomo) (
		*message.MessageWithOtomo, error,
	)
}
