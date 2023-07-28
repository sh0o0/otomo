package rollback

import (
	"otomo/internal/app/usecase/ucboundary"
)

var _ ucboundary.RollbackerFactory = (*RollbackerFactory)(nil)

type RollbackerFactory struct{}

func NewRollbackerFactory() *RollbackerFactory {
	return &RollbackerFactory{}
}

func (r *RollbackerFactory) New() ucboundary.Rollbacker {
	return &Rollbacker{}
}
