package model

import (
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

type Role string

const (
	UserRole  Role = "user"
	OtomoRole Role = "otomo"
)
