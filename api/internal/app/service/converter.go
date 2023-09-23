package service

import (
	"otomo/internal/app/model"

	"googlemaps.github.io/maps"
)

var conv = &converter{}

type converter struct {
	geo geo
}

type geo struct{}

func (geo) requestModelToGoogle(
	req *model.GeocodingRequest,
) *maps.GeocodingRequest {
	return &maps.GeocodingRequest{
		Address: req.Address,
	}
}
