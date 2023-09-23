package service

import (
	"context"
	"otomo/internal/app/model"
	"testing"

	"googlemaps.github.io/maps"

	"github.com/stretchr/testify/assert"
)

func TestGeocodingService_List(t *testing.T) {
	type fields struct {
		client *maps.Client
	}
	type args struct {
		ctx  context.Context
		reqs []*model.GeocodingRequest
	}
	tests := []struct {
		name      string
		fields    fields
		args      args
		want      []*maps.GeocodingResult
		wantIsErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			gs := &GeocodingService{
				client: tt.fields.client,
			}
			got, err := gs.List(tt.args.ctx, tt.args.reqs)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("GeocodingService.List() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			assert.Exactly(t, tt.want, got)
		})
	}
}
