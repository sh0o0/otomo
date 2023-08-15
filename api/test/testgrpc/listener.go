package testgrpc

import "google.golang.org/grpc/test/bufconn"

func NewListener() *bufconn.Listener {
	return bufconn.Listen(1024 * 1024)
}
