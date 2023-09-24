package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"strings"

	"googlemaps.github.io/maps"
)

// TODO: Add tests

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
	locs, err := ams.locExSvc.FromText(ctx, msg.Text)
	if err != nil {
		return nil, err
	}

	reqs := make([]*maps.GeocodingRequest, len(locs))
	for i, loc := range locs {
		reqs[i] = &maps.GeocodingRequest{
			Address: strings.Join([]string{
				loc.Name,
				loc.Address.City,
				loc.Address.State,
				loc.Address.City,
			}, " "),
		}
	}
	results, err := ams.geoSvc.List(ctx, reqs)
	if err != nil {
		return nil, err
	}

	return conv.location.GoogleToModelList(results), nil
}
