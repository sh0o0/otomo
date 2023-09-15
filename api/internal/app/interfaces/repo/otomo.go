package repo

import (
	"context"
	"otomo/internal/app/model"
)

type OtomoRepository interface {
	GetByID(ctx context.Context, id model.UserID) (*model.Otomo, error)
	Save(ctx context.Context, otomo *model.Otomo) error
}
