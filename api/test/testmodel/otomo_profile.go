package testmodel

import (
	"otomo/internal/app/model"
)

type OtomoProfileFactory struct {
	language string
}

var DefaultOtomoProfileFactory = &OtomoProfileFactory{}

func (f *OtomoProfileFactory) New() *model.OtomoProfile {
	newF := *f

	return &model.OtomoProfile{
		Language: newF.language,
	}
}

func (f *OtomoProfileFactory) Language(language string) *OtomoProfileFactory {
	newF := *f
	newF.language = language
	return &newF
}
