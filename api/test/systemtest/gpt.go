package systemtest

import "github.com/sashabaranov/go-openai"

var gpt *openai.Client

func Gpt() *openai.Client {
	if gpt != nil {
		return gpt
	}

	gpt = openai.NewClient(openaiApiKey)
	return gpt
}
