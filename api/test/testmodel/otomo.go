package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
)

type TestOtomoFactory struct {
	userID model.UserID
}

var DefaultTestOtomoFactory = &TestOtomoFactory{}

func (f *TestOtomoFactory) New() *model.Otomo {
	newF := *f

	if newF.userID == "" {
		newF.userID = model.UserID(uuid.NewString())
	}

	return &model.Otomo{
		UserID: newF.userID,
		Memory: model.Memory{
			Summary: testutil.Faker.Lorem().Sentence(10),
		},
	}
}

func (f *TestOtomoFactory) UserID(userID model.UserID) *TestOtomoFactory {
	newF := *f
	newF.userID = userID
	return &newF
}
