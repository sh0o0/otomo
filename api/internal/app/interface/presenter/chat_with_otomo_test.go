package presenter

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestChatWithOtomoPresenter_MessageToOtomoOutput(t *testing.T) {
	type fields struct {
		ErrorPresenter ErrorPresenter
	}
	type args struct {
		ctx context.Context
		msg *message.MessageWithOtomo
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
			p := &ChatWithOtomoPresenter{
				ErrorPresenter: tt.fields.ErrorPresenter,
			}
			got, err := p.MessageToOtomoOutput(tt.args.ctx, tt.args.msg)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ChatWithOtomoPresenter.MessageToOtomoOutput() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			assert.Exactly(t, got, tt.want)
		})
	}
}
