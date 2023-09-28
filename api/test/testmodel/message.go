package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
	"time"
)

type MessageFactory struct{}

var DefaultMessageFactory = &MessageFactory{}

func (f *MessageFactory) Role(role model.Role) *model.Message {
	clientId := uuid.NewString()
	return &model.Message{
		ID:       model.MessageID(uuid.NewString()),
		Text:     testutil.Faker.Lorem().Sentence(10),
		Role:     role,
		SentAt:   times.C.Now(),
		ClientID: &clientId,
		LocationAnalysis: model.LocationAnalysis{
			Locations: []*model.AnalyzedLocation{
				{
					Text:     testutil.Faker.Address().City(),
					Location: DefaultLocationFactory.New(),
				},
			},
		},
	}
}

func (f *MessageFactory) SentAt(sentAt time.Time) *model.Message {
	clientId := uuid.NewString()
	return &model.Message{
		ID:       model.MessageID(uuid.NewString()),
		Text:     testutil.Faker.Lorem().Sentence(10),
		Role:     model.UserRole,
		SentAt:   sentAt,
		ClientID: &clientId,
		LocationAnalysis: model.LocationAnalysis{
			Locations: []*model.AnalyzedLocation{
				{
					Text:     testutil.Faker.Address().City(),
					Location: DefaultLocationFactory.New(),
				},
			},
		},
	}
}

func (f *MessageFactory) Times(t time.Time) *model.Message {
	clientId := uuid.NewString()
	return &model.Message{
		ID:       model.MessageID(uuid.NewString()),
		Text:     testutil.Faker.Lorem().Sentence(10),
		Role:     model.UserRole,
		SentAt:   t,
		ClientID: &clientId,
		LocationAnalysis: model.LocationAnalysis{
			AnalyzedAt: &t,
			Locations: []*model.AnalyzedLocation{
				{
					Text:     testutil.Faker.Address().City(),
					Location: DefaultLocationFactory.New(),
				},
			},
		},
	}
}
