package repository

import (
	"context"
	"otomo/internal/app/controller/repo"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"cloud.google.com/go/firestore"
)

var _ repo.MessageRepository = (*MessageRepository)(nil)

const (
	defaultMessageListPageSize = 50
)

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
	msgDoc := r.getDoc(ctx, userID, msg.ID)

	_, err := msgDoc.Create(ctx, msg)

	return err
}

func (r *MessageRepository) DeleteByIDAndUserID(
	ctx context.Context,
	userID model.UserID,
	id model.MessageID,
) error {
	msgDoc := r.getDoc(ctx, userID, id)

	if _, err := msgDoc.Get(ctx); err != nil {
		return r.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
	}

	_, err := msgDoc.Delete(ctx)
	return err
}

func (r *MessageRepository) List(
	ctx context.Context,
	userID model.UserID,
	page *repo.MessagePage,
) ([]*model.Message, error) {
	if page == nil {
		page = &repo.MessagePage{
			Size: defaultMessageListPageSize,
		}
	}
	if page.Size == 0 {
		page.Size = defaultMessageListPageSize
	}

	msgsCol := r.getCollection(ctx, userID)
	query := msgsCol.OrderBy("sent_at", firestore.Desc).Limit(page.Size)
	if page.StartAfterMessageID != "" {
		startAfter, err := r.getDoc(ctx, userID, page.StartAfterMessageID).Get(ctx)
		if err != nil {
			return nil, r.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
		}
		query = query.StartAfter(startAfter)
	}

	snaps, err := query.Documents(ctx).GetAll()
	if err != nil {
		return nil, ifCodesNotFoundReturnErrsNotFound(
			err, errs.DomainUser, errs.FieldID)
	}

	msgs, err := r.snapsToMessages(ctx, snaps)
	if err != nil {
		return nil, r.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
	}

	return msgs, nil
}

func (r *MessageRepository) getCollection(
	ctx context.Context,
	userID model.UserID,
) *firestore.CollectionRef {
	return r.fsClient.Collection(getMessagesColPath(string(userID)))
}

func (r *MessageRepository) getDoc(
	ctx context.Context,
	userID model.UserID,
	id model.MessageID,
) *firestore.DocumentRef {
	return r.getCollection(ctx, userID).Doc(string(id))
}

func (r *MessageRepository) snapToMessage(
	ctx context.Context,
	snap *firestore.DocumentSnapshot,
) (*model.Message, error) {
	var msg = &model.Message{}
	if err := snap.DataTo(msg); err != nil {
		return nil, err
	}
	return msg, nil
}

func (r *MessageRepository) snapsToMessages(
	ctx context.Context,
	snaps []*firestore.DocumentSnapshot,
) ([]*model.Message, error) {
	msgs := make([]*model.Message, len(snaps))
	for i, s := range snaps {
		msg, err := r.snapToMessage(ctx, s)
		if err != nil {
			return nil, err
		}
		msgs[i] = msg
	}
	return msgs, nil
}

func (r *MessageRepository) ifCodesNotFoundReturnErrsNotFound(
	err error,
	field errs.Field,
) error {
	return ifCodesNotFoundReturnErrsNotFound(err, errs.DomainMessageWithOtomo, field)
}
