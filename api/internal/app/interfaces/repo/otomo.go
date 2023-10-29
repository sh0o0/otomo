package repo

import (
	"context"
	"otomo/internal/app/model"
)

type OtomoRepository interface {
	GetByUserID(ctx context.Context, userID model.UserID) (*model.Otomo, error)
	Save(ctx context.Context, otomo *model.Otomo) error
}
