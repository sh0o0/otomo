package model

import (
	"context"
)

type MessagingFunc func(context.Context, *MessageChunk) error

type Otomo struct {
	UserID  UserID       `firestore:"user_id"`
	Memory  Memory       `firestore:"memory"`
	Profile OtomoProfile `firestore:"profile"`
}

func RestoreOtomo(
	userID UserID,
	memory Memory,
	profile OtomoProfile,
) (*Otomo, error) {
	return &Otomo{
		UserID:  userID,
		Memory:  memory,
		Profile: profile,
	}, nil
}

type Memory struct {
	Summary string `firestore:"summary"`
}

func NewMemory(
	summary string,
) *Memory {
	return &Memory{
		Summary: summary,
	}
}
