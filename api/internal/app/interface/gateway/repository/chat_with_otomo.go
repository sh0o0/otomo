package repository

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/gateway/repo"

	"cloud.google.com/go/firestore"
)

var _ repo.MessageWithOtomoRepository = (*MessageWithOtomoRepository)(nil)

type MessageWithOtomoRepository struct {
	fsClient *firestore.Client
}

func NewMessageWithOtomoRepository(
	fsClient *firestore.Client,
) *MessageWithOtomoRepository {
	return &MessageWithOtomoRepository{
		fsClient: fsClient,
	}
}

func (r *MessageWithOtomoRepository) Add(
	ctx context.Context,
	msg *message.MessageWithOtomo,
) error {
	panic("not implemented") // TODO: Implement
}

func (r *MessageWithOtomoRepository) DeleteByID(
	ctx context.Context,
	id message.MessageWithOtomoID,
) error {
	panic("not implemented") // TODO: Implement
}
