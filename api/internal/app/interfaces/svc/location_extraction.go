package svc

import "context"

type ExtractedLocation struct {
	Name    string           `json:"name"`
	Address ExtractedAddress `json:"address"`
}

type ExtractedAddress struct {
	Street  string `json:"street"`
	City    string `json:"city"`
	State   string `json:"state"`
	Country string `json:"country"`
	Zip     string `json:"zip"`
}

type LocationExtractionService interface {
	FromText(ctx context.Context, text string) ([]ExtractedLocation, error)
}
