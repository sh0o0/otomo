package errs

import (
	"errors"
	"otomo/test/testutil"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestIsNotFoundErr(t *testing.T) {
	type args struct {
		err error
	}
	tests := []struct {
		name string
		args args
		want bool
	}{
		{
			name: testutil.JoinStrings(
				"should return true",
				"when err is *Error and Cause is CauseNotFound",
			),
			args: args{err: &Error{Cause: CauseNotFound}},
			want: true,
		},
		{
			name: testutil.JoinStrings(
				"should return false",
				"when err is *Error and Cause is not CauseNotFound",
			),
			args: args{err: &Error{Cause: CauseInternal}},
			want: false,
		},
		{
			name: testutil.JoinStrings(
				"should return false",
				"when err is not *Error",
			),
			args: args{err: errors.New("error")},
			want: false,
		},
		{
			name: testutil.JoinStrings(
				"should return false",
				"when err is nil",
			),
			args: args{err: nil},
			want: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := IsNotFoundErr(tt.args.err)
			assert.Exactly(t, got, tt.want)
		})
	}
}
