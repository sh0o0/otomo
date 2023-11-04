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
	History       string
	Personality   string
	MessagingFunc MessagingFunc
}

type ConversationResult struct {
	Content      string
	FunctionCall *ConversationFunctionCallResult
}

type ConversationFunctionCallResult struct {
	Name      string
	Arguments map[string]any
}

type MessagingFunc func(context.Context, *MessagingChunk) error

type MessagingChunk struct {
	Content      string
	FunctionCall *ConversationFunctionCallResult
	IsLast       bool
}

type ConversationFunctionDefinition struct {
	Name        string
	Description string
	Parameters  any
}
