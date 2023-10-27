package systemtest

import "github.com/tmc/langchaingo/llms/openai"

var lcGpt *openai.Chat

func LcGpt() *openai.Chat {
	if lcGpt != nil {
		return lcGpt
	}

	var err error
	lcGpt, err = openai.NewChat(
		openai.WithToken(openaiApiKey),
		openai.WithModel("gpt-3.5-turbo"),
	)
	if err != nil {
		panic(err)
	}
	return lcGpt
}
