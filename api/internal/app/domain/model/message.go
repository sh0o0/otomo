package model

import (
	"otomo/pkg/times"
	"otomo/pkg/uuid"
	"time"
)

type Message struct {
	ID       string    `json:"id"`
	UserID   string    `json:"user_id"`
	Text     string    `json:"text"`
	Sender   Role      `json:"sender"`
	Receiver Role      `json:"receiver"`
	SentAt   time.Time `json:"sent_at"`
}

func NewMessage(
	userID string,
	text string,
	sender Role,
	receiver Role,
) *Message {
	return &Message{
		ID:       uuid.NewString(),
		UserID:   userID,
		Text:     text,
		Sender:   sender,
		Receiver: receiver,
		SentAt:   times.C.Now(),
	}
}

type Role string

const (
	UserRole  Role = "user"
	OtomoRole Role = "otomo"
)
