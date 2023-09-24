package service

import (
	"context"
	"encoding/json"
	"fmt"
	"otomo/internal/app/interfaces/svc"

	openai "github.com/sashabaranov/go-openai"
)

const (
	s                        = `{ "type": "object", "properties": { "locations": { "type": "array", "items": { "type": "object", "properties": { "name": { "type": "string" }, "address": { "type": "object", "properties": { "street": { "type": "string" }, "city": { "type": "string" }, "state": { "type": "string" }, "country": { "type": "string" }, "zip": { "type": "string" } }, "required": ["city", "state"] } }, "required": ["name", "address"] } } } }`
	locationExtractionPrompt = `Extract the place names only from the sentence below and, if possible, include additional information to facilitate searching on Google Maps. Then, provide the information for the input_locations function call. If there is no location in the sentence, locations should be an empty list.

Sentence:
%s`
)

type LocationExtractionResult struct {
	Locations []svc.ExtractedLocation `json:"locations"`
}

type LocationExtractionService struct {
	gpt *openai.Client
}

func NewLocationExtractionService(gpt *openai.Client) *LocationExtractionService {
	return &LocationExtractionService{
		gpt: gpt,
	}
}

func (les *LocationExtractionService) FromText(
	ctx context.Context,
	text string,
) ([]svc.ExtractedLocation, error) {
	prompt := fmt.Sprintf(locationExtractionPrompt, text)
	completion, err := les.gpt.CreateChatCompletion(
		ctx,
		openai.ChatCompletionRequest{
			Model: openai.GPT3Dot5Turbo,
			Messages: []openai.ChatCompletionMessage{
				{
					Role:    openai.ChatMessageRoleSystem,
					Content: prompt,
				},
			},
			Functions: []openai.FunctionDefinition{
				{
					Name:        "input_locations",
					Description: "Input locations from texts",
					Parameters:  json.RawMessage(s),
				},
			},
			FunctionCall: json.RawMessage(`{"name": "input_locations"}`),
			Temperature:  0.0,
		},
	)
	if err != nil {
		return nil, err
	}

	msg := completion.Choices[0].Message

	var result = &LocationExtractionResult{}
	if err := json.Unmarshal(
		[]byte(msg.FunctionCall.Arguments),
		result,
	); err != nil {
		return nil, err
	}

	return result.Locations, nil
}
