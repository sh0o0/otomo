package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
	"time"
)

type TestMessageFactory struct{}

var DefaultTestMessageFactory = &TestMessageFactory{}

func (f *TestMessageFactory) Role(role model.Role) *model.Message {
	clientId := uuid.NewString()
	return &model.Message{
		ID:       model.MessageID(uuid.NewString()),
		Text:     testutil.Faker.Lorem().Sentence(10),
		Role:     role,
		SentAt:   times.C.Now(),
		ClientID: &clientId,
	}
}

func (f *TestMessageFactory) SentAt(sentAt time.Time) *model.Message {
	clientId := uuid.NewString()
	return &model.Message{
		ID:       model.MessageID(uuid.NewString()),
		Text:     testutil.Faker.Lorem().Sentence(10),
		Role:     model.UserRole,
		SentAt:   sentAt,
		ClientID: &clientId,
	}
}
