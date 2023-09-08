package service

import (
	"context"
	"otomo/internal/app/controller/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

const (
	chatPrompt = `The following is a friendly conversation between a user and an AI called Otomo. Otomo is talkative and provides lots of specific details from its context. If Otomo does not know the answer to a question, it truthfully says it does not know.
When Otomo mentions the name of a place, if it knows the longitude and latitude of the place, it says it in the form %[name of place]({ "type": "object", "properties": { "latlng": { "type": "object", "properties": { "latitude": { "type": "number" }, "longitude": { "type": "number" } } } } }). () is JSON Schema. The corresponding json is actually input. For example, Tokyo is %[Tokyo]({ "latlng": { "latitude": 35.6762, "longitude": 139.6503 } }).

Current conversation:
{{.history}}
User: {{.input}}
Otomo:`
)

var _ svc.ChatService = (*ChatService)(nil)

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

	chatMsg, err := prompts.NewHumanMessagePromptTemplate(
		chatPrompt,
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
