package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
)

type OtomoFactory struct {
	userID model.UserID
}

var DefaultOtomoFactory = &OtomoFactory{}

func (f *OtomoFactory) New() *model.Otomo {
	newF := *f

	if newF.userID == "" {
		newF.userID = model.UserID(uuid.NewString())
	}

	return &model.Otomo{
		UserID: newF.userID,
		Memory: model.Memory{
			Summary: testutil.Faker.Lorem().Sentence(10),
		},
		Profile: *DefaultOtomoProfileFactory.Language("ja").New(),
	}
}

func (f *OtomoFactory) UserID(userID model.UserID) *OtomoFactory {
	newF := *f
	newF.userID = userID
	return &newF
}
