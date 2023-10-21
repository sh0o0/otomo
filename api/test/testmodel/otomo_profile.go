package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
)

type OtomoProfileFactory struct {
	userID   model.UserID
	language string
}

var DefaultOtomoProfileFactory = &OtomoProfileFactory{}

func (f *OtomoProfileFactory) New() *model.OtomoProfile {
	newF := *f

	if newF.userID == "" {
		newF.userID = model.UserID(uuid.NewString())
	}

	return &model.OtomoProfile{
		UserID:   newF.userID,
		Language: newF.language,
	}
}

func (f *OtomoProfileFactory) UserID(userID model.UserID) *OtomoProfileFactory {
	newF := *f
	newF.userID = userID
	return &newF
}

func (f *OtomoProfileFactory) Language(language string) *OtomoProfileFactory {
	newF := *f
	newF.language = language
	return &newF
}
