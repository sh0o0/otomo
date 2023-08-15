package repository

import (
	"strings"
	"testing"
)

func TestGetMessageColPath(t *testing.T) {
	type args struct {
		userID string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: strings.Join([]string{
				"should return `versions/1/users/test/messages`",
				"when give `test`",
			}, " "),
			args: args{userID: "test"},
			want: "versions/1/users/test/messages",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := getMessagesColPath(tt.args.userID); got != tt.want {
				t.Errorf("GetMessageColPath() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_getMessageDocPath(t *testing.T) {
	type args struct {
		userID string
		msgID  string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: strings.Join([]string{
				"should return `versions/1/users/test/messages/1`",
				"when give `test`",
			}, " "),
			args: args{userID: "test", msgID: "1"},
			want: "versions/1/users/test/messages/1",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := getMessageDocPath(tt.args.userID, tt.args.msgID); got != tt.want {
				t.Errorf("getMessageDocPath() = %v, want %v", got, tt.want)
			}
		})
	}
}
