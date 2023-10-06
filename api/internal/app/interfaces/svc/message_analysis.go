package svc

import (
	"context"
	"otomo/internal/app/model"
)

type MessageAnalysisService interface {
	ExtractLocationsFromMsg(
		ctx context.Context,
		msg *model.Message,
	) (analyzedLoc []*model.ExtractedPlace, geocodeErr []error, err error)
}
