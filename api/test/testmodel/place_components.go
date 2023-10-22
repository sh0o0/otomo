package testmodel

import (
	"otomo/internal/app/model"
	"otomo/test/testutil"
)

type placeComponentsFactory struct{}

var PlaceComponentsFactory = &placeComponentsFactory{}

func (f *placeComponentsFactory) New() *model.PlaceComponents {
	return &model.PlaceComponents{
		Locality:           testutil.Faker.Address().City(),
		AdministrativeArea: testutil.Faker.Address().State(),
		Country:            testutil.Faker.Address().Country(),
	}
}
