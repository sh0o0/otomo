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

type serverStream struct {
	grpc.ServerStream
	ctx context.Context
}

func gRPCZapUnaryServerInterceptor(logger *zap.Logger) grpc.UnaryServerInterceptor {
	opts := getGRPCZapInterceptorOptions(logger)
	// Make sure that log statements internal to gRPC library are logged using the zapLogger as well.
	grpc_zap.ReplaceGrpcLoggerV2(logger)
	return grpc_zap.UnaryServerInterceptor(logger, opts...)
}

func gRPCZapStreamServerInterceptor(logger *zap.Logger) grpc.StreamServerInterceptor {
	opts := getGRPCZapInterceptorOptions(logger)
	// Make sure that log statements internal to gRPC library are logged using the zapLogger as well.
	grpc_zap.ReplaceGrpcLoggerV2(logger)
	return grpc_zap.StreamServerInterceptor(logger, opts...)
}

func getGRPCZapInterceptorOptions(logger *zap.Logger) []grpc_zap.Option {
	// get from https://pkg.go.dev/github.com/grpc-ecosystem/go-grpc-middleware/logging/zap example

	// Shared options for the logger, with a custom gRPC code to log level function.
	opts := []grpc_zap.Option{
		grpc_zap.WithLevels(grpc_zap.DefaultCodeToLevel),
	}

	return opts
}

func injectTraceLoggerUnaryServerInterceptor(logger *zap.Logger, gcpProjectID string) grpc.UnaryServerInterceptor {
	return func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
		return handler(injectTraceLoggerToContext(ctx, logger, gcpProjectID), req)
	}
}
func injectTraceLoggerStreamServerInterceptor(logger *zap.Logger, gcpProjectID string) grpc.StreamServerInterceptor {
	return func(srv interface{}, ss grpc.ServerStream, info *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
		newCtx := injectTraceLoggerToContext(ss.Context(), logger, gcpProjectID)
		return handler(srv, &serverStream{
			ServerStream: ss,
			ctx:          newCtx,
		})
	}
}

func injectTraceLoggerToContext(
	ctx context.Context, logger *zap.Logger, gcpProjectID string,
) context.Context {
	newLogger := injectTrace(ctx, logger, gcpProjectID)
	return logs.ToContext(ctx, newLogger)
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

func withUserIDLoggerStreamServerInterceptor() grpc.StreamServerInterceptor {
	return func(srv interface{}, ss grpc.ServerStream, info *grpc.StreamServerInfo, handler grpc.StreamHandler) error {
		ctx := ss.Context()
		userID, err := ctxs.UserIDFromContext(ctx)
		if err != nil {
			return handler(srv, ss)
		}
		newLogger := logs.FromContext(ctx).With(zap.String("userId", userID))
		newCtx := logs.ToContext(ctx, newLogger)
		return handler(srv, &serverStream{
			ServerStream: ss,
			ctx:          newCtx,
		})
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
