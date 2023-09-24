package testmodel

import (
	"otomo/internal/app/model"
	"otomo/test/testutil"
)

type TestChatFactory struct{}

var DefaultTestChatFactory = &TestChatFactory{}

func (f *TestChatFactory) Fake() *model.Chat {
	return &model.Chat{
		Summary: testutil.Faker.Lorem().Sentence(10),
	}
}
