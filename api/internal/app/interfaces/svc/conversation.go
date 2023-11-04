package svc

import (
	"context"
	"otomo/internal/app/model"
)

type ConversationService interface {
	Respond(
		ctx context.Context,
		msg *model.Message,
		opts ConversationOptions,
	) (*ConversationResult, error)
	Message(
		ctx context.Context,
		opts ConversationOptions,
	) (*ConversationResult, error)
}

type ConversationOptions struct {
	History      string
	Personality  string
	SpeakingFunc SpeakingFunc
	Functions    []FunctionDefinition
	FunctionCall any
}

type ConversationResult struct {
	Content      string
	FunctionCall *FunctionCall
}

type FunctionCall struct {
	Name      string
	Arguments map[string]any
}

type SpeakingFunc func(context.Context, *SpokenChunk) error

type SpokenChunk struct {
	Content      string
	FunctionCall *SpokenChunkFunctionCall
	IsLast       bool
}

type SpokenChunkFunctionCall struct {
	Name      string
	Arguments string
}

type FunctionDefinition struct {
	Name        string
	Description string
	Parameters  any
}
