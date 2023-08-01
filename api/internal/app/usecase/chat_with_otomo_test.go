package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/domain/gateway/infra/mock_infra"
	"otomo/internal/app/domain/gateway/repo/mock_repo"
	"otomo/pkg/rollback"
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
	otomoBot  *mock_infra.MockOtomoBot
	msgRepo   *mock_repo.MockMessageWithOtomoRepository
	rbFactory *rollback.RollbackerFactory
}

func newChatWithOtomoUseCaseFieldsAndSetupRollback(t *testing.T) *chatWithOtomoUseCaseFields {
	ctrl := gomock.NewController(t)
	otomo := mock_infra.NewMockOtomoBot(ctrl)
	msgRepo := mock_repo.NewMockMessageWithOtomoRepository(ctrl)

	rbFactory := rollback.NewRollbackerFactory()

	return &chatWithOtomoUseCaseFields{
		otomoBot:  otomo,
		msgRepo:   msgRepo,
		rbFactory: rbFactory,
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
				fields.msgRepo.
					EXPECT().
					Add(giveCtx, gomock.Any()).
					DoAndReturn(
						func(ctx context.Context, msg *message.MessageWithOtomo) error {
							assertUserMessage(msg)
							return nil
						}).
					Times(1)
				fields.otomoBot.
					EXPECT().
					SendMessage(giveCtx, gomock.Any()).
					DoAndReturn(
						func(
							ctx context.Context,
							msg *message.MessageWithOtomo,
						) (*message.MessageWithOtomo, error) {
							assertUserMessage(msg)
							return reply, nil
						}).
					Times(1)
				fields.msgRepo.
					EXPECT().
					Add(giveCtx, reply).
					Return(nil).
					Times(1)
				return fields
			}(),
			args:      args{ctx: giveCtx, userID: giveUserID, text: giveText},
			want:      reply,
			wantIsErr: false,
		},
		{
			name: testutil.JoinStrings(
				"should return error",
				"when msgRepo.Add for user's message returns error",
			),
			fields: func() *chatWithOtomoUseCaseFields {
				fields := newChatWithOtomoUseCaseFieldsAndSetupRollback(t)
				fields.msgRepo.
					EXPECT().
					Add(giveCtx, gomock.Any()).
					Return(testutil.ErrDummy).
					Times(1)
				return fields
			}(),
			args:      args{ctx: giveCtx, userID: giveUserID, text: giveText},
			want:      nil,
			wantIsErr: true,
		},
		{
			name: testutil.JoinStrings(
				"should roll back the message addition",
				"when otomoBot.SendMessage() returns error",
			),
			fields: func() *chatWithOtomoUseCaseFields {
				fields := newChatWithOtomoUseCaseFieldsAndSetupRollback(t)
				fields.msgRepo.
					EXPECT().
					Add(giveCtx, gomock.Any()).
					Return(nil).
					Times(1)
				fields.otomoBot.
					EXPECT().
					SendMessage(giveCtx, gomock.Any()).
					Return(nil, testutil.ErrDummy).
					Times(1)
				fields.msgRepo.
					EXPECT().
					DeleteByIDAndUserID(giveCtx, gomock.Any(), giveUserID).
					Return(nil).
					Times(1)
				return fields
			}(),
			args:      args{ctx: giveCtx, userID: giveUserID, text: giveText},
			want:      nil,
			wantIsErr: true,
		},
		{
			name: testutil.JoinStrings(
				"should roll back the message addition",
				"when second msgRepo.Add() returns error",
			),
			fields: func() *chatWithOtomoUseCaseFields {
				fields := newChatWithOtomoUseCaseFieldsAndSetupRollback(t)
				fields.msgRepo.
					EXPECT().
					Add(giveCtx, gomock.Any()).
					Return(nil).
					Times(1)
				fields.otomoBot.
					EXPECT().
					SendMessage(giveCtx, gomock.Any()).
					Return(reply, nil).
					Times(1)
				fields.msgRepo.
					EXPECT().
					Add(giveCtx, gomock.Any()).
					Return(testutil.ErrDummy).
					Times(1)
				fields.msgRepo.
					EXPECT().
					DeleteByIDAndUserID(giveCtx, gomock.Any(), giveUserID).
					Return(nil).
					Times(1)
				return fields
			}(),
			args:      args{ctx: giveCtx, userID: giveUserID, text: giveText},
			want:      nil,
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			u := &ChatWithOtomoUseCase{
				otomoBot:  tt.fields.otomoBot,
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

func TestChatWithOtomoUseCase_MessageToOtomo_ShouldRollBackTheMessageAddition_WhenPanicOccurs(t *testing.T) {
	var (
		giveCtx    = context.TODO()
		giveUserID = user.ID(uuid.NewString())
		giveText   = "Hello, Otomo!"
	)
	fields := newChatWithOtomoUseCaseFieldsAndSetupRollback(t)
	fields.msgRepo.
		EXPECT().
		Add(giveCtx, gomock.Any()).
		Return(nil).
		Times(1)
	fields.otomoBot.
		EXPECT().
		SendMessage(giveCtx, gomock.Any()).
		DoAndReturn(
			func(ctx context.Context, msg *message.MessageWithOtomo) error {
				panic("error")
			}).
		Times(1)
	fields.msgRepo.
		EXPECT().
		// TODO:Test the msgID
		DeleteByIDAndUserID(giveCtx, gomock.Any(), giveUserID).
		Return(nil).
		Times(1)

	u := &ChatWithOtomoUseCase{
		otomoBot:  fields.otomoBot,
		msgRepo:   fields.msgRepo,
		rbFactory: fields.rbFactory,
	}
	assert.Panics(t, func() {
		u.MessageToOtomo(giveCtx, giveUserID, giveText)
	})
}
