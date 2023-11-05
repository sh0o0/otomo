package service

import (
	"context"
	"errors"
	"io"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
	"strings"

	"github.com/sashabaranov/go-openai"
)

var _ svc.ConversationService = (*ConversationService)(nil)

type ConversationService struct {
	gpt *openai.Client
}

func NewConversationService(gpt *openai.Client) *ConversationService {
	return &ConversationService{
		gpt: gpt,
	}
}

func (cs *ConversationService) Respond(
	ctx context.Context,
	msg *model.Message,
	opts svc.ConversationOptions,
) (*svc.ConversationResult, error) {
	gptMsgs := []openai.ChatCompletionMessage{
		{
			Role: openai.ChatMessageRoleSystem,
			Content: strings.Join([]string{
				opts.Personality,
				model.OtomoCommonPrompt,
				model.NewHistoryPrompt(opts.History).String(),
			}, "\n"),
		},
		{
			Role:    openai.ChatMessageRoleUser,
			Content: msg.Text,
		},
	}

	return cs.call(ctx, gptMsgs, opts)

}

func (cs *ConversationService) Message(
	ctx context.Context,
	opts svc.ConversationOptions,
) (*svc.ConversationResult, error) {
	prompt := strings.Join([]string{
		opts.Personality,
		model.OtomoCommonPrompt,
		model.MessagePrompt,
		model.NewHistoryPrompt(opts.History).String(),
	}, "\n")

	gptMsgs := []openai.ChatCompletionMessage{
		{
			Role:    openai.ChatMessageRoleSystem,
			Content: prompt,
		},
	}

	return cs.call(ctx, gptMsgs, opts)
}

func (cs *ConversationService) call(
	ctx context.Context,
	msgs []openai.ChatCompletionMessage,
	opts svc.ConversationOptions,
) (*svc.ConversationResult, error) {
	stream, err := cs.gpt.CreateChatCompletionStream(
		ctx,
		openai.ChatCompletionRequest{
			Model:        openai.GPT3Dot5Turbo,
			Messages:     msgs,
			Functions:    cs.convertFunctionDefinitions(opts.Functions),
			FunctionCall: opts.FunctionCall,
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
		opts.SpeakingFunc,
		msgID,
		role,
	)
}

func (cs *ConversationService) listenMessagingStream(
	ctx context.Context,
	stream *openai.ChatCompletionStream,
	speakingFunc svc.SpeakingFunc,
	msgID model.MessageID,
	role model.Role,
) (*svc.ConversationResult, error) {
	var (
		fullContent  string
		fullFuncCall *svc.FunctionCall
	)

	for {
		resp, err := stream.Recv()
		if err != nil {
			if errors.Is(err, io.EOF) {
				break
			}
			return nil, err
		}
		chunk := resp.Choices[0].Delta

		fullContent += chunk.Content
		if chunk.FunctionCall != nil {
			if fullFuncCall == nil {
				fullFuncCall = &svc.FunctionCall{
					Name:      chunk.FunctionCall.Name,
					Arguments: chunk.FunctionCall.Arguments,
				}
			} else {
				fullFuncCall.Arguments += chunk.FunctionCall.Arguments
			}
		}

		if speakingFunc != nil {
			c := cs.convertChunk(chunk, false)
			if err := speakingFunc(ctx, c); err != nil {
				return nil, err
			}
		}
	}

	if speakingFunc != nil {
		c := &svc.SpokenChunk{IsLast: true}
		if err := speakingFunc(ctx, c); err != nil {
			return nil, err
		}
	}

	return &svc.ConversationResult{
		Content:      fullContent,
		FunctionCall: fullFuncCall,
	}, nil
}

func (cs *ConversationService) convertChunk(
	chunk openai.ChatCompletionStreamChoiceDelta,
	isLast bool,
) *svc.SpokenChunk {
	var funcCall *svc.SpokenChunkFunctionCall
	if chunk.FunctionCall != nil {
		funcCall = &svc.SpokenChunkFunctionCall{
			Name:      chunk.FunctionCall.Name,
			Arguments: chunk.FunctionCall.Arguments,
		}
	}
	return &svc.SpokenChunk{
		Content:      chunk.Content,
		FunctionCall: funcCall,
		IsLast:       isLast,
	}
}

func (cs *ConversationService) convertFunctionDefinitions(
	fds []svc.FunctionDefinition,
) []openai.FunctionDefinition {
	result := make([]openai.FunctionDefinition, len(fds))

	for i, fd := range fds {
		result[i] = openai.FunctionDefinition{
			Name:        fd.Name,
			Description: fd.Description,
			Parameters:  fd.Parameters,
		}
	}

	return result
}
