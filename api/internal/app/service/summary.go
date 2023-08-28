package service

import (
	"context"
	"otomo/internal/app/model"

	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
	"github.com/tmc/langchaingo/schema"
)

const (
	summarizePrompt = `You are a conversation log summary generation and update machine.
The conversation is between a user and an AI called Otomo.
From the input conversation log, create a brief summary and update the following ######existing summary information.
Be sure to include proper nouns.

The conversation log input should be in the following format
User: Hello
Otomo: Hello, what is your name?
User: My name is Taro Yamada.
Otomo: Hi Yamada, nice to meet you. How can I help you today?

Sample summary:
User's name is Taro Yamada

###Existing summary information.
{{.existing_summary}}`
)

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
	newMsg *model.Message,
	existingSummary string,
) (string, error) {
	summarizeMessage, err := prompts.NewSystemMessagePromptTemplate(
		summarizePrompt,
		[]string{"existing_summary"},
	).FormatMessages(map[string]any{"existing_summary": existingSummary})
	if err != nil {
		return "", err
	}

	newLcMsg, err := messageToLangChainMessage(newMsg)
	if err != nil {
		return "", err
	}
	completion, err := s.gpt.Call(
		ctx,
		[]schema.ChatMessage{
			summarizeMessage[0],
			schema.HumanChatMessage{Content: newMsg.Text},
			newLcMsg,
		},
	)
	if err != nil {
		return "", err
	}

	return completion.GetContent(), nil
}
