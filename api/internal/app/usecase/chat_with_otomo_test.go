package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/domain/gateway/infra/mock_infra"
	"otomo/internal/app/domain/gateway/repo/mock_repo"
	"otomo/internal/app/usecase/ucboundary/mock_ucboundary"
	"otomo/pkg/times"
	"otomo/pkg/uuid"
	"otomo/test/testutil"
	"testing"
	"time"

	"github.com/golang/mock/gomock"
	"github.com/stretchr/testify/assert"
)

func init() {
	testutil.SetMockClock()
}

type chatWithOtomoUseCaseFields struct {
	otomo     *mock_infra.MockOtomoBot
	msgRepo   *mock_repo.MockMessageWithOtomoRepository
	rbFactory *mock_ucboundary.MockRollbackerFactory
	rber      *mock_ucboundary.MockRollbacker
}

func newChatWithOtomoUseCaseFieldsAndSetupRollback(t *testing.T) *chatWithOtomoUseCaseFields {
	ctrl := gomock.NewController(t)
	otomo := mock_infra.NewMockOtomoBot(ctrl)
	msgRepo := mock_repo.NewMockMessageWithOtomoRepository(ctrl)

	rbFactory := mock_ucboundary.NewMockRollbackerFactory(ctrl)
	rber := mock_ucboundary.NewMockRollbacker(ctrl)
	rbFactory.EXPECT().New().Return(rber)
	rber.EXPECT().RollbackForPanic(gomock.Any()).Times(1)

	return &chatWithOtomoUseCaseFields{
		otomo:     otomo,
		msgRepo:   msgRepo,
		rbFactory: rbFactory,
		rber:      rber,
	}
}

func TestChatWithOtomoUseCase_MessageToOtomo(t *testing.T) {
	var (
		giveCtx            = context.TODO()
		giveUserID         = user.ID(uuid.NewString())
		giveText           = "Hello, Otomo!"
		truncatedSecondNow = times.C.Now()
		reply              = message.RestoreMessageWithOtomo(
			message.MessageWithOtomoID(uuid.NewString()),
			giveUserID,
			message.OtomoRole,
			message.UserRole,
			"Hello, User!",
			times.C.Now(),
		)
	)
	type args struct {
		ctx    context.Context
		userID user.ID
		text   string
	}
	tests := []struct {
		name      string
		fields    *chatWithOtomoUseCaseFields
		args      args
		want      *message.MessageWithOtomo
		wantIsErr bool
	}{
		{
			name: testutil.JoinStrings(
				"should return *message.MessageWithOtomo",
				"when give a valid args",
			),
			fields: func() *chatWithOtomoUseCaseFields {
				var (
					fields            = newChatWithOtomoUseCaseFieldsAndSetupRollback(t)
					assertUserMessage = func(msg *message.MessageWithOtomo) {
						assert.Len(t, msg.ID(), 36)
						assert.Equal(t, giveUserID, msg.UserID())
						assert.Equal(t, message.UserRole, msg.Sender())
						assert.Equal(t, message.OtomoRole, msg.Receiver())
						assert.Equal(t, giveText, msg.Text())
						assert.Equal(
							t,
							truncatedSecondNow.Truncate(time.Second),
							msg.SentAt().Truncate(time.Second),
						)
					}
				)

				fields.msgRepo.EXPECT().Add(
					giveCtx,
					gomock.Any(),
				).DoAndReturn(
					func(ctx context.Context, msg *message.MessageWithOtomo) error {
						assertUserMessage(msg)
						return nil
					},
				).Times(1)

				fields.rber.EXPECT().
					Add(
						giveCtx,
						"Rollback for adding a message to otomo",
						gomock.Any(),
					).
					Times(1)

				fields.otomo.EXPECT().SendMessage(
					giveCtx,
					gomock.Any(),
				).DoAndReturn(
					func(ctx context.Context, msg *message.MessageWithOtomo) (
						*message.MessageWithOtomo,
						error,
					) {
						assertUserMessage(msg)
						return reply, nil
					},
				).Times(1)

				fields.msgRepo.EXPECT().Add(
					giveCtx,
					reply,
				).Return(nil).Times(1)
				return fields
			}(),
			args:      args{ctx: giveCtx, userID: giveUserID, text: giveText},
			want:      reply,
			wantIsErr: false,
		},
		// TODO: Add test for occurs error
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			u := &ChatWithOtomoUseCase{
				otomo:     tt.fields.otomo,
				msgRepo:   tt.fields.msgRepo,
				rbFactory: tt.fields.rbFactory,
			}
			got, err := u.MessageToOtomo(tt.args.ctx, tt.args.userID, tt.args.text)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ChatWithOtomoUseCase.MessageToOtomo() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			assert.Exactly(t, tt.want, got)
		})
	}
}
