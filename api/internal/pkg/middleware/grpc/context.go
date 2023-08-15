package middleware

import (
	grpc_ctxtags "github.com/grpc-ecosystem/go-grpc-middleware/tags"
	"google.golang.org/grpc"
)

func contextUnaryServerInterceptor() grpc.UnaryServerInterceptor {
	// Create a server, make sure we put the grpc_ctxtags context before everything else.
	return grpc_ctxtags.UnaryServerInterceptor(
		grpc_ctxtags.WithFieldExtractor(
			grpc_ctxtags.CodeGenRequestFieldExtractor,
		),
	)
}
