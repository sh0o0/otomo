package service

import (
	"context"
	"otomo/internal/app/model"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

const (
	respondPrompt = `The following is a friendly conversation between a user and an AI called Otomo. Otomo is talkative and provides lots of specific details from its context. If Otomo does not know the answer to a question, it truthfully says it does not know.
When Otomo mentions the name of a place, if it knows the longitude and latitude of the place, it says it in the form %[name of place]({ "type": "object", "properties": { "lat_lng": { "type": "object", "properties": { "latitude": { "type": "number" }, "longitude": { "type": "number" } } } } }). () is JSON Schema. The corresponding json is actually input. For example, Tokyo is %[Tokyo]({ "lat_lng": { "latitude": 35.6762, "longitude": 139.6503 } }).

Current conversation:
{{.history}}
User: {{.input}}
Otomo:`

// 	messagePrompt = `The following is a friendly conversation between a user and an AI called Otomo. Otomo is talkative and provides lots of specific details from its context. If Otomo does not know the answer to a question, it truthfully says it does not know.
// When Otomo mentions the name of a place, if it knows the longitude and latitude of the place, it says it in the form %[name of place]({ "type": "object", "properties": { "lat_lng": { "type": "object", "properties": { "latitude": { "type": "number" }, "longitude": { "type": "number" } } } } }). () is JSON Schema. The corresponding json is actually input. For example, Tokyo is %[Tokyo]({ "lat_lng": { "latitude": 35.6762, "longitude": 139.6503 } }).

// Current conversation:
// {{.history}}
// User: {{.input}}
// Otomo:`
)

var _ model.Converser = (*ConversationService)(nil)

type ConversationService struct {
	gpt        *openai.Chat
	msgFactory *model.MessageFactory
}

func NewConversationService(gpt *openai.Chat) *ConversationService {
	return &ConversationService{
		gpt: gpt,
	}
}

func (cs *ConversationService) Respond(
	ctx context.Context,
	msg *model.Message,
	memory *model.Memory,
	listeningFunc func(ctx context.Context, chunk []byte) error,
) (*model.Message, error) {
	gptMsg, err := prompts.NewHumanMessagePromptTemplate(
		respondPrompt,
		[]string{"history", "input"},
	).FormatMessages(
		map[string]any{"history": memory.Summary, "input": msg.Text},
	)
	if err != nil {
		return nil, err
	}

	return cs.call(ctx, gptMsg, listeningFunc)
}

func (cs *ConversationService) Message(
	ctx context.Context,
	memory *model.Memory,
	listeningFunc func(ctx context.Context, chunk []byte) error,
) (*model.Message, error) {
	panic("not implemented")
}

func (cs *ConversationService) call(
	ctx context.Context,
	msgs []schema.ChatMessage,
	listeningFunc func(ctx context.Context, chunk []byte) error,
) (*model.Message, error) {
	if listeningFunc == nil {
		listeningFunc = func(ctx context.Context, chunk []byte) error {
			return nil
		}
	}

	completion, err := cs.gpt.Call(
		ctx,
		msgs,
		llms.WithStreamingFunc(listeningFunc),
	)
	if err != nil {
		return nil, err
	}

	return cs.msgFactory.New(completion.GetContent(), model.OtomoRole)
}
