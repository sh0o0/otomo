package repository

import (
	"context"
	"otomo/internal/app/interfaces/repo"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"cloud.google.com/go/firestore"
)

var _ repo.OtomoRepository = (*OtomoRepository)(nil)

type OtomoRepository struct {
	fsClient *firestore.Client
}

func NewOtomoRepository(fsClient *firestore.Client) *OtomoRepository {
	return &OtomoRepository{
		fsClient: fsClient,
	}
}

func (or *OtomoRepository) Save(
	ctx context.Context,
	otomo *model.Otomo,
) error {
	doc := or.getDoc(ctx, otomo.UserID)
	_, err := doc.Set(ctx, otomo)
	return err
}

func (or *OtomoRepository) GetByID(
	ctx context.Context,
	id model.UserID,
) (*model.Otomo, error) {
	doc := or.getDoc(ctx, id)
	snapshot, err := doc.Get(ctx)
	if err != nil {
		return nil, ifCodesNotFoundReturnErrsNotFound(
			err, errs.DomainOtomo, errs.FieldUserID)
	}

	var otomo = &model.Otomo{}
	if err := snapshot.DataTo(otomo); err != nil {
		return nil, err
	}
	return otomo, nil
}

func (r *OtomoRepository) getDoc(
	ctx context.Context,
	userID model.UserID,
) *firestore.DocumentRef {
	return r.fsClient.Doc(GetOtomoDocPath(userID))
}
