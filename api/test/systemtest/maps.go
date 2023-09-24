package systemtest

import (
	"googlemaps.github.io/maps"
)

var (
	MapsClient *maps.Client
)

func initMapsClient() error {
	c, err := maps.NewClient(maps.WithAPIKey(mapsApiKey))
	if err != nil {
		return err
	}
	MapsClient = c
	return nil
}
