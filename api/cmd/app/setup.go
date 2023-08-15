package main

import (
	"otomo/internal/pkg/logs"

	"go.uber.org/zap/zapcore"
)

func setupLogger(
	encoding string,
	debug bool,
) error {
	var (
		level       zapcore.Level = zapcore.InfoLevel
		development bool          = false
	)

	if debug {
		level = zapcore.DebugLevel
		development = true
	}

	logger, err := logs.NewStackdriverLogging(level, development, encoding)
	if err != nil {
		return err
	}

	logs.Logger = logger
	return nil
}

func printEnv(
	conf Conf,
) {
	logs.Logger.Info("[ Environment ]")

	es, err := conf.String()
	if err != nil {
		logs.Logger.Warn(err.Error())
	} else {
		logs.Logger.Info(es)
	}
}
