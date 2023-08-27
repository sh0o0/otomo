package repo

import (
	"context"
	"otomo/internal/app/model"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type MessageRepository interface {
	Add(ctx context.Context, userID model.UserID, msg *model.Message) error
	DeleteByIDAndUserID(
		ctx context.Context,
		userID model.UserID,
		id model.MessageID,
	) error
	List(
		ctx context.Context,
		userID model.UserID,
		page *MessagePage,
	) ([]*model.Message, error)
}

type MessagePage struct {
	Size                int
	StartAfterMessageID model.MessageID
}
