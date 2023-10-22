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
			name: "Should return places when there are locations in the text in Japanese",
			args: args{
				ctx:  ctx,
				text: `こんにちは！三大温泉について話しましょうね。まずは箱根温泉（はこねおんせん）です。箱根は東京から電車で約1時間の距離にあり、芦ノ湖（あしのこ）や大涌谷（おおわくだに）といった自然景観も楽しめます。箱根温泉は温泉街を散策することができ、数多くの露天風呂や旅館があります。次は白浜温泉（しらはまおんせん）です。白浜は和歌山県に位置し、美しい白い砂浜が特徴です。また、周辺には南紀白浜海水浴場や白浜アドベンチャーワールドといった観光スポットもあります。温泉は美肌効果があると言われ、たくさんの観光客が訪れます。最後に道後温泉（どうごおんせん）です。道後は愛媛県の温泉地で、日本一古い温泉として有名です。道後温泉本館は国宝に指定されており、特徴的な紅色の建物です。温泉を楽しむだけでなく、周辺には道後公園や松山城など見どころもたくさんあります。それぞれの温泉には独自の特徴があり、多くの観光客を魅了しています。温泉が好きですか？もしご希望の話題があれば是非教えてください！`,
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
			les := &PlaceExtractionService{systemtest.Gpt()}
			got, err := les.FromText(tt.args.ctx, tt.args.text)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("LocationExtractionService.FromText() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			for _, place := range got {
				t.Logf("%+v", place)
			}
			t.Fatal("Fatal for showing log")
		})
	}
}
