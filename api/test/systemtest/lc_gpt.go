package systemtest

import "github.com/tmc/langchaingo/llms/openai"

var lcGpt *openai.Chat

func initLcGpt() error {
	c, err := openai.NewChat(openai.WithToken(openaiApiKey))
	if err != nil {
		return err
	}
	lcGpt = c
	return nil
}
