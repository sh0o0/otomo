package svc

import (
	"context"
	"otomo/internal/app/model"
)

type SummaryService interface {
	Summarize(
		ctx context.Context,
		newMsg *model.Message,
		existingSummary string,
	) (string, error)
}
