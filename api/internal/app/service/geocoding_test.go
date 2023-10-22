package service

import (
	"context"
	"otomo/test/systemtest"
	"testing"

	"googlemaps.github.io/maps"
)

func TestSystem_GeocodingService_One(t *testing.T) {
	t.Skip("SYSTEM_TEST")

	type args struct {
		ctx context.Context
		req *maps.GeocodingRequest
	}
	tests := []struct {
		name      string
		args      args
		wantIsErr bool
	}{
		{
			name: "白浜温泉",
			args: args{
				ctx: context.Background(),
				req: &maps.GeocodingRequest{
					Address: "白浜温泉",
				},
			},
			wantIsErr: false,
		},
		{
			name: "有馬温泉 兵庫",
			args: args{
				ctx: context.Background(),
				req: &maps.GeocodingRequest{
					Address: "有馬温泉 兵庫",
				},
			},
			wantIsErr: false,
		},
		{
			name: "箱根温泉 with components",
			args: args{
				ctx: context.Background(),
				req: &maps.GeocodingRequest{
					Address: "箱根温泉",
					Components: map[maps.Component]string{
						maps.ComponentLocality:           "箱根",
						maps.ComponentAdministrativeArea: "神奈川県",
						maps.ComponentCountry:            "日本",
					},
				},
			},
			wantIsErr: false,
		},
		{
			name: "白浜温泉 with components",
			args: args{
				ctx: context.Background(),
				req: &maps.GeocodingRequest{
					Address: "白浜温泉",
					Components: map[maps.Component]string{
						maps.ComponentLocality:           "白浜",
						maps.ComponentAdministrativeArea: "和歌山県",
						maps.ComponentCountry:            "日本",
					},
				},
			},
			wantIsErr: false,
		},
		{
			name: "道後温泉 with components",
			args: args{
				ctx: context.Background(),
				req: &maps.GeocodingRequest{
					Address: "道後温泉",
					Components: map[maps.Component]string{
						maps.ComponentLocality:           "道後",
						maps.ComponentAdministrativeArea: "愛媛県",
						maps.ComponentCountry:            "日本",
					},
				},
			},
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			gs := &GeocodingService{
				client: systemtest.MapsClient(),
			}
			got, err := gs.One(tt.args.ctx, tt.args.req)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("GeocodingService.One() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			t.Logf("%+v", got)
			t.Fatal("For showing log")
		})
	}
}
