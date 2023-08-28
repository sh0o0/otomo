package repository

import (
	"context"
	"otomo/internal/app/controller/repo"
	"otomo/internal/app/model"

	"cloud.google.com/go/firestore"
)

var _ repo.MessageSummaryRepository = (*MessageSummaryRepository)(nil)

type MessageSummaryRepository struct {
	fsClient *firestore.Client
}

func NewMessageSummaryRepository(
	fsClient *firestore.Client,
) *MessageSummaryRepository {
	return &MessageSummaryRepository{
		fsClient: fsClient,
	}
}

func (r *MessageSummaryRepository) Save(
	ctx context.Context,
	userID model.UserID,
	summary string,
) error {
	panic("not implemented")
}
