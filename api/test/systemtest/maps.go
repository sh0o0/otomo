package systemtest

import (
	"googlemaps.github.io/maps"
)

var (
	mapsClient *maps.Client
)

func MapsClient() *maps.Client {
	if mapsClient != nil {
		return mapsClient
	}

	c, err := maps.NewClient(maps.WithAPIKey(mapsApiKey))
	if err != nil {
		panic(err)
	}
	mapsClient = c
	return mapsClient
}
