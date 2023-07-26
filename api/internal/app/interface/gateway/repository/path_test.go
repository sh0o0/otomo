package repository

import (
	"strings"
	"testing"
)

func TestGetTripPath(t *testing.T) {
	type args struct {
		id string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: strings.Join([]string{
				"should return `versions/1/message_with_otomo/test`",
				"when give `test`",
			}, " "),
			args: args{id: "test"},
			want: "versions/1/message_with_otomo/test",
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := GetMessageWithOtomoPath(tt.args.id); got != tt.want {
				t.Errorf("GetTripPath() = %v, want %v", got, tt.want)
			}
		})
	}
}
