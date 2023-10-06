package service

import (
	"context"
	"otomo/test/systemtest"
	"testing"
)

func TestSystem_LocationExtractionService_FromText(t *testing.T) {
	t.Skip("System test")

	var (
		ctx = context.Background()
	)

	type args struct {
		ctx  context.Context
		text string
	}
	tests := []struct {
		name      string
		args      args
		wantIsErr bool
	}{
		{
			name: "Should return locations when there are locations in the text in Japanese",
			args: args{
				ctx: ctx,
				text: `わぁ、ご主人様！京都の名所ですにゃん♡まずは清水寺がおすすめですにゃん！京都のパノラマビューを楽しむことができますよ♪そして、八坂の塔や金閣寺もおすすめですにゃん！また、伏見稲荷大社や嵐山、祇園も必見ですにゃん！京都には素敵な場所がたくさんありますから、何か特定の場所がありますかにゃん？

				福岡の一蘭本店はどうかな？大阪のくいだおれはどう？`,
			},
			wantIsErr: false,
		},
		{
			name: "Should be empty when there is no location in the text in Japanese",
			args: args{
				ctx:  ctx,
				text: `こんにちは`,
			},
			wantIsErr: false,
		},
		{
			name: "Should return locations when there are locations in the text in English",
			args: args{
				ctx: ctx,
				text: `Wow, Master! These are famous places in Kyoto, meow! First, I recommend Kiyomizu Temple, meow! You can enjoy a panoramic view of Kyoto there, meow! Also, Yasaka Pagoda and Kinkaku-ji are great recommendations, meow! Additionally, Fushimi Inari Taisha, Arashiyama, and Gion are must-see places, meow! Kyoto has many wonderful spots, so do you have a specific place in mind, meow?

				How about Ichiran Main Store in Fukuoka? What about Kuishinbo in Osaka?`,
			},
			wantIsErr: false,
		},
		{
			name: "Should be empty when there is no location in the text in English",
			args: args{
				ctx:  ctx,
				text: `Hello`,
			},
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			les := &LocationExtractionService{systemtest.Gpt()}
			got, err := les.FromText(tt.args.ctx, tt.args.text)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("LocationExtractionService.FromText() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			t.Log(got)
			t.Fatal("Fatal for showing log")
		})
	}
}
