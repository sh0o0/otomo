package model

import (
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
)

// TODO: Add tests

type MessageFactory struct{}

func NewMessageFactory() *MessageFactory {
	return &MessageFactory{}
}

func (*MessageFactory) NewMessage(
	text string,
	role Role,
) (*Message, error) {
	return &Message{
		ID:     MessageID(uuid.NewString()),
		Text:   text,
		Role:   role,
		SentAt: times.C.Now(),
	}, nil
}
