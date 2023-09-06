package service

import (
	"context"
	"fmt"
	"otomo/internal/app/controller/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

const (
	summarizePrompt = `Progressively summarize the lines of conversation provided, adding onto the previous summary returning a new summary.

EXAMPLE
Current summary:
The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good.

New lines of conversation:
Human: Why do you think artificial intelligence is a force for good?
AI: Because artificial intelligence will help humans reach their full potential.

New summary:
The human asks what the AI thinks of artificial intelligence. The AI thinks artificial intelligence is a force for good because it will help humans reach their full potential.
END OF EXAMPLE

Current summary:
{{.current_summary}}

New lines of conversation:
{{.new_lines}}

New summary:`
)

var _ svc.SummaryService = (*SummaryService)(nil)

// TODO: Add tests
type SummaryService struct {
	gpt *openai.Chat
}

func NewSummaryService(
	gpt *openai.Chat,
) *SummaryService {
	return &SummaryService{
		gpt: gpt,
	}
}

func (s *SummaryService) Summarize(
	ctx context.Context,
	newMsgs []*model.Message,
	currentSummary string,
) (string, error) {
	newLines, err := s.msgsToNewLines(newMsgs)
	if err != nil {
		return "", err
	}

	msg, err := prompts.NewHumanMessagePromptTemplate(
		summarizePrompt,
		[]string{"current_summary", "new_lines"},
	).FormatMessages(map[string]any{
		"current_summary": currentSummary,
		"new_lines":       newLines,
	})
	if err != nil {
		return "", err
	}
	fmt.Println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
	fmt.Println(msg[0].GetContent())

	completion, err := s.gpt.Call(
		ctx,
		[]schema.ChatMessage{msg[0]},
	)
	if err != nil {
		return "", err
	}

	return completion.GetContent(), nil
}

func (s *SummaryService) msgsToNewLines(
	msgs []*model.Message,
) (string, error) {
	var newLines string

	for _, msg := range msgs {
		rolePrefix, err := s.getRolePrefix(msg.Role)
		if err != nil {
			return "", err
		}

		newLines += fmt.Sprintf("%s: %s\n", rolePrefix, msg.Text)
	}

	return newLines, nil
}

func (s *SummaryService) getRolePrefix(role model.Role) (string, error) {
	switch role {
	case model.UserRole:
		return "Human", nil
	case model.OtomoRole:
		return "AI", nil
	default:
		return "", &errs.Error{
			Cause:  errs.CauseNotExist,
			Domain: errs.DomainMessage,
			Field:  errs.FieldRole,
		}
	}
}
