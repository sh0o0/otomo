package model

import (
	"otomo/internal/app/domain/entity/message"
	"otomo/pkg/errs"
	"time"
)

type MessageWithOtomo struct {
	ID       string    `firestore:"id"`
	Sender   string    `firestore:"sender"`
	Receiver string    `firestore:"receiver"`
	Text     string    `firestore:"text"`
	SentAt   time.Time `firestore:"sent_at"`
}

func ConvertMessageWithOtomoEntityToModel(
	e *message.MessageWithOtomo,
) (*MessageWithOtomo, error) {
	sender, err := ConvertRoleEntityToString(e.Sender())
	if err != nil {
		return nil, err
	}
	receiver, err := ConvertRoleEntityToString(e.Receiver())
	if err != nil {
		return nil, err
	}

	return &MessageWithOtomo{
		ID:       string(e.ID()),
		Sender:   sender,
		Receiver: receiver,
		Text:     e.Text(),
		SentAt:   e.SentAt(),
	}, nil
}

func ConvertRoleEntityToString(
	r message.Role,
) (string, error) {
	switch r {
	case message.UserRole:
		return "user", nil
	case message.OtomoRole:
		return "otomo", nil
	}

	return "", &errs.Error{
		Message: "invalid role",
		Cause:   errs.CauseNotExist,
		Domain:  errs.DomainMessageWithOtomo,
		Field:   errs.FieldRole,
	}
}
