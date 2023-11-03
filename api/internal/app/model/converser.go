package model

import (
	"context"
	"time"
)

type ConversationResult struct {
	MsgID        MessageID
	Role         Role
	SentAt       time.Time
	Content      string
	FunctionCall *ConversationFunctionCallResult
}

type ConversationFunctionCallResult struct {
	Name      string
	Arguments map[string]any
}

type Converser interface {
	Respond(
		ctx context.Context,
		msg *Message,
		opts ConversationOptions,
	) (*ConversationResult, error)
	Message(
		ctx context.Context,
		opts ConversationOptions,
	) (*ConversationResult, error)
}

type ConversationOptions struct {
	Memory        *Memory
	Personality   string
	MessagingFunc MessagingFunc
}

type MessagingFunc func(context.Context, *MessageChunk) error
