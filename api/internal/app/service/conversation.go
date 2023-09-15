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
	otomoCommonPrompt = `The following is a friendly conversation between a user and an AI called Otomo. Otomo is talkative and provides lots of specific details from its context. If Otomo does not know the answer to a question, it truthfully says it does not know.
When Otomo mentions the name of a place, if it knows the longitude and latitude of the place, it says it in the form %[name of place]({ "type": "object", "properties": { "lat_lng": { "type": "object", "properties": { "latitude": { "type": "number" }, "longitude": { "type": "number" } } } } }). () is JSON Schema. The corresponding json is actually input. For example, Tokyo is %[Tokyo]({ "lat_lng": { "latitude": 35.6762, "longitude": 139.6503 } }).`

	respondPrompt = otomoCommonPrompt + `

Current conversation:
{{.history}}

User: {{.input}}
Otomo:`

	messagePrompt = otomoCommonPrompt + `
The conversation currently stops at your message, so please create a message that you think will be of interest to the User. You may refer to the information in the Current Conversation below, or if there is no information in the Current Conversation, compose a message on a topic of interest to the new User. Start the conversation with a greeting.

Current conversation:
{{.history}}

Otomo:`
)

var _ model.Converser = (*ConversationService)(nil)

// TODO: Add tests
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
	gptMsgs, err := prompts.NewHumanMessagePromptTemplate(
		respondPrompt,
		[]string{"history", "input"},
	).FormatMessages(
		map[string]any{"history": memory.Summary, "input": msg.Text},
	)
	if err != nil {
		return nil, err
	}

	return cs.call(ctx, gptMsgs, listeningFunc)
}

func (cs *ConversationService) Message(
	ctx context.Context,
	memory *model.Memory,
	listeningFunc func(ctx context.Context, chunk []byte) error,
) (*model.Message, error) {
	gptMsgs, err := prompts.NewSystemMessagePromptTemplate(
		messagePrompt,
		[]string{"history"},
	).FormatMessages(map[string]any{"history": memory.Summary})
	if err != nil {
		return nil, err
	}

	return cs.call(ctx, gptMsgs, listeningFunc)
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

	return cs.msgFactory.New(completion.GetContent(), model.OtomoRole, nil)
}
