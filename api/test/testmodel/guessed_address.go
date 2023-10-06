package testmodel

import (
	"otomo/internal/app/model"
	"otomo/test/testutil"
)

type guessedAddressFactory struct{}

var GuessedAddressFactory = &guessedAddressFactory{}

func (f *guessedAddressFactory) New() *model.GuessedAddress {
	return &model.GuessedAddress{
		Street:  testutil.Faker.Address().StreetAddress(),
		City:    testutil.Faker.Address().City(),
		State:   testutil.Faker.Address().State(),
		Zip:     testutil.Faker.Address().PostCode(),
		Country: testutil.Faker.Address().Country(),
	}
}
