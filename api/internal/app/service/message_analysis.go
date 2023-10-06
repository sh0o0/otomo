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
	placeExSvc svc.PlaceExtractionService
	geoSvc     svc.GeocodingService
}

func NewMessageAnalysisService(
	locExSvc svc.PlaceExtractionService,
	geoSvc svc.GeocodingService,
) *MessageAnalysisService {
	return &MessageAnalysisService{
		placeExSvc: locExSvc,
		geoSvc:     geoSvc,
	}
}

func (ams *MessageAnalysisService) ExtractLocationsFromMsg(
	ctx context.Context,
	msg *model.Message,
) ([]*model.ExtractedPlace, []error, error) {
	exPlaces, err := ams.placeExSvc.FromText(ctx, msg.Text)
	if err != nil {
		return nil, nil, err
	}

	var (
		results     = []*model.ExtractedPlace{}
		geocodeErrs = []error{}
	)
	for _, exPlace := range exPlaces {
		req := &maps.GeocodingRequest{
			Address: strings.Join([]string{
				exPlace.Name,
				exPlace.Address.City,
				exPlace.Address.State,
				exPlace.Address.Country,
			}, " "),
		}
		place, err := ams.geoSvc.One(ctx, req)
		if err != nil {
			geocodeErrs = append(geocodeErrs, err)
		}
		results = append(results, &model.ExtractedPlace{
			Text:           exPlace.Name,
			GuessedAddress: exPlace.Address,
			GeocodedPlace:  conv.geocodedPlace.GoogleToModel(place),
		})
	}

	return results, geocodeErrs, nil
}
