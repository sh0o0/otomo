package repository

import (
	"context"
	"otomo/internal/app/controller/repo"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"cloud.google.com/go/firestore"
)

var _ repo.MessageRepository = (*MessageRepository)(nil)

type MessageRepository struct {
	fsClient *firestore.Client
}

func NewMessageRepository(
	fsClient *firestore.Client,
) *MessageRepository {
	return &MessageRepository{
		fsClient: fsClient,
	}
}

func (r *MessageRepository) Add(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
) error {
	msgDoc := r.fsClient.
		Collection(getMessagesColPath(string(userID))).
		Doc(string(msg.ID))

	_, err := msgDoc.Create(ctx, msg)

	return err
}

func (r *MessageRepository) DeleteByIDAndUserID(
	ctx context.Context,
	userID model.UserID,
	id model.MessageID,
) error {
	msgDoc := r.fsClient.
		Doc(getMessageDocPath(string(userID), string(id)))

	if _, err := msgDoc.Get(ctx); err != nil {
		return ifCodesNotFoundReturnErrsNotFound(
			err, errs.DomainMessageWithOtomo, errs.FieldID)
	}

	_, err := msgDoc.Delete(ctx)
	return err
}

func (r MessageRepository) List(
	ctx context.Context,
	userID model.UserID,
	page *repo.MessagePage,
) ([]*model.Message, error) {
	panic("not implemented") // TODO: Implement
}
