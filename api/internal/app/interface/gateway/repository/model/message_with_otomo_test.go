package model

import (
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/pkg/uuid"
	"strings"
	"testing"

	"github.com/google/go-cmp/cmp"
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
				SentAt:   msg.SentAt(),
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
