package service

import (
	"context"
	_ "embed"
	"encoding/json"
	"errors"
	"io"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"strings"

	openai "github.com/sashabaranov/go-openai"
)

var (
	//go:embed tell_about_places.schema.json
	tellAboutPlacesSchema []byte
	//go:embed tell_about_route.schema.json
	tellAboutRouteSchema []byte
	//go:embed tell_about_place_details.schema.json
	tellAboutPlaceDetails []byte
)

var _ model.Converser = (*ConversationServiceV2)(nil)

type ConversationServiceV2 struct {
	gpt        *openai.Client
	msgFactory *model.MessageFactory
}

func NewConversationServiceV2(gpt *openai.Client) *ConversationServiceV2 {
	return &ConversationServiceV2{
		gpt: gpt,
	}
}

func (cs *ConversationServiceV2) Respond(
	ctx context.Context,
	msg *model.Message,
	opts model.ConversationOptions,
) (*model.Message, error) {
	var history string
	if opts.Memory != nil {
		history = opts.Memory.Summary
	}

	systemPrompt := strings.Join([]string{
		opts.Personality,
		otomoCommonPromptV1,
		model.NewHistoryPrompt(history).String(),
	}, "\n")

	gptMsgs := []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleSystem,
			Content: systemPrompt,
		},
		{
			Role:    openai.ChatMessageRoleUser,
			Content: msg.Text,
		},
	}

	return cs.call(ctx, gptMsgs, opts.MessagingFunc)
}

func (cs *ConversationServiceV2) Message(
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
		model.NewHistoryPrompt(history).String(),
	}, "\n")

	gptMsgs := []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleSystem,
			Content: prompt,
		},
	}

	return cs.call(ctx, gptMsgs, opts.MessagingFunc)
}

func (cs *ConversationServiceV2) call(
	ctx context.Context,
	msgs []openai.ChatCompletionMessage,
	messagingFunc model.MessagingFunc,
) (*model.Message, error) {
	stream, err := cs.gpt.CreateChatCompletionStream(
		ctx,
		openai.ChatCompletionRequest{
			Model:    openai.GPT3Dot5Turbo,
			Messages: msgs,
			Functions: []openai.FunctionDefinition{
				{
					Name:        "tell_about_places",
					Description: "Called when the user asks for places. For example, some recommended places.",
					Parameters:  json.RawMessage(tellAboutPlacesSchema),
				},
				{
					Name:        "tell_about_route",
					Description: "Called when the user asks for a route. For example, a recommended route.",
					Parameters:  json.RawMessage(tellAboutRouteSchema),
				},
				{
					Name:        "tell_about_place_details",
					Description: "Called when the user asks for details about a place. For example, the details of a place.",
					Parameters:  json.RawMessage(tellAboutPlaceDetails),
				},
			},
		},
	)
	if err != nil {
		return nil, err
	}
	defer stream.Close()

	var (
		msgID = model.MessageID(uuid.NewString())
		role  = model.OtomoRole
	)
	fullText, err := cs.listenMessagingStream(
		ctx,
		stream,
		messagingFunc,
		msgID,
		role,
	)
	if err != nil {
		return nil, err
	}

	return cs.msgFactory.Restore(
		msgID,
		fullText,
		role,
		times.C.Now(),
		nil,
	), nil
}

func (cs *ConversationServiceV2) listenMessagingStream(
	ctx context.Context,
	stream *openai.ChatCompletionStream,
	messagingFunc model.MessagingFunc,
	msgID model.MessageID,
	role model.Role,
) (string, error) {
	var (
		fullText      string
		streamingFunc = cs.makeStreamingFunc(msgID, role, messagingFunc)
	)

	for {
		resp, err := stream.Recv()
		if err != nil {
			if errors.Is(err, io.EOF) {
				break
			}
			return "", err
		}
		chunk := resp.Choices[0].Delta

		var text string
		if chunk.Content != "" {
			text = chunk.Content
		}
		if chunk.FunctionCall != nil {
			text = chunk.FunctionCall.Arguments
		}
		if err := streamingFunc(ctx, []byte(text)); err != nil {
			return "", err
		}
		fullText += text
	}

	if err := cs.finishMessagingFunc(
		ctx, msgID, role, messagingFunc); err != nil {
		return "", err
	}

	return fullText, nil
}

func (cs *ConversationServiceV2) makeStreamingFunc(
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

func (cs *ConversationServiceV2) finishMessagingFunc(
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
