package logs

import (
	"fmt"
	"os"
	"time"

	"cloud.google.com/go/logging"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

var Logger *zap.Logger

func init() {
	l, err := NewStackdriverLogging(zapcore.InfoLevel, false, "json")
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	Logger = l
}

func NewStackdriverLogging(
	level zapcore.Level,
	development bool,
	encoding string, // "json" or "console"
) (*zap.Logger, error) {
	return zap.Config{
		Level:       zap.NewAtomicLevelAt(level),
		Development: development,
		Sampling: &zap.SamplingConfig{
			Initial:    100,
			Thereafter: 100,
		},
		Encoding: encoding,
		EncoderConfig: zapcore.EncoderConfig{
			LevelKey:      "severity",
			NameKey:       "logger",
			CallerKey:     "caller",
			StacktraceKey: "stack_trace",
			TimeKey:       "time",
			MessageKey:    "message",
			LineEnding:    zapcore.DefaultLineEnding,
			EncodeTime:    zapcore.RFC3339NanoTimeEncoder,
			EncodeLevel:   levelEncode,
			EncodeCaller:  zapcore.ShortCallerEncoder,
			FunctionKey:   "func",
		},
		OutputPaths:      []string{"stdout"},
		ErrorOutputPaths: []string{"stderr"},
	}.Build()
}

func levelEncode(l zapcore.Level, enc zapcore.PrimitiveArrayEncoder) {
	switch l {
	case zapcore.DebugLevel:
		enc.AppendString(logging.Debug.String())
	case zapcore.InfoLevel:
		enc.AppendString(logging.Info.String())
	case zapcore.WarnLevel:
		enc.AppendString(logging.Warning.String())
	case zapcore.ErrorLevel:
		enc.AppendString(logging.Error.String())
	default:
		enc.AppendString(logging.Critical.String())
	}
}

func String(key, val string) zap.Field {
	return zap.String(key, val)
}

func Int(key string, val int) zap.Field {
	return zap.Int(key, val)
}

func Time(key string, val time.Time) zap.Field {
	return zap.Time(key, val)
}

func Duration(key string, val time.Duration) zap.Field {
	return zap.Duration(key, val)
}

func Bool(key string, val bool) zap.Field {
	return zap.Bool(key, val)
}

func Any(key string, val interface{}) zap.Field {
	return zap.Any(key, val)
}

func NamedError(key string, err error) zap.Field {
	return zap.NamedError(key, err)
}
