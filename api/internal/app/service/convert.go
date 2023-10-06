package service

import (
	"otomo/internal/app/model"

	"googlemaps.github.io/maps"
)

var conv = &converter{}

type converter struct {
	geocodedPlace convGeocodedPlace
}

type convGeocodedPlace struct{}

func (convGeocodedPlace) GoogleToModel(
	gGeo *maps.GeocodingResult,
) *model.GeocodedPlace {
	return &model.GeocodedPlace{
		GooglePlaceID: gGeo.PlaceID,
		LatLng: model.LatLng{
			Lat: gGeo.Geometry.Location.Lat,
			Lng: gGeo.Geometry.Location.Lng,
		},
	}
}

func (c convGeocodedPlace) GoogleToModelList(
	gGeos []*maps.GeocodingResult,
) []*model.GeocodedPlace {
	places := make([]*model.GeocodedPlace, len(gGeos))
	for i, g := range gGeos {
		places[i] = c.GoogleToModel(g)
	}
	return places
}
