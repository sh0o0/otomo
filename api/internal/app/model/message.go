package model

import (
	"time"
)

type MessageID string

type Message struct {
	ID     MessageID `firestore:"id"`
	Text   string    `firestore:"text"`
	Role   Role      `firestore:"role"`
	SentAt time.Time `firestore:"sent_at"`
}

type Role string

const (
	UserRole  Role = "user"
	OtomoRole Role = "otomo"
)
