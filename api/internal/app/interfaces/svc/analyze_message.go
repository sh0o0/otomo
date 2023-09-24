package svc

import (
	"context"
	"otomo/internal/app/model"
)

type AnalyzeMessageService interface {
	ExtractLocationsFromMsg(
		ctx context.Context,
		msg *model.Message,
	) ([]*model.Location, error)
}
