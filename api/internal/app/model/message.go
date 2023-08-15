package model

import (
	"time"
)

type Message struct {
	ID       string    `firestore:"id"`
	UserID   string    `firestore:"user_id"`
	Text     string    `firestore:"text"`
	Sender   Role      `firestore:"sender"`
	Receiver Role      `firestore:"receiver"`
	SentAt   time.Time `firestore:"sent_at"`
}

type Role string

const (
	UserRole  Role = "user"
	OtomoRole Role = "otomo"
)
