package svc

import (
	"context"

	"googlemaps.github.io/maps"
)

type GeocodingService interface {
	One(ctx context.Context, req *maps.GeocodingRequest) (*maps.GeocodingResult, error)
	List(ctx context.Context, reqs []*maps.GeocodingRequest) ([]*maps.GeocodingResult, error)
}
