package repository

import (
	"context"
	"otomo/internal/app/interfaces/repo"
	"otomo/internal/app/model"

	"cloud.google.com/go/firestore"
)

var _ repo.OtomoProfileRepository = (*OtomoProfileRepository)(nil)

type OtomoProfileRepository struct {
	fsClient *firestore.Client
}

func NewOtomoProfileRepository(
	fsClient *firestore.Client,
) *OtomoProfileRepository {
	return &OtomoProfileRepository{fsClient: fsClient}
}

func (opr *OtomoProfileRepository) GetByUserID(
	ctx context.Context,
	userId model.UserID,
) (*model.OtomoProfile, error) {
	panic("not implemented") // TODO: Implement
}
