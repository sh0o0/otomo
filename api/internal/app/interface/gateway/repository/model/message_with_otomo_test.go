package model

import (
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/pkg/uuid"
	"strings"
	"testing"
	"time"

	"github.com/google/go-cmp/cmp"
	"github.com/stretchr/testify/assert"
)

func TestConvertMessageWithOtomoEntityToModel(t *testing.T) {
	var (
		userID = user.ID(uuid.NewString())
		msg    = message.NewMessageWithOtomo(
			userID,
			message.OtomoRole,
			message.UserRole,
			"test test test test test ",
		)
		msgHavingInvalidSender = message.NewMessageWithOtomo(
			userID,
			10,
			message.UserRole,
			"test test test test test ",
		)
		msgHavingInvalidReceiver = message.NewMessageWithOtomo(
			userID,
			message.OtomoRole,
			11,
			"test test test test test ",
		)
	)
	type args struct {
		e *message.MessageWithOtomo
	}
	tests := []struct {
		name      string
		args      args
		want      *MessageWithOtomo
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return `mode.MessageWithOtomo`",
				"when give `message.MessageWithOtomo`",
			}, " "),
			args: args{
				e: msg,
			},
			want: &MessageWithOtomo{
				ID:       string(msg.ID()),
				Sender:   "otomo",
				Receiver: "user",
				Text:     msg.Text(),
				SentAt:   msg.SentAt().Truncate(time.Second).Local(),
			},
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when give the message having invalid sender",
			}, " "),
			args: args{
				e: msgHavingInvalidSender,
			},
			want:      nil,
			wantIsErr: true,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when give the message having invalid receiver",
			}, " "),
			args: args{
				e: msgHavingInvalidReceiver,
			},
			want:      nil,
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got, err := ConvertMessageWithOtomoEntityToModel(tt.args.e)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ConvertMessageWithOtomoEntityToModel() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if !cmp.Equal(got, tt.want) {
				t.Errorf("ConvertMessageWithOtomoEntityToModel() = %v, want %v\ndiff=%v", got, tt.want, cmp.Diff(got, tt.want))
			}
		})
	}
}

func TestConvertMessageWithOtomoModelToEntity(t *testing.T) {
	var (
		msgModel = &MessageWithOtomo{
			ID:       uuid.NewString(),
			Sender:   "otomo",
			Receiver: "user",
			Text:     "test test test test test",
			SentAt:   time.Now().Local(),
		}
		userID = user.ID(uuid.NewString())
	)
	type args struct {
		m      *MessageWithOtomo
		userID user.ID
	}
	tests := []struct {
		name      string
		args      args
		want      *message.MessageWithOtomo
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return `message.MessageWithOtomo`",
				"when give `model.MessageWithOtomo`",
			}, " "),
			args: args{
				m:      msgModel,
				userID: userID,
			},
			want: message.RestoreMessageWithOtomo(
				message.MessageWithOtomoID(msgModel.ID),
				userID,
				message.OtomoRole,
				message.UserRole,
				msgModel.Text,
				msgModel.SentAt.Truncate(time.Second).Local(),
			),
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got, err := ConvertMessageWithOtomoModelToEntity(tt.args.m, tt.args.userID)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ConvertMessageWithOtomoModelToEntity() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			assert.Equal(t, tt.want, got)
		})
	}
}

func TestConvertRoleEntityToString(t *testing.T) {
	type args struct {
		r message.Role
	}
	tests := []struct {
		name      string
		args      args
		want      string
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return `user`",
				"when give `message.UserRole`",
			}, " "),
			args: args{
				r: message.UserRole,
			},
			want:      "user",
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return `otomo`",
				"when give `message.OtomoRole`",
			}, " "),
			args: args{
				r: message.OtomoRole,
			},
			want:      "otomo",
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return `error`",
				"when give invalid role",
			}, " "),
			args: args{
				r: 10,
			},
			want:      "",
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got, err := ConvertRoleEntityToString(tt.args.r)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ConvertRoleEntityToString() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if got != tt.want {
				t.Errorf("ConvertRoleEntityToString() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestConvertRoleStringToRole(t *testing.T) {
	type args struct {
		role string
	}
	tests := []struct {
		name      string
		args      args
		want      message.Role
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return `message.UserRole`",
				"when give `user`",
			}, " "),
			args:      args{role: "user"},
			want:      message.UserRole,
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return `message.OtomoRole`",
				"when give `otomo`",
			}, " "),
			args:      args{role: "otomo"},
			want:      message.OtomoRole,
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when give invalid role",
			}, " "),
			args:      args{role: "test"},
			want:      0,
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got, err := ConvertRoleStringToRole(tt.args.role)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ConvertRoleStringToRole() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if !cmp.Equal(got, tt.want) {
				t.Errorf("ConvertRoleStringToRole() = %v, want %v\ndiff=%v", got, tt.want, cmp.Diff(got, tt.want))
			}
		})
	}
}
