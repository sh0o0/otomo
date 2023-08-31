package testmodel

import (
	"otomo/internal/app/model"

	"github.com/jaswdr/faker"
)

type TestChatFactory struct{}

var DefaultTestChatFactory = &TestChatFactory{}

func (f *TestChatFactory) Fake() *model.Chat {
	return &model.Chat{
		Summary: faker.New().Lorem().Sentence(10),
	}
}
