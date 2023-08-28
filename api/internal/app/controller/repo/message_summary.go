package repo

import (
	"context"
	"otomo/internal/app/model"
)

type MessageSummaryRepository interface {
	Save(ctx context.Context, userID model.UserID, summary string) error
}
