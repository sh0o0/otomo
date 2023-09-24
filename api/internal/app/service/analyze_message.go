package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
)

type AnalyzeMessageService struct {
	locExSvc svc.LocationExtractionService
	geoSvc   svc.GeocodingService
}

func NewAnalyzeMessageService(
	locExSvc svc.LocationExtractionService,
	geoSvc svc.GeocodingService,
) *AnalyzeMessageService {
	return &AnalyzeMessageService{
		locExSvc: locExSvc,
		geoSvc:   geoSvc,
	}
}

func (ams *AnalyzeMessageService) ExtractLocationsFromMsg(
	ctx context.Context,
	msg *model.Message,
) ([]*model.Location, error) {
	panic("not implemented")
}
