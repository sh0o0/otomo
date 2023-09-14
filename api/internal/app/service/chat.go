package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

var _ svc.ChatService = (*ChatService)(nil)

// TODO: Add tests

// Deprecated: Use ConversationService instead
type ChatService struct {
	gpt *openai.Chat
}

// Deprecated: Use ConversationService instead
func NewChatService(
	gpt *openai.Chat,
) *ChatService {
	return &ChatService{
		gpt: gpt,
	}
}

func (s *ChatService) Send(
	ctx context.Context,
	msg *model.Message,
	history string,
	streamingFunc func(ctx context.Context, chunk []byte) error,
) (*model.Message, error) {
	if streamingFunc == nil {
		streamingFunc = func(ctx context.Context, chunk []byte) error {
			return nil
		}
	}

	chatMsg, err := prompts.NewHumanMessagePromptTemplate(
		respondPrompt,
		[]string{"history", "input"},
	).FormatMessages(map[string]any{"history": history, "input": msg.Text})
	if err != nil {
		return nil, err
	}

	completion, err := s.gpt.Call(
		ctx,
		[]schema.ChatMessage{chatMsg[0]},
		llms.WithStreamingFunc(streamingFunc),
	)
	if err != nil {
		return nil, err
	}

	return &model.Message{
		ID:     model.MessageID(uuid.NewString()),
		Text:   completion.GetContent(),
		Role:   model.OtomoRole,
		SentAt: times.C.Now(),
	}, nil
}
