package repository

import (
	"otomo/internal/app/model"
	"otomo/test/testutil"
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test_getOtomoDocPath(t *testing.T) {
	type args struct {
		userID model.UserID
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: testutil.JoinStrings(
				"should return `versions/1/otomos/test`",
				"when give `test`",
			),
			args: args{userID: "test"},
			want: "versions/1/otomos/test",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := GetOtomoDocPath(tt.args.userID)
			assert.Exactly(t, tt.want, got)
		})
	}
}

func Test_getChatMessagesColPath(t *testing.T) {
	type args struct {
		userID model.UserID
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: testutil.JoinStrings(
				"should return `versions/1/chats/test/messages`",
				"when give `test`",
			),
			args: args{userID: "test"},
			want: "versions/1/chats/test/messages",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := GetMessagesColPath(tt.args.userID)
			assert.Exactly(t, tt.want, got)
		})
	}
}

func Test_getChatMessageDocPath(t *testing.T) {
	type args struct {
		userID    model.UserID
		messageID model.MessageID
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: testutil.JoinStrings(
				"should return `versions/1/chats/test1/messages/test2`",
				"when give `test1` and `test2`",
			),
			args: args{userID: "test1", messageID: "test2"},
			want: "versions/1/chats/test1/messages/test2",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := GetMessageDocPath(tt.args.userID, tt.args.messageID)
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestGetOtomoProfileDocPath(t *testing.T) {
	type args struct {
		userID model.UserID
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: testutil.JoinStrings(
				"should return `versions/1/otomo_profiles/test`",
				"when give `test`",
			),
			args: args{userID: "test"},
			want: "versions/1/otomo_profiles/test",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := GetOtomoProfileDocPath(tt.args.userID)
			assert.Exactly(t, tt.want, got)
		})
	}
}
