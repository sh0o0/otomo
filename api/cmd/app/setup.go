package main

import (
	"otomo/pkg/log"

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

	logger, err := log.NewStackdriverLogging(level, development, encoding)
	if err != nil {
		return err
	}

	log.Logger = logger
	return nil
}

func printEnv(
	conf Conf,
) {
	log.Logger.Info("[ Environment ]")

	es, err := conf.String()
	if err != nil {
		log.Logger.Warn(err.Error())
	} else {
		log.Logger.Info(es)
	}
}
