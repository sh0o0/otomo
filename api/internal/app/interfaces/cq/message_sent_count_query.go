package cq

import (
	"context"
	"otomo/internal/app/model"
)

type MessageSentCountQuery interface {
	GetMonthlySurplusSentMessageCount(
		ctx context.Context,
		userID model.UserID,
	) (*model.MonthlySurplusSentMessageCount, error)
}
