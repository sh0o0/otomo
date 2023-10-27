package model

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestHistoryPrompt_String(t *testing.T) {
	type fields struct {
		history string
	}
	tests := []struct {
		name   string
		fields fields
		want   string
	}{
		{
			name: "Should return history is test when give `test`",
			fields: fields{
				history: "test",
			},
			want: `The following is a conversation between a user and you.

Current conversation:
test`,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			hp := &HistoryPrompt{
				history: tt.fields.history,
			}
			got := hp.String()
			assert.Exactly(t, tt.want, got)
		})
	}
}
