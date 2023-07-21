package message

import "otomo/pkg/uuid"

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
	}
}

func RestoreMessageWithOtomo(
	ID MessageWithOtomoID,
	Sender Role,
	Receiver Role,
	Text string,
) *MessageWithOtomo {
	return &MessageWithOtomo{
		ID:       ID,
		Sender:   Sender,
		Receiver: Receiver,
		Text:     Text,
	}
}
