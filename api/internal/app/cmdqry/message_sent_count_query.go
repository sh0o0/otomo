package cq

import (
	"context"
	"otomo/internal/app/interfaces/cq"
	"otomo/internal/app/model"

	"cloud.google.com/go/firestore"
)

var _ cq.MessageSentCountQuery = (*MessageSentCountQuery)(nil)

type MessageSentCountQuery struct {
	fsClient *firestore.Client
}

func NewMessageSentCountQuery(
	fsClient *firestore.Client,
) *MessageSentCountQuery {
	return &MessageSentCountQuery{fsClient: fsClient}
}

func (mscq *MessageSentCountQuery) GetMonthlySurplusSentMessageCount(
	ctx context.Context,
	userID model.UserID,
	yearMonth model.YearMonth,
) (*model.MonthlySurplusSentMessageCount, error) {
	panic("not implemented") // TODO: Implement
}
