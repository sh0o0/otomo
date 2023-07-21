package repo

import (
	"context"
	"otomo/internal/app/domain/entity/message"
)

type MessageWithOtomoRepository interface {
	Add(ctx context.Context, msg *message.MessageWithOtomo) error
}
