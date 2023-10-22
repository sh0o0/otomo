package service

import (
	"context"
	"encoding/json"
	"fmt"
	"otomo/internal/app/interfaces/svc"

	openai "github.com/sashabaranov/go-openai"
)

const (
	placeExtractionPrompt = `Extract the place names only from the sentence below and, if possible, include additional information to facilitate searching on Google Maps. Then, provide the information for the input_places function call. If there is no place in the sentence, places should be an empty list.

Sentence:
%s`
)

type PlaceExtractionJson struct {
	Places []*svc.PlaceExtractionResult `json:"Places"`
}

var _ svc.PlaceExtractionService = (*PlaceExtractionService)(nil)

type PlaceExtractionService struct {
	gpt *openai.Client
}

func NewPlaceExtractionService(gpt *openai.Client) *PlaceExtractionService {
	return &PlaceExtractionService{
		gpt: gpt,
	}
}

func (les *PlaceExtractionService) FromText(
	ctx context.Context,
	text string,
) ([]*svc.PlaceExtractionResult, error) {
	prompt := fmt.Sprintf(placeExtractionPrompt, text)
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
					Name:        "input_places",
					Description: "Input places from texts",
					Parameters:  json.RawMessage(CompactedGeocodeSchema),
				},
			},
			FunctionCall: json.RawMessage(`{"name": "input_places"}`),
			Temperature:  0.0,
		},
	)
	if err != nil {
		return nil, err
	}

	msg := completion.Choices[0].Message

	var result = &PlaceExtractionJson{}
	if err := json.Unmarshal(
		[]byte(msg.FunctionCall.Arguments),
		result,
	); err != nil {
		return nil, err
	}

	return result.Places, nil
}
