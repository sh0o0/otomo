package rollback

import (
	"context"
	"errors"
	"otomo/pkg/log"
)

// Rollbacker is util of rollback.
type Rollbacker struct {
	rollbacks []*rollback
}

func NewRollbacker() *Rollbacker {
	return &Rollbacker{}
}

type rollback struct {
	description string
	funk        rollbackFunc
}

func NewRollback(
	description string,
	rf rollbackFunc,
) *rollback {
	return &rollback{
		description: description,
		funk:        rf,
	}
}

type rollbackFunc func(c context.Context) error

func (rbr *Rollbacker) Add(rb *rollback) {
	rbr.rollbacks = append(rbr.rollbacks, rb)
}

func (rbr *Rollbacker) Rollback(ctx context.Context) error {
	logger := log.FromContext(ctx)

	var ers error

	for i, rb := range rbr.copyReverseRollbacks() {
		logger.Info(
			rb.description,
			log.Bool("is_rollback", true),
			log.Int("rollback_index", i),
		)

		if err := rb.funk(ctx); err != nil {
			// TODO: wanna make a func named RollbackWithErrorNotice and erase this statement
			logger.Error(
				"A rollback failed",
				log.Bool("is_rollback", true),
				log.Error(err),
				log.String("rollback_description", rb.description),
				log.Int("rollback_index", i),
			)

			if ers == nil {
				ers = err
			} else {
				ers = errors.Join(ers, err)
			}
		}

	}

	return ers
}

// Usage: defer rb.RollbackForPanic()
func (rbr *Rollbacker) RollbackForPanic(ctx context.Context) error {
	if err := recover(); err != nil {
		log.FromContext(ctx).Warn(
			"Start rollback for panic",
			log.Bool("is_rollback", true),
			log.Any("panic_description", err),
		)
		return rbr.Rollback(ctx)
	}
	return nil
}

func (rbr *Rollbacker) copyReverseRollbacks() []*rollback {
	result := make([]*rollback, len(rbr.rollbacks))

	copy(result, rbr.rollbacks)

	for i, j := 0, len(result)-1; i < j; i, j = i+1, j-1 {
		result[i], result[j] = result[j], result[i]
	}

	return result
}
