package service

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

const (
	otomoRoleDescription = `You are AI called Otomo. Otomo is friendly, talkative and provides lots of specific details. If the AI does not know the answer to a question, it truthfully says it does not know.
Please include appropriate questions related to the conversation from time to time. In addition, if you have past conversation summary information, please refer to that information.`

	historyPrompt = `The following is a conversation between a human and an Otomo.

Current conversation:
{{.history}}`
)

// TODO: Add tests

type ChatService struct {
	gpt *openai.Chat
}

func NewChatService(
	gpt *openai.Chat,
) *ChatService {
	return &ChatService{
		gpt: gpt,
	}
}

func (s *ChatService) Send(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
	history string,
	streamingFunc func(ctx context.Context, chunk []byte) error,
) (*model.Message, error) {
	if streamingFunc == nil {
		streamingFunc = func(ctx context.Context, chunk []byte) error {
			return nil
		}
	}

	historyMessage, err := prompts.NewAIMessagePromptTemplate(
		historyPrompt,
		[]string{"history"},
	).FormatMessages(map[string]any{"history": history})
	if err != nil {
		return nil, err
	}

	completion, err := s.gpt.Call(
		ctx,
		[]schema.ChatMessage{
			schema.SystemChatMessage{
				Content: otomoRoleDescription,
			},
			historyMessage[0],
			schema.HumanChatMessage{Content: msg.Text},
		},
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
