package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
)

type LocationFactory struct{}

var DefaultLocationFactory = &LocationFactory{}

func (f *LocationFactory) New() model.Location {
	return model.Location{
		GooglePlaceID: uuid.NewString(),
		Address:       testutil.Faker.Address().StreetAddress(),
		Types:         []string{"street_address"},
		Geometry: model.Geometry{
			LatLng: model.LatLng{
				Lat: testutil.Faker.Address().Latitude(),
				Lng: testutil.Faker.Address().Longitude(),
			},
		},
	}

}
