package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"strings"

	"googlemaps.github.io/maps"
)

var _ svc.MessageAnalysisService = (*MessageAnalysisService)(nil)

// TODO: Add tests

type MessageAnalysisService struct {
	locExSvc svc.LocationExtractionService
	geoSvc   svc.GeocodingService
}

func NewMessageAnalysisService(
	locExSvc svc.LocationExtractionService,
	geoSvc svc.GeocodingService,
) *MessageAnalysisService {
	return &MessageAnalysisService{
		locExSvc: locExSvc,
		geoSvc:   geoSvc,
	}
}

func (ams *MessageAnalysisService) ExtractLocationsFromMsg(
	ctx context.Context,
	msg *model.Message,
) ([]*model.AnalyzedLocation, error) {
	exLocs, err := ams.locExSvc.FromText(ctx, msg.Text)
	if err != nil {
		return nil, err
	}

	var results = []*model.AnalyzedLocation{}
	for _, exLoc := range exLocs {
		req := &maps.GeocodingRequest{
			Address: strings.Join([]string{
				exLoc.Name,
				exLoc.Address.City,
				exLoc.Address.State,
				exLoc.Address.Country,
			}, " "),
		}
		loc, err := ams.geoSvc.One(ctx, req)
		if err != nil {
			return nil, err
		}
		results = append(results, &model.AnalyzedLocation{
			Text:     exLoc.Name,
			Location: conv.location.GoogleToModel(loc),
		})
	}

	return results, nil
}
