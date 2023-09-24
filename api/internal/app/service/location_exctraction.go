package service

import (
	"context"
	"encoding/json"
	"errors"
	"otomo/internal/app/interfaces/svc"
	"regexp"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/prompts"
)

const (
	locationExtractionPrompt = "```" +
		`{{.sentence}}` +
		"```" +
		"\n" +
		`Extract the place names from the sentence above and, if possible, include additional information for easier searching on Google Maps. Format the output as follows, and please refrain from sending anything other than the specified format:` +
		"\n" +
		"```JSON Schema" +
		`{ "type": "object", "properties": { "locations": { "type": "array", "items": { "type": "object", "properties": { "name": { "type": "string" }, "address": { "type": "object", "properties": { "street": { "type": "string" }, "city": { "type": "string" }, "state": { "type": "string" }, "country": { "type": "string" }, "zip": { "type": "string" } }, "required": ["street", "city", "state", "zip"] } }, "required": ["name", "address"] } } } }"` +
		"```"
)

type LocationExtractionResult struct {
	Locations []svc.ExtractedLocation `json:"locations"`
}

type LocationExtractionService struct {
	gpt *openai.Chat
}

func NewLocationExtractionService(gpt *openai.Chat) *LocationExtractionService {
	return &LocationExtractionService{
		gpt: gpt,
	}
}

func (les *LocationExtractionService) FromText(
	ctx context.Context,
	text string,
) ([]svc.ExtractedLocation, error) {
	msgs, err := prompts.NewSystemMessagePromptTemplate(
		locationExtractionPrompt,
		[]string{"sentence"},
	).FormatMessages(
		map[string]any{"sentence": text},
	)
	if err != nil {
		return nil, err
	}

	completion, err := les.gpt.Call(ctx, msgs, llms.WithTemperature(0.0))
	if err != nil {
		return nil, err
	}

	regex := regexp.MustCompile(`(?m)^\{.*\}$`)
	match := regex.FindString(completion.GetContent())
	if match == "" {
		return nil, errors.New("invalid json")
	}

	var result = &LocationExtractionResult{}
	if err := json.Unmarshal([]byte(match), result); err != nil {
		return nil, err
	}

	return result.Locations, nil
}
