package model

import (
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
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
		SentAt:   e.SentAt().Truncate(time.Second).Local(),
	}, nil
}

func ConvertMessageWithOtomoModelToEntity(
	m *MessageWithOtomo,
	userID user.ID,
) (*message.MessageWithOtomo, error) {
	sender, err := ConvertRoleStringToRole(m.Sender)
	if err != nil {
		return nil, err
	}
	receiver, err := ConvertRoleStringToRole(m.Receiver)
	if err != nil {
		return nil, err
	}
	return message.RestoreMessageWithOtomo(
		message.MessageWithOtomoID(m.ID),
		userID,
		sender,
		receiver,
		m.Text,
		m.SentAt.Truncate(time.Second).Local(),
	), nil
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

func ConvertRoleStringToRole(
	role string,
) (message.Role, error) {
	switch role {
	case "user":
		return message.UserRole, nil
	case "otomo":
		return message.OtomoRole, nil
	}
	return 0, &errs.Error{
		Message: "invalid role",
		Cause:   errs.CauseNotExist,
		Domain:  errs.DomainMessageWithOtomo,
		Field:   errs.FieldRole,
	}
}
