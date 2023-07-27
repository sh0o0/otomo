package controller

import (
	"context"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/internal/app/interface/controller/present"
	"otomo/internal/app/usecase/ucboundary"
	"testing"

	"github.com/google/go-cmp/cmp"
)

// TODO: Write test cases

func TestChatWithOtomoController_MessageToOtomo(t *testing.T) {
	type fields struct {
		useCase   ucboundary.ChatWithOtomoUseCase
		presenter present.ChatWithOtomoPresenter
	}
	type args struct {
		ctx context.Context
		req *grpcgen.ChatWithOtomoMessageToOtomoRequest
	}
	tests := []struct {
		name      string
		fields    fields
		args      args
		want      *grpcgen.ChatWithOtomoMessageToOtomoResponse
		wantIsErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			ctrl := &ChatWithOtomoController{
				useCase:   tt.fields.useCase,
				presenter: tt.fields.presenter,
			}
			got, err := ctrl.MessageToOtomo(tt.args.ctx, tt.args.req)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ChatWithOtomoController.MessageToOtomo() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if !cmp.Equal(got, tt.want) {
				t.Errorf("ChatWithOtomoController.MessageToOtomo() = %v, want %v\ndiff=%v", got, tt.want, cmp.Diff(got, tt.want))
			}
		})
	}
}
