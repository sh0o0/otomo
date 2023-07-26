package repository

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/gateway/repo"
	"otomo/internal/app/interface/gateway/repository/model"

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
	msgModel, err := model.ConvertMessageWithOtomoEntityToModel(msg)
	if err != nil {
		return err
	}
	msgDoc := r.fsClient.Collection(MessageWithOtomoCollectionPath).Doc(msgModel.ID)

	if _, err := msgDoc.Create(ctx, msgModel); err != nil {
		return err
	}

	return nil
}

func (r *MessageWithOtomoRepository) DeleteByID(
	ctx context.Context,
	id message.MessageWithOtomoID,
) error {
	panic("not implemented") // TODO: Implement
}
