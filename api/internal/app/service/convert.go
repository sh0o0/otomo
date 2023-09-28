package service

import (
	"otomo/internal/app/model"

	"googlemaps.github.io/maps"
)

var conv = &converter{}

type converter struct {
	location convLocation
}

type convLocation struct{}

func (convLocation) GoogleToModel(gGeo *maps.GeocodingResult) model.Location {
	return model.Location{
		GooglePlaceID: gGeo.PlaceID,
		Address:       gGeo.FormattedAddress,
		Types:         gGeo.Types,
		Geometry: model.Geometry{
			LatLng: model.LatLng{
				Lat: gGeo.Geometry.Location.Lat,
				Lng: gGeo.Geometry.Location.Lng,
			},
		},
	}
}

func (convLocation) GoogleToModelList(gGeos []*maps.GeocodingResult) []model.Location {
	locs := make([]model.Location, len(gGeos))
	for i, g := range gGeos {
		locs[i] = convLocation{}.GoogleToModel(g)
	}
	return locs
}
