package service

import (
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"github.com/tmc/langchaingo/schema"
)

func messageToLangChainMessage(msg *model.Message) (schema.ChatMessage, error) {
	switch msg.Role {
	case model.UserRole:
		return &schema.HumanChatMessage{
			Content: msg.Text,
		}, nil
	case model.OtomoRole:
		return &schema.AIChatMessage{
			Content: msg.Text,
		}, nil
	default:
		return nil, &errs.Error{
			Cause:  errs.CauseNotExist,
			Domain: errs.DomainMessageWithOtomo,
			Field:  errs.FieldRole,
		}
	}
}
