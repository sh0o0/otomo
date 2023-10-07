package svc

import (
	"context"
	"otomo/internal/app/model"
)

type MessageAnalysisService interface {
	ExtractPlacesFromMsg(
		ctx context.Context,
		msg *model.Message,
	) (analyzedLoc []*model.ExtractedPlace, err error)
}
