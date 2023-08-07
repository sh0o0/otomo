package repo

import (
	"context"
	"otomo/internal/app/domain/model"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type MessageRepository interface {
	Add(ctx context.Context, msg *model.Message) error
	DeleteByIDAndUserID(
		ctx context.Context,
		id string,
		userID string,
	) error
}
