package ucboundary

import "context"

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type (
	RollbackerFactory interface {
		New() Rollbacker
	}
	Rollbacker interface {
		Add(
			ctx context.Context,
			description string,
			rollbackFunc func(ctx context.Context) error,
		)
		Rollback(ctx context.Context) error
		RollbackForPanic(ctx context.Context) error
	}
)
