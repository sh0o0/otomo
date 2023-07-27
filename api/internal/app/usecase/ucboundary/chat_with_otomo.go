package ucboundary

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type ChatWithOtomoUseCase interface {
	MessageToOtomo(
		ctx context.Context,
		userID user.ID,
		text string,
	) (*message.MessageWithOtomo, error)
}
