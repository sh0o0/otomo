package repo

import (
	"context"
	"otomo/internal/app/domain/entity/message"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type MessageWithOtomoRepository interface {
	Add(ctx context.Context, msg *message.MessageWithOtomo) error
}
