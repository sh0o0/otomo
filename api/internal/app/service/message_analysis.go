package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"

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

func (ams *MessageAnalysisService) ExtractPlacesFromMsg(
	ctx context.Context,
	msg *model.Message,
) ([]*model.ExtractedPlace, error) {
	exPlaces, err := ams.placeExSvc.FromText(ctx, msg.Text)
	if err != nil {
		return nil, err
	}

	var (
		results = []*model.ExtractedPlace{}
	)
	for _, exPlace := range exPlaces {
		req := &maps.GeocodingRequest{
			Address: exPlace.Name,
		}
		place, err := ams.geoSvc.One(ctx, req)
		if err != nil {
			errStr := err.Error()
			results = append(results, &model.ExtractedPlace{
				Text:           exPlace.Name,
				GuessedAddress: exPlace.Address,
				GeocodedError:  &errStr,
			})

		} else {
			results = append(results, &model.ExtractedPlace{
				Text:           exPlace.Name,
				GuessedAddress: exPlace.Address,
				GeocodedPlace:  conv.geocodedPlace.GoogleToModel(place),
			})
		}
	}

	return results, nil
}
