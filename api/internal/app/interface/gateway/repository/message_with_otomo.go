package repository

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/domain/gateway/repo"
	"otomo/internal/app/interface/gateway/repository/model"
	"otomo/pkg/errs"

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
	msgDoc := r.fsClient.
		Collection(getMessagesColPath(string(msg.UserID()))).
		Doc(string(msg.ID()))

	_, err = msgDoc.Create(ctx, msgModel)

	return err
}

func (r *MessageWithOtomoRepository) DeleteByIDAndUserID(
	ctx context.Context,
	id message.MessageWithOtomoID,
	userID user.ID,
) error {
	_, err := r.fsClient.
		Doc(getMessageDocPath(string(userID), string(id))).
		Delete(ctx)

	return ifCodesNotFoundReturnErrsNotFound(
		err, errs.DomainMessageWithOtomo, errs.FieldID)
}
