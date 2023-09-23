package systemtest

import (
	"os"

	"googlemaps.github.io/maps"
)

var (
	MapsClient *maps.Client

	mapsApiKey = os.Getenv("GOOGLE_MAPS_API_KEY")
)

func initMapsClient() error {
	c, err := maps.NewClient(maps.WithAPIKey(mapsApiKey))
	if err != nil {
		return err
	}
	MapsClient = c
	return nil
}
