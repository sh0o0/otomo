package repository

import (
	"context"
	"otomo/internal/app/interfaces/repo"
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

func (mr *MessageRepository) Last(
	ctx context.Context,
	userID model.UserID,
) (*model.Message, error) {
	msgsCol := mr.getCollection(ctx, userID)
	query := msgsCol.OrderBy("sent_at", firestore.Desc).Limit(1)

	snaps, err := query.Documents(ctx).GetAll()
	if err != nil {
		return nil, mr.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldNone)
	}

	if len(snaps) == 0 {
		return nil, &errs.Error{
			Message: "There is no message",
			Cause:   errs.CauseNotFound,
			Domain:  errs.DomainMessage,
			Field:   errs.FieldNone,
		}

	}

	return mr.snapToMessage(ctx, snaps[0])
}

func (mr *MessageRepository) Add(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
) error {
	msgDoc := mr.getDoc(ctx, userID, msg.ID)

	_, err := msgDoc.Create(ctx, msg)

	return err
}

func (mr *MessageRepository) Update(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
) error {
	msgDoc := mr.getDoc(ctx, userID, msg.ID)
	if _, err := msgDoc.Get(ctx); err != nil {
		return mr.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
	}

	_, err := msgDoc.Set(ctx, msg)
	return err
}

func (mr *MessageRepository) DeleteByIDAndUserID(
	ctx context.Context,
	userID model.UserID,
	id model.MessageID,
) error {
	msgDoc := mr.getDoc(ctx, userID, id)

	if _, err := msgDoc.Get(ctx); err != nil {
		return mr.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
	}

	_, err := msgDoc.Delete(ctx)
	return err
}

func (mr *MessageRepository) List(
	ctx context.Context,
	userID model.UserID,
	page *repo.MessagePage,
) (msgs []*model.Message, hasMore bool, err error) {
	if page == nil {
		page = &repo.MessagePage{
			Size: defaultMessageListPageSize,
		}
	}
	if page.Size == 0 {
		page.Size = defaultMessageListPageSize
	}

	var limit = page.Size + 1

	msgsCol := mr.getCollection(ctx, userID)
	query := msgsCol.OrderBy("sent_at", firestore.Desc).Limit(limit)
	if page.StartAfterMessageID != "" {
		startAfter, err := mr.getDoc(ctx, userID, page.StartAfterMessageID).Get(ctx)
		if err != nil {
			return nil, false, mr.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
		}
		query = query.StartAfter(startAfter)
	}

	snaps, err := query.Documents(ctx).GetAll()
	if err != nil {
		return nil, false, ifCodesNotFoundReturnErrsNotFound(
			err, errs.DomainUser, errs.FieldID)
	}

	if len(snaps) == limit {
		hasMore = true
		snaps = snaps[:limit-1]
	}

	msgs, err = mr.snapsToMessages(ctx, snaps)
	if err != nil {
		return nil, false, mr.ifCodesNotFoundReturnErrsNotFound(err, errs.FieldID)
	}

	return msgs, hasMore, nil
}

func (mr *MessageRepository) getCollection(
	ctx context.Context,
	userID model.UserID,
) *firestore.CollectionRef {
	return mr.fsClient.Collection(GetMessagesColPath(userID))
}

func (mr *MessageRepository) getDoc(
	ctx context.Context,
	userID model.UserID,
	id model.MessageID,
) *firestore.DocumentRef {
	return mr.fsClient.Doc(GetMessageDocPath(userID, id))
}

func (mr *MessageRepository) snapToMessage(
	ctx context.Context,
	snap *firestore.DocumentSnapshot,
) (*model.Message, error) {
	var msg = &model.Message{}
	if err := snap.DataTo(msg); err != nil {
		return nil, err
	}
	return msg, nil
}

func (mr *MessageRepository) snapsToMessages(
	ctx context.Context,
	snaps []*firestore.DocumentSnapshot,
) ([]*model.Message, error) {
	msgs := make([]*model.Message, len(snaps))
	for i, s := range snaps {
		msg, err := mr.snapToMessage(ctx, s)
		if err != nil {
			return nil, err
		}
		msgs[i] = msg
	}
	return msgs, nil
}

func (mr *MessageRepository) ifCodesNotFoundReturnErrsNotFound(
	err error,
	field errs.Field,
) error {
	return ifCodesNotFoundReturnErrsNotFound(err, errs.DomainMessage, field)
}
