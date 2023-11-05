package service

import (
	"context"
	_ "embed"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/test/systemtest"
	"otomo/test/testutil"
	"testing"
)

// func newLogMessagingFunc(t *testing.T) model.MessagingFunc {
// 	return func(_ context.Context, msg *model.MessageChunk) error {
// 		t.Logf("isLast: %v, Text: %v", msg.IsLast, msg.Text)
// 		return nil
// 	}
// }

func TestSystem_ConversationService_Respond(t *testing.T) {
	t.Skip(testutil.SystemTest)

	type args struct {
		ctx  context.Context
		msg  *model.Message
		opts svc.ConversationOptions
	}
	tests := []struct {
		name      string
		args      args
		wantIsErr bool
	}{
		{
			name: "Hello",
			args: args{
				ctx: context.Background(),
				msg: &model.Message{
					Text: "Hello",
				},
			},
			wantIsErr: false,
		},
		{
			name: "Can you tell me some good hot springs in Japan?",
			args: args{
				ctx: context.Background(),
				msg: &model.Message{
					Text: "Can you tell me some good hot springs in Japan?",
				},
				opts: svc.ConversationOptions{
					SpeakingFunc: func(ctx context.Context, sc *svc.SpokenChunk) error {
						t.Logf("isLast: %v, Content: %v, FC: %v\n", sc.IsLast, sc.Content, sc.FunctionCall)
						return nil
					},
					Functions: functions,
				},
			},
			wantIsErr: false,
		},
		{
			name: "Can you tell me a good route of travel in Kyoto?",
			args: args{
				ctx: context.Background(),
				msg: &model.Message{
					Text: "Can you tell me a good route of travel in Kyoto?",
				},
				opts: svc.ConversationOptions{
					Functions: functions,
				},
			},
			wantIsErr: false,
		},
		{
			name: "Can you plan traveling in Kyoto?",
			args: args{
				ctx: context.Background(),
				msg: &model.Message{
					Text: "Can you tell me a good route of travel in Kyoto?",
				},
				opts: svc.ConversationOptions{
					Functions: functions,
				},
			},
			wantIsErr: false,
		},
		{
			name: "Tell me details more about Hakone Onsen.",
			args: args{
				ctx: context.Background(),
				msg: &model.Message{
					Text: "Tell me about Hakone Onsen.",
				},
				opts: svc.ConversationOptions{
					Functions: functions,
				},
			},
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			cs := &ConversationService{
				gpt: systemtest.Gpt(),
			}
			got, err := cs.Respond(tt.args.ctx, tt.args.msg, tt.args.opts)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ConversationService.Respond() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			t.Logf("ConversationService.Respond() got = %v", got)
			t.Fatal(testutil.SystemTest)
		})
	}
}
