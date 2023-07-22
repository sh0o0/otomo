package infra

import (
	"context"
	"otomo/internal/app/domain/entity/message"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE
type MessageMaker interface {
	MakeFromMessageWithOtomo(ctx context.Context, msg *message.MessageWithOtomo) (
		*message.MessageWithOtomo, error,
	)
}
