package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/domain/gateway/infra"
	"otomo/internal/app/domain/gateway/repo"
	"testing"

	"github.com/google/go-cmp/cmp"
)

// TODO: Write test cases
func TestChatWithOtomoUseCase_MessageToOtomo(t *testing.T) {
	type fields struct {
		msgMaker infra.MessageMaker
		msgRepo  repo.MessageWithOtomoRepository
	}
	type args struct {
		ctx    context.Context
		userID user.ID
		text   string
	}
	tests := []struct {
		name      string
		fields    fields
		args      args
		want      *message.MessageWithOtomo
		wantIsErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			u := &ChatWithOtomoUseCase{
				msgMaker: tt.fields.msgMaker,
				msgRepo:  tt.fields.msgRepo,
			}
			got, err := u.MessageToOtomo(tt.args.ctx, tt.args.userID, tt.args.text)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ChatWithOtomoUseCase.MessageToOtomo() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if !cmp.Equal(got, tt.want) {
				t.Errorf("ChatWithOtomoUseCase.MessageToOtomo() = %v, want %v\ndiff=%v", got, tt.want, cmp.Diff(got, tt.want))
			}
		})
	}
}
