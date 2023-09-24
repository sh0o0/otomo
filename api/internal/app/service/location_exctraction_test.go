package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"testing"

	"github.com/tmc/langchaingo/llms/openai"

	"github.com/stretchr/testify/assert"
)

func TestLocationExtractionService_FromText(t *testing.T) {
	type fields struct {
		gpt *openai.Chat
	}
	type args struct {
		ctx  context.Context
		text string
	}
	tests := []struct {
		name      string
		fields    fields
		args      args
		want      []svc.ExtractedLocation
		wantIsErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			les := &LocationExtractionService{
				gpt: tt.fields.gpt,
			}
			got, err := les.FromText(tt.args.ctx, tt.args.text)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("LocationExtractionService.FromText() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			assert.Exactly(t, tt.want, got)
		})
	}
}
