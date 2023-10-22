package repo

import (
	"context"
	"otomo/internal/app/model"
)

type OtomoProfileRepository interface {
	GetByUserID(
		ctx context.Context, userId model.UserID) (*model.OtomoProfile, error)
}
