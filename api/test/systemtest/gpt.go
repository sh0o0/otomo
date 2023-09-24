package systemtest

import "github.com/sashabaranov/go-openai"

var Gpt *openai.Client

func initGpt() {
	Gpt = openai.NewClient(openaiApiKey)
}
