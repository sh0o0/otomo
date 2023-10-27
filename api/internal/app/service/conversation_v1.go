package service

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"strings"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

var (
	otomoCommonPromptV1 = `You provides lots of specific details from its context. If You do not know the answer to a question, you truthfully says you do not know.`

	messagePromptV1 = `The conversation currently stops at your message, so please create a message that you think will be of interest to the User. You may refer to the information in the Current Conversation below, or if there is no information in the Current Conversation, compose a message on a topic of interest to the new User. Start the conversation with a greeting.`

	historyPromptV1 = `The following is a conversation between a user and you.

Current conversation:
{{.history}}`
)

var _ model.Converser = (*ConversationServiceV1)(nil)

// TODO: Add tests
type ConversationServiceV1 struct {
	gpt        *openai.Chat
	msgFactory *model.MessageFactory
}

func NewConversationServiceV1(gpt *openai.Chat) *ConversationServiceV1 {
	return &ConversationServiceV1{
		gpt: gpt,
	}
}

func (cs *ConversationServiceV1) Respond(
	ctx context.Context,
	msg *model.Message,
	opts model.ConversationOptions,
) (*model.Message, error) {
	var history string
	if opts.Memory != nil {
		history = opts.Memory.Summary
	}

	prompt := strings.Join([]string{
		opts.Personality,
		otomoCommonPromptV1,
		historyPromptV1,
	}, "\n")
	systemMsgs, err := prompts.NewSystemMessagePromptTemplate(
		prompt,
		[]string{"history"},
	).FormatMessages(
		map[string]any{"history": history},
	)
	if err != nil {
		return nil, err
	}
	userMsg := schema.HumanChatMessage{Content: msg.Text}
	gptMsgs := []schema.ChatMessage{systemMsgs[0], userMsg}

	return cs.call(ctx, gptMsgs, opts.MessagingFunc)
}

func (cs *ConversationServiceV1) Message(
	ctx context.Context,
	opts model.ConversationOptions,
) (*model.Message, error) {
	var history string
	if opts.Memory != nil {
		history = opts.Memory.Summary
	}

	prompt := strings.Join([]string{
		opts.Personality,
		otomoCommonPromptV1,
		messagePromptV1,
		historyPromptV1,
	}, "\n")
	gptMsgs, err := prompts.NewSystemMessagePromptTemplate(
		prompt,
		[]string{"history"},
	).FormatMessages(map[string]any{"history": history})
	if err != nil {
		return nil, err
	}

	return cs.call(ctx, gptMsgs, opts.MessagingFunc)
}

func (cs *ConversationServiceV1) call(
	ctx context.Context,
	msgs []schema.ChatMessage,
	messagingFunc model.MessagingFunc,
) (*model.Message, error) {
	var (
		msgID = model.MessageID(uuid.NewString())
		role  = model.OtomoRole
	)

	completion, err := cs.gpt.Call(
		ctx,
		msgs,
		llms.WithStreamingFunc(
			cs.makeStreamingFunc(msgID, role, messagingFunc)),
	)
	if err != nil {
		return nil, err
	}

	if err := cs.finishMessagingFunc(ctx, msgID, role, messagingFunc); err != nil {
		return nil, err
	}

	return cs.msgFactory.Restore(
		msgID,
		completion.GetContent(),
		role,
		times.C.Now(),
		nil,
	), nil
}

func (cs *ConversationServiceV1) makeStreamingFunc(
	newMsgID model.MessageID,
	newMsgRole model.Role,
	messagingFunc model.MessagingFunc,
) func(context.Context, []byte) error {
	if messagingFunc == nil {
		return func(_ context.Context, _ []byte) error {
			return nil
		}
	} else {
		return func(ctx context.Context, chunk []byte) error {
			text := string(chunk)
			msgChunk, err := model.NewMessageChunk(
				newMsgID,
				text,
				newMsgRole,
				times.C.Now(),
				nil,
				false,
			)
			if err != nil {
				return err
			}

			return messagingFunc(ctx, msgChunk)
		}
	}
}

func (cs *ConversationServiceV1) finishMessagingFunc(
	ctx context.Context,
	newMsgID model.MessageID,
	newMsgRole model.Role,
	messagingFunc model.MessagingFunc,
) error {
	if messagingFunc == nil {
		return nil
	} else {
		msgChunk, err := model.NewMessageChunk(
			newMsgID,
			"",
			newMsgRole,
			times.C.Now(),
			nil,
			true,
		)
		if err != nil {
			return err
		}

		return messagingFunc(ctx, msgChunk)
	}
}
