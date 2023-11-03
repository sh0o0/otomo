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

	gptMsgs := []openai.ChatCompletionMessage{
		{
			Role: openai.ChatMessageRoleSystem,
			Content: strings.Join([]string{
				opts.Personality,
				model.OtomoCommonPrompt,
				model.NewHistoryPrompt(history).String(),
			}, "\n"),
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
		model.OtomoCommonPrompt,
		model.MessagePrompt,
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
	return cs.listenMessagingStream(
		ctx,
		stream,
		messagingFunc,
		msgID,
		role,
	)
}

func (cs *ConversationServiceV2) listenMessagingStream(
	ctx context.Context,
	stream *openai.ChatCompletionStream,
	messagingFunc model.MessagingFunc,
	msgID model.MessageID,
	role model.Role,
) (*model.Message, error) {
	var (
		fullContent string
		funcName    string
		funcArgs    string
	)

	for {
		resp, err := stream.Recv()
		if err != nil {
			if errors.Is(err, io.EOF) {
				break
			}
			return nil, err
		}
		var (
			chunk   = resp.Choices[0].Delta
			funcArg string
		)

		fullContent += chunk.Content
		if chunk.FunctionCall != nil {
			funcName = chunk.FunctionCall.Name
			funcArgs += chunk.FunctionCall.Arguments

			funcArg = chunk.FunctionCall.Arguments
		}

		if messagingFunc != nil {
			msgChunk, err := model.NewMessageChunkWithStruct(
				msgID,
				role,
				times.C.Now(),
				nil,
				false,
				chunk.Content,
				funcName,
				funcArg,
			)
			if err != nil {
				return nil, err
			}

			if err := messagingFunc(ctx, msgChunk); err != nil {
				return nil, err
			}
		}
	}

	if messagingFunc != nil {
		msgChunk, err := model.NewMessageChunkWithStruct(
			msgID,
			role,
			times.C.Now(),
			nil,
			true,
			"",
			funcName,
			"",
		)
		if err != nil {
			return nil, err
		}

		if err := messagingFunc(ctx, msgChunk); err != nil {
			return nil, err
		}
	}

	return cs.msgFactory.RestoreWithContent(
		msgID,
		"TODO", // TODO: Replace
		role,
		times.C.Now(),
		nil,
		fullContent,
		funcName,
		funcArgs,
	), nil
}
