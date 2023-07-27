package repo

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type MessageWithOtomoRepository interface {
	Add(ctx context.Context, msg *message.MessageWithOtomo) error
	DeleteByIDAndUserID(
		ctx context.Context,
		id message.MessageWithOtomoID,
		userID user.ID,
	) error
}
