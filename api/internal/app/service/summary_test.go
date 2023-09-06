package service

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"testing"
	"time"

	"github.com/tmc/langchaingo/llms/openai"
)

func newSummaryService() (*SummaryService, error) {
	// Must set OPENAI_API_KEY
	chat, err := openai.NewChat()
	if err != nil {
		return nil, err
	}
	return NewSummaryService(chat), nil
}

func TestSystem_SummaryService_Summarize(t *testing.T) {
	t.Skip("System test")

	var (
		ctx  = context.Background()
		msgs = []*model.Message{
			{
				ID:     model.MessageID(uuid.NewString()),
				Text:   "Hello",
				Role:   model.UserRole,
				SentAt: times.C.Now(),
			},
			{
				ID:     model.MessageID(uuid.NewString()),
				Text:   "Hello! May I help you?",
				Role:   model.OtomoRole,
				SentAt: times.C.Now().Add(time.Second * 1),
			},
		}
		currentSummary = "User's name is John. User's age is 20."
	)

	s, err := newSummaryService()
	if err != nil {
		t.Fatal(err)
	}

	summary, err := s.Summarize(ctx, msgs, currentSummary)
	if err != nil {
		t.Fatal(err)
	}

	t.Log(summary)
}
