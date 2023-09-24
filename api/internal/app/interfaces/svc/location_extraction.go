package svc

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
	FromText(text string) ([]ExtractedLocation, error)
}
