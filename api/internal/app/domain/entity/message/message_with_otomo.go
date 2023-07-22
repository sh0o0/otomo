package message

import (
	"otomo/pkg/uuid"
	"time"
)

type MessageWithOtomoID string

type Role int

const (
	UserRole Role = iota + 1
	OtomoRole
)

type MessageWithOtomo struct {
	ID       MessageWithOtomoID
	Sender   Role
	Receiver Role
	Text     string
	SentAt   time.Time
}

func NewMessageWithOtomo(
	Sender Role,
	Receiver Role,
	Text string,
) *MessageWithOtomo {
	return &MessageWithOtomo{
		ID:       MessageWithOtomoID(uuid.NewString()),
		Sender:   Sender,
		Receiver: Receiver,
		Text:     Text,
		SentAt:   time.Now(),
	}
}

func RestoreMessageWithOtomo(
	ID MessageWithOtomoID,
	Sender Role,
	Receiver Role,
	Text string,
	sentAt time.Time,
) *MessageWithOtomo {
	return &MessageWithOtomo{
		ID:       ID,
		Sender:   Sender,
		Receiver: Receiver,
		Text:     Text,
		SentAt:   sentAt,
	}
}
