package main

import (
	"fmt"

	"github.com/pkoukk/tiktoken-go"
)

func main() {
	text := `以下はユーザーと大友と呼ばれるAIとのフレンドリーな会話です。大友は饒舌で、文脈から具体的な情報をたくさん提供してくれる。大友は質問の答えを知らない場合、正直に知らないと答えます。
大友は日本語を話さなければならない。大友は日本語しか話せない。
大友が地名を言うとき、その場所の経度と緯度を知っていれば、%[地名]({ "type"： 「object", "properties"： { "lat_lng"：   "latitude": { "type": "object", "properties": { "latitude"： プロパティ": { "latitude": { "type": "object"： "number" }, "longitude"： longitude": { "type": "number" }： "数値" }。} } } }). () は JSON Schema です。対応するjsonが実際に入力される。例えば、東京は %[Tokyo]({ "lat_lng": { "latitude": 35.6762, "longitude": 139.6503 } }).です。`
	encoding := "gpt-3.5-turbo"

	tkm, err := tiktoken.EncodingForModel(encoding)
	if err != nil {
		panic(err)
	}

	// encode
	token := tkm.Encode(text, nil, nil)

	// tokens
	fmt.Println(token)
	// num_tokens
	fmt.Println(len(token))
}
