package message

import (
	"otomo/internal/app/domain/entity/user"
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
	id       MessageWithOtomoID
	userID   user.ID
	sender   Role
	receiver Role
	text     string
	sentAt   time.Time
}

func NewMessageWithOtomo(
	userID user.ID,
	Sender Role,
	Receiver Role,
	Text string,
) *MessageWithOtomo {
	return &MessageWithOtomo{
		id:       MessageWithOtomoID(uuid.NewString()),
		userID:   userID,
		sender:   Sender,
		receiver: Receiver,
		text:     Text,
		sentAt:   time.Now().Local(),
	}
}

func RestoreMessageWithOtomo(
	id MessageWithOtomoID,
	userID user.ID,
	Sender Role,
	Receiver Role,
	Text string,
	sentAt time.Time,
) *MessageWithOtomo {
	return &MessageWithOtomo{
		id:       id,
		userID:   userID,
		sender:   Sender,
		receiver: Receiver,
		text:     Text,
		sentAt:   sentAt,
	}
}

func (m *MessageWithOtomo) ID() MessageWithOtomoID { return m.id }
func (m *MessageWithOtomo) UserID() user.ID        { return m.userID }
func (m *MessageWithOtomo) Sender() Role           { return m.sender }
func (m *MessageWithOtomo) Receiver() Role         { return m.receiver }
func (m *MessageWithOtomo) Text() string           { return m.text }
func (m *MessageWithOtomo) SentAt() time.Time      { return m.sentAt }
