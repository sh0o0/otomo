package model

import (
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"time"
)

type MessageID string

type Message struct {
	ID       MessageID `firestore:"id"`
	ClientID *string   `firestore:"client_id"`
	Text     string    `firestore:"text"`
	Role     Role      `firestore:"role"`
	SentAt   time.Time `firestore:"sent_at"`
}

// TODO: Add test
func (m *Message) RoleIs(role Role) bool {
	return m.Role == role
}

type Role string

const (
	UserRole  Role = "user"
	OtomoRole Role = "otomo"
)

type MessageFactory struct{}

func NewMessageFactory() *MessageFactory {
	return &MessageFactory{}
}

func (*MessageFactory) New(
	text string,
	role Role,
	clientID *string,
) (*Message, error) {
	return &Message{
		ID:       MessageID(uuid.NewString()),
		ClientID: clientID,
		Text:     text,
		Role:     role,
		SentAt:   times.C.Now(),
	}, nil
}
