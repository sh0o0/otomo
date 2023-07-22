package usecase

import (
	"context"
	"errors"
	"strings"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

func TestRollbacker_Add(t *testing.T) {
	type fields struct {
		rollbacks []*Rollback
	}
	type args struct {
		rb *Rollback
	}
	tests := []struct {
		name           string
		fields         fields
		args           args
		wantRollbacker *Rollbacker
	}{
		{
			name: strings.Join([]string{
				"should added",
				"when add rollback func",
			}, " "),
			fields: fields{},
			args:   args{rb: &Rollback{}},
			wantRollbacker: &Rollbacker{
				rollbacks: []*Rollback{
					{},
				},
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			rbr := &Rollbacker{
				rollbacks: tt.fields.rollbacks,
			}
			rbr.Add(tt.args.rb)
			assert.Exactly(t, tt.wantRollbacker, rbr)
		})
	}
}

func TestRollbacker_Rollback_ShouldBeIntSlice321_WhenCallThatIsAppendedAddIntFunc(t *testing.T) {
	var (
		added = []int{}
		want  = []int{3, 2, 1}
	)

	rbr := &Rollbacker{
		rollbacks: []*Rollback{
			{
				Description: "add 1",
				Func: func(c context.Context) error {
					added = append(added, 1)
					return nil
				},
			},
			{
				Description: "add 2",
				Func: func(c context.Context) error {
					added = append(added, 2)
					return nil
				},
			},
			{
				Description: "add 3",
				Func: func(c context.Context) error {
					added = append(added, 3)
					return nil
				},
			},
		},
	}

	err := rbr.Rollback(context.TODO())
	assert.NoError(t, err)
	assert.Exactly(t, want, added)
}
func TestRollbacker_Rollback_ShouldReturnErrAndBeIntSlice31_WhenHappendErrAtSecondRollback(t *testing.T) {
	var (
		happendErr = errors.New("second err")
		added      = []int{}
		want       = []int{3, 1}
	)

	rbr := &Rollbacker{
		rollbacks: []*Rollback{
			{
				Description: "add 1",
				Func: func(c context.Context) error {
					added = append(added, 1)
					return nil
				},
			},
			{
				Description: "add 2",
				Func: func(c context.Context) error {
					return happendErr
				},
			},
			{
				Description: "add 3",
				Func: func(c context.Context) error {
					added = append(added, 3)
					return nil
				},
			},
		},
	}

	err := rbr.Rollback(context.TODO())
	assert.ErrorIs(t, err, happendErr)
	assert.Exactly(t, want, added)
}

func TestRollbacker_RollbackForPanic_ShouldCallRollback_WhenHappendPanic(t *testing.T) {
	var (
		addTarget = []int{}
		want      = []int{1}
	)
	rbr := &Rollbacker{
		rollbacks: []*Rollback{
			{
				Description: "add 1",
				Func: func(c context.Context) error {
					addTarget = append(addTarget, 1)
					return nil
				},
			},
		},
	}

	go func() {
		defer rbr.RollbackForPanic(context.TODO())
		panic("happend panic error!!!")
	}()

	time.Sleep(time.Second)

	assert.Exactly(t, addTarget, want)
}
func TestRollbacker_RollbackForPanic_ShouldNotCallRollback_WhenNoPanic(t *testing.T) {
	var (
		addTarget = []int{}
		want      = []int{}
	)
	rbr := &Rollbacker{
		rollbacks: []*Rollback{
			{
				Description: "add 1",
				Func: func(c context.Context) error {
					addTarget = append(addTarget, 1)
					return nil
				},
			},
		},
	}

	go func() {
		defer rbr.RollbackForPanic(context.TODO())
	}()

	time.Sleep(time.Second)

	assert.Exactly(t, addTarget, want)
}
