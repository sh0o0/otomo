package testmodel

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
	"time"
)

var (
	DefaultMessageFactory          = &MessageFactory{}
	DefaultLocationAnalysisFactory = &LocationAnalysisFactory{}
)

type MessageFactory struct {
	role             model.Role
	sentAt           time.Time
	locationAnalysis *model.LocationAnalysis
}

func (f *MessageFactory) New() *model.Message {
	var (
		role             model.Role
		sentAt           time.Time
		locationAnalysis model.LocationAnalysis

		clientId = uuid.NewString()
	)

	if f.role == "" {
		role = model.UserRole
	} else {
		role = f.role
	}

	if f.sentAt.IsZero() {
		sentAt = times.C.Now()
	} else {
		sentAt = f.sentAt
	}

	if f.locationAnalysis == nil {
		locationAnalysis = *DefaultLocationAnalysisFactory.New()
	} else {
		locationAnalysis = *f.locationAnalysis
	}

	return &model.Message{
		ID:               model.MessageID(uuid.NewString()),
		Text:             testutil.Faker.Lorem().Sentence(10),
		Role:             role,
		SentAt:           sentAt,
		ClientID:         &clientId,
		LocationAnalysis: locationAnalysis,
	}
}

func (f *MessageFactory) Role(role model.Role) *MessageFactory {
	newF := *f
	newF.role = role
	return &newF
}

func (f *MessageFactory) SentAt(t time.Time) *MessageFactory {
	newF := *f
	newF.sentAt = t
	return &newF
}

func (f *MessageFactory) LocationAnalysis(la *model.LocationAnalysis) *MessageFactory {
	newF := *f
	newF.locationAnalysis = la
	return &newF
}

type LocationAnalysisFactory struct {
	analyzedAt time.Time
}

func (f *LocationAnalysisFactory) New() *model.LocationAnalysis {
	var analyzedAt *time.Time

	if f.analyzedAt.IsZero() {
		analyzedAt = nil
	} else {
		analyzedAt = &f.analyzedAt
	}
	return &model.LocationAnalysis{
		AnalyzedAt: analyzedAt,
		Locations: []*model.AnalyzedLocation{
			{
				Text:     testutil.Faker.Address().City(),
				Location: DefaultLocationFactory.New(),
			},
		},
	}
}

func (f *LocationAnalysisFactory) AnalyzedAt(t time.Time) *LocationAnalysisFactory {
	newF := *f
	newF.analyzedAt = t
	return &newF
}
