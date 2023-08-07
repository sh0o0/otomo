package model

import (
	"otomo/pkg/times"
	"otomo/pkg/uuid"
)

type MessageFactory struct{}

func NewMessageFactory() *MessageFactory {
	return &MessageFactory{}
}

func (*MessageFactory) NewMessage(
	userID string,
	text string,
	sender Role,
	receiver Role,
) (*Message, error) {
	return &Message{
		ID:       uuid.NewString(),
		UserID:   userID,
		Text:     text,
		Sender:   sender,
		Receiver: receiver,
		SentAt:   times.C.Now(),
	}, nil
}
