package svc

import (
	"context"
	"otomo/internal/app/model"
)

type PlaceExtractionResult struct {
	Name    string               `json:"name"`
	Address model.GuessedAddress `json:"address"`
}

type PlaceExtractionService interface {
	FromText(ctx context.Context, text string) ([]*PlaceExtractionResult, error)
}
