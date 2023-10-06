package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
)

type geocodedPlaceFactory struct{}

var GeocodedPlaceFactory = &geocodedPlaceFactory{}

func (f *geocodedPlaceFactory) New() *model.GeocodedPlace {
	return &model.GeocodedPlace{
		GooglePlaceID: uuid.NewString(),
		LatLng: model.LatLng{
			Lat: testutil.Faker.Address().Latitude(),
			Lng: testutil.Faker.Address().Longitude(),
		},
	}
}
