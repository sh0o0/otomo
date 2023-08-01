package rollback

import (
	"context"
	"errors"
	"reflect"
	"testing"

	"github.com/stretchr/testify/assert"
)

// TODO: Fix tests below
// TODO: Add a test for RollbackForPanicWithRepanic
func TestRollbacker_Add(t *testing.T) {
	var (
		giveCtx         = context.TODO()
		giveDescription = "test"
		giveRbFunc      = func(ctx context.Context) error { return nil }
	)
	rbr := &Rollbacker{}
	rbr.Add(giveCtx, giveDescription, giveRbFunc)
	assert.Len(t, rbr.rollbacks, 1)
	assert.Exactly(t, giveDescription, rbr.rollbacks[0].description)
	assert.Exactly(
		t,
		reflect.ValueOf(giveRbFunc).Pointer(),
		reflect.ValueOf(rbr.rollbacks[0].funk).Pointer(),
	)
}

func TestRollbacker_Rollback_ShouldCallFunksInReverseOrder_WhenCall(t *testing.T) {
	var (
		result = []int{}
		want   = []int{3, 2, 1}
	)

	rbr := &Rollbacker{
		rollbacks: []*rollback{
			{
				description: "add 1",
				funk: func(c context.Context) error {
					result = append(result, 1)
					return nil
				},
			},
			{
				description: "add 2",
				funk: func(c context.Context) error {
					result = append(result, 2)
					return nil
				},
			},
			{
				description: "add 3",
				funk: func(c context.Context) error {
					result = append(result, 3)
					return nil
				},
			},
		},
	}

	err := rbr.Rollback(context.TODO())
	assert.NoError(t, err)
	assert.Exactly(t, want, result)
}
func TestRollbacker_Rollback_ShouldReturnErrAndAdd31_WhenErrOccurredAtSecondRollback(t *testing.T) {
	var (
		occurredErr = errors.New("second err")
		added       = []int{}
		want        = []int{3, 1}
	)

	rbr := &Rollbacker{
		rollbacks: []*rollback{
			{
				description: "add 1",
				funk: func(c context.Context) error {
					added = append(added, 1)
					return nil
				},
			},
			{
				description: "add 2",
				funk: func(c context.Context) error {
					return occurredErr
				},
			},
			{
				description: "add 3",
				funk: func(c context.Context) error {
					added = append(added, 3)
					return nil
				},
			},
		},
	}

	err := rbr.Rollback(context.TODO())
	assert.ErrorIs(t, err, occurredErr)
	assert.Exactly(t, want, added)
}

func TestRollbacker_RollbackForPanicWithRepanic_ShouldCallRollback_WhenPanicOccurred(t *testing.T) {
	var (
		result = []int{}
		want   = []int{1}
	)
	rbr := &Rollbacker{
		rollbacks: []*rollback{
			{
				description: "add 1",
				funk: func(c context.Context) error {
					result = append(result, 1)
					return nil
				},
			},
		},
	}

	defer func() {
		assert.NotNil(t, recover())
	}()

	func() {
		defer rbr.RollbackForPanicWithRepanic(context.TODO())
		panic("panic occurred!!!")
	}()

	assert.Exactly(t, result, want)
}
func TestRollbacker_RollbackForPanic_ShouldNotCallRollback_WhenNoPanic(t *testing.T) {
	var (
		addTarget = []int{}
		want      = []int{}
	)
	rbr := &Rollbacker{
		rollbacks: []*rollback{
			{
				description: "add 1",
				funk: func(c context.Context) error {
					addTarget = append(addTarget, 1)
					return nil
				},
			},
		},
	}

	func() {
		rbr.RollbackForPanicWithRepanic(context.TODO())
	}()

	assert.Exactly(t, addTarget, want)
}
