package svc

import (
	"context"
	"otomo/internal/app/model"
)

type PlaceExtractionResult struct {
	Name       string                `json:"name"`
	Components model.PlaceComponents `json:"components"`
}

type PlaceExtractionService interface {
	FromText(ctx context.Context, text string) ([]*PlaceExtractionResult, error)
}
