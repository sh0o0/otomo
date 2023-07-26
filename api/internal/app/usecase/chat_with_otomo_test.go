package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/domain/gateway/infra/mock_infra"
	"otomo/internal/app/domain/gateway/repo/mock_repo"
	"otomo/pkg/uuid"
	"strings"
	"testing"

	"github.com/golang/mock/gomock"

	"github.com/google/go-cmp/cmp"
)

type chatWithOtomoUseCaseFields struct {
	msgMaker *mock_infra.MockMessageMaker
	msgRepo  *mock_repo.MockMessageWithOtomoRepository
}

func newChatWithOtomoUseCaseFields(t *testing.T) *chatWithOtomoUseCaseFields {
	mockCtrl := gomock.NewController(t)
	msgMaker := mock_infra.NewMockMessageMaker(mockCtrl)
	msgRepo := mock_repo.NewMockMessageWithOtomoRepository(mockCtrl)
	return &chatWithOtomoUseCaseFields{
		msgMaker: msgMaker,
		msgRepo:  msgRepo,
	}
}

func TestChatWithOtomoUseCase_Reply(t *testing.T) {
	var (
		ctx     = context.TODO()
		userID  = user.ID(uuid.NewString())
		userMsg = message.NewMessageWithOtomo(
			userID,
			message.UserRole,
			message.OtomoRole,
			"this is user's",
		)
		otomoMsg = message.NewMessageWithOtomo(
			userID,
			message.OtomoRole,
			message.UserRole,
			"this is otomo's",
		)
	)
	type args struct {
		ctx context.Context
		msg *message.MessageWithOtomo
	}
	tests := []struct {
		name      string
		fields    *chatWithOtomoUseCaseFields
		args      args
		want      *message.MessageWithOtomo
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return otomoMsg and nil",
				"when give otomoMsg",
			}, " "),
			fields: func() *chatWithOtomoUseCaseFields {
				f := newChatWithOtomoUseCaseFields(t)
				f.msgRepo.EXPECT().Add(
					ctx,
					userMsg,
				).Return(nil)
				f.msgMaker.EXPECT().MakeFromMessageWithOtomo(
					ctx,
					userMsg,
				).Return(otomoMsg, nil)
				f.msgRepo.EXPECT().Add(
					ctx,
					otomoMsg,
				).Return(nil)
				return f
			}(),
			args: args{
				ctx: ctx,
				msg: userMsg,
			},
			want:      otomoMsg,
			wantIsErr: false,
		},
		// TODO: Add test. For error handlings, rollbacks
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			u := &ChatWithOtomoUseCase{
				msgMaker: tt.fields.msgMaker,
				msgRepo:  tt.fields.msgRepo,
			}
			got, err := u.Reply(tt.args.ctx, tt.args.msg)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ChatWithOtomoUseCase.Reply() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if !cmp.Equal(got, tt.want) {
				t.Errorf("ChatWithOtomoUseCase.Reply() = %v, want %v\ndiff=%v", got, tt.want, cmp.Diff(got, tt.want))
			}
		})
	}
}
