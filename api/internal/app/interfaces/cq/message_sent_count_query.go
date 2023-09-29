package cq

import (
	"context"
	"otomo/internal/app/model"
)

type MessageSentCountQuery interface {
	GetMonthlySurplusMessageSentCount(
		ctx context.Context,
		userID model.UserID,
		yearMonth model.YearMonth,
	) (*model.MonthlySurplusMessageSentCount, error)
}
