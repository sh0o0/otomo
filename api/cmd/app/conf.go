package main

import (
	"encoding/json"
)

var conf Conf

type Conf struct {
	Debug        bool   `envconfig:"API_DEBUG" default:"false"`
	ServerHost   string `envconfig:"API_HOST"`
	ServerPort   string `envconfig:"API_PORT" default:"50051"`
	LogEncoding  string `envconfig:"LOG_ENCODING" default:"json"` // json or console
	GcpProjectID string `envconfig:"GCP_PROJECT_ID" json:"-"`
	SentryDsn    string `envconfig:"SENTRY_DSN" json:"-"`
	OpenAIApiKey string `envconfig:"OPENAI_API_KEY" json:"-"`
	OpenAIModel  string `envconfig:"OPENAI_MODEL" default:"gpt-3.5-turbo"`
}

func (e Conf) String() (string, error) {
	b, err := json.Marshal(e)
	if err != nil {
		return "", err
	}
	return string(b), nil
}
