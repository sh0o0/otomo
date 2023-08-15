package middleware

import (
	"context"
	"fmt"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/logs"
	"regexp"

	grpc_zap "github.com/grpc-ecosystem/go-grpc-middleware/logging/zap"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
)

func gRPCZapUnaryServerInterceptor(logger *zap.Logger) grpc.UnaryServerInterceptor {
	// get from https://pkg.go.dev/github.com/grpc-ecosystem/go-grpc-middleware/logging/zap example

	// Shared options for the logger, with a custom gRPC code to log level function.
	opts := []grpc_zap.Option{
		grpc_zap.WithLevels(grpc_zap.DefaultCodeToLevel),
	}
	// Make sure that log statements internal to gRPC library are logged using the zapLogger as well.
	grpc_zap.ReplaceGrpcLoggerV2(logger)

	return grpc_zap.UnaryServerInterceptor(logger, opts...)
}

func injectTraceUnaryServerInterceptor(logger *zap.Logger, gcpProjectID string) grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
		newLogger := injectTrace(ctx, logger, gcpProjectID)
		newCtx := logs.ToContext(ctx, newLogger)
		return handler(newCtx, req)
	}
}

// set after InjectTraceUnaryServerInterceptor and AuthInterceptor
func withUserIDLoggerUnaryServerInterceptor() grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
		userID, err := ctxs.UserIDFromContext(ctx)
		if err != nil {
			return handler(ctx, req)
		}

		newLogger := logs.FromContext(ctx).With(zap.String("userId", userID))
		ctx = logs.ToContext(ctx, newLogger)
		return handler(ctx, req)
	}
}

func injectTrace(ctx context.Context, logger *zap.Logger, project string) *zap.Logger {
	md, _ := metadata.FromIncomingContext(ctx)
	var headerStr string
	if traces := md.Get("X-Cloud-Trace-Context"); len(traces) != 0 {
		headerStr = md.Get("X-Cloud-Trace-Context")[0]
	}

	trace, spanID := deconstructXCloudTraceContext(headerStr)
	return logger.With(
		zap.String("logging.googleapis.com/trace", fmt.Sprintf("projects/%s/traces/%s", project, trace)),
		zap.String("logging.googleapis.com/spanId", spanID),
	)
}

var reCloudTraceContext = regexp.MustCompile(`([a-f\d]+)/([a-f\d]+)`)

func deconstructXCloudTraceContext(s string) (traceID, spanID string) {
	matches := reCloudTraceContext.FindAllStringSubmatch(s, -1)
	if len(matches) != 1 {
		return
	}

	sub := matches[0]
	if len(sub) != 3 {
		return
	}

	traceID, spanID = sub[1], sub[2]
	if spanID == "0" {
		spanID = ""
	}

	return
}
