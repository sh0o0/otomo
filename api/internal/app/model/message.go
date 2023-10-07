package model

import (
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"time"
)

type MessageID string

type Message struct {
	ID              MessageID       `firestore:"id"`
	ClientID        *string         `firestore:"client_id"`
	Text            string          `firestore:"text"`
	Role            Role            `firestore:"role"`
	SentAt          time.Time       `firestore:"sent_at"`
	PlaceExtraction PlaceExtraction `firestore:"place_extraction"`
}

// TODO: Add test
func (m *Message) RoleIs(role Role) bool {
	return m.Role == role
}

func (m *Message) SetPlaceExtraction(la PlaceExtraction) *Message {
	newM := *m
	newM.PlaceExtraction = la
	return &newM
}

type PlaceExtraction struct {
	Places      []*ExtractedPlace `firestore:"places"`
	ProcessedAt *time.Time        `firestore:"processed_at"`
	Error       *string           `firestore:"error"`
}

type ExtractedPlace struct {
	Text           string         `firestore:"text"`
	GuessedAddress GuessedAddress `firestore:"guessed_address"`
	GeocodedPlace  *GeocodedPlace `firestore:"geocoded_place"`
	GeocodedError  *string        `firestore:"geocoded_error"`
}

type GuessedAddress struct {
	Street  string `firestore:"street" json:"street"`
	City    string `firestore:"city" json:"city"`
	State   string `firestore:"state" json:"state"`
	Country string `firestore:"country" json:"country"`
	Zip     string `firestore:"zip" json:"zip"`
}

type GeocodedPlace struct {
	GooglePlaceID string `firestore:"google_place_id"`
	LatLng        LatLng `firestore:"lat_lng"`
}

func NewPlaceExtraction(
	places []*ExtractedPlace,
	analyzedAt *time.Time,
	errStr *string,
) *PlaceExtraction {
	return &PlaceExtraction{
		Places:      places,
		ProcessedAt: analyzedAt,
		Error:       errStr,
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
