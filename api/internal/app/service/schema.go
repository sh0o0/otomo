package service

import (
	"bytes"
	_ "embed"
	"encoding/json"
)

var (
	//go:embed geocode.schema.json
	geocodeSchema []byte
)

var (
	CompactedGeocodeSchema string
)

func init() {
	var geocodeSchemaBuf = &bytes.Buffer{}
	if err := json.Compact(geocodeSchemaBuf, geocodeSchema); err != nil {
		panic(err)
	}
	CompactedGeocodeSchema = geocodeSchemaBuf.String()
}
