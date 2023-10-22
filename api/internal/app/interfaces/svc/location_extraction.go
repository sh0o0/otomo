package svc

import (
	"context"
	"otomo/internal/app/model"
)

type PlaceExtractionResult struct {
	Name       string               `json:"name"`
	Address    model.GuessedAddress `json:"address"`
	Components Components           `json:"components"`
}

type Components struct {
	Locality           string `json:"locality"`
	AdministrativeArea string `json:"administrative_area"`
	Country            string `json:"country"`
}

type PlaceExtractionService interface {
	FromText(ctx context.Context, text string) ([]*PlaceExtractionResult, error)
}
