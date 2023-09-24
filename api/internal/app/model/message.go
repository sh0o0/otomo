package model

import (
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"time"
)

type MessageID string

type Message struct {
	ID               MessageID        `firestore:"id"`
	ClientID         *string          `firestore:"client_id"`
	Text             string           `firestore:"text"`
	Role             Role             `firestore:"role"`
	SentAt           time.Time        `firestore:"sent_at"`
	LocationAnalysis LocationAnalysis `firestore:"location_analysis"`
}

// TODO: Add test
func (m *Message) RoleIs(role Role) bool {
	return m.Role == role
}

func (m *Message) SetLocationAnalysis(la LocationAnalysis) *Message {
	newM := *m
	newM.LocationAnalysis = la
	return &newM
}

type AnalyzedLocation struct {
	Text     string   `firestore:"text"`
	Location Location `firestore:"location"`
}

type LocationAnalysis struct {
	Locations  []*AnalyzedLocation `firestore:"locations"`
	AnalyzedAt *time.Time          `firestore:"analyzed_at"`
}

func NewLocationAnalysis(
	locs []*AnalyzedLocation,
	analyzedAt *time.Time,
) LocationAnalysis {
	return LocationAnalysis{
		Locations:  locs,
		AnalyzedAt: analyzedAt,
	}
}

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
		Text:     text,
		Role:     role,
		SentAt:   times.C.Now(),
		ClientID: clientID,
	}, nil
}

func (*MessageFactory) Restore(
	id MessageID,
	text string,
	role Role,
	sentAt time.Time,
	clientID *string,
) *Message {
	return &Message{
		ID:       id,
		Text:     text,
		Role:     role,
		SentAt:   sentAt,
		ClientID: clientID,
	}
}

type MessageChunk struct {
	MessageID MessageID
	Text      string
	Role      Role
	SentAt    time.Time
	ClientID  *string
	IsLast    bool
}

func NewMessageChunk(
	messageID MessageID,
	text string,
	role Role,
	sentAt time.Time,
	clientID *string,
	isLast bool,
) (*MessageChunk, error) {
	return &MessageChunk{
		MessageID: messageID,
		Text:      text,
		Role:      role,
		SentAt:    sentAt,
		ClientID:  clientID,
		IsLast:    isLast,
	}, nil
}

type Role string

const (
	UserRole  Role = "user"
	OtomoRole Role = "otomo"
)
