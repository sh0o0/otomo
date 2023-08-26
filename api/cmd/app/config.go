package main

import (
	"fmt"
	"otomo/internal/pkg/logs"
	"reflect"

	"go.uber.org/zap"
)

var conf Conf

type Conf struct {
	// Server
	Debug      bool   `envconfig:"API_DEBUG" default:"false" print:"true"`
	ServerHost string `envconfig:"API_HOST" print:"true"`
	ServerPort string `envconfig:"API_PORT" default:"50051" print:"true"`

	// Log
	LogEncoding string `envconfig:"LOG_ENCODING" default:"json" print:"true"` // json or console

	// GCP
	GcpProjectID                         string `envconfig:"GCP_PROJECT_ID"`
	GoogleApplicationCredentialsJSONPath string `envconfig:"GOOGLE_APPLICATION_CREDENTIALS" default:"google_application_credentials.json"`
	GoogleApplicationCredentialsJSON     string `envconfig:"GOOGLE_APPLICATION_CREDENTIALS_JSON"`

	// Sentry
	SentryDsn string `envconfig:"SENTRY_DSN"`

	// OpenAI
	OpenAIApiKey string `envconfig:"OPENAI_API_KEY"`
	OpenAIModel  string `envconfig:"OPENAI_MODEL" default:"gpt-3.5-turbo" print:"true"`

	// Auth
	BasicAuthPairs map[string]string `envconfig:"BASIC_AUTH_PAIRS"`
}

func (c Conf) Print() {
	envLogs := []zap.Field{}

	t := reflect.TypeOf(c)
	for i := 0; i < t.NumField(); i++ {
		tag := t.Field(i).Tag
		prt := tag.Get("print")
		if prt == "true" {
			val := reflect.ValueOf(c).Field(i).Interface()
			envLogs = append(
				envLogs,
				zap.String(t.Field(i).Name, fmt.Sprintf("%v", val)),
			)
		}
	}

	logs.Logger.Info("Environments", envLogs...)
}
