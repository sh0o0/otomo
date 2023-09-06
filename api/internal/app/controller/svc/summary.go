package svc

import (
	"context"
	"otomo/internal/app/model"
)

type SummaryService interface {
	Summarize(
		ctx context.Context,
		newMsgs []*model.Message,
		currentSummary string,
	) (string, error)
}
