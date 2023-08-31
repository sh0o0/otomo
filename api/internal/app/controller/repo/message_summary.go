package repo

import (
	"context"
	"otomo/internal/app/model"
)

type ChatRepository interface {
	Save(ctx context.Context, userID model.UserID, chat *model.Chat) error
}
