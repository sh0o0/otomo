package svc

import (
	"context"
	"otomo/internal/app/model"
)

type MessageAnalysisService interface {
	ExtractLocationsFromMsg(
		ctx context.Context,
		msg *model.Message,
	) (analyzedLoc []*model.AnalyzedLocation, geocodeErr []error, err error)
}
