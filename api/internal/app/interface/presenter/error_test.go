package presenter

import (
	"context"
	"otomo/pkg/errs"
	"otomo/test/testutil"
	"testing"

	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	"github.com/stretchr/testify/assert"
)

func TestErrorPresenter_ErrorOutput(t *testing.T) {
	type args struct {
		err error
	}
	tests := []struct {
		name string
		args args
		want *status.Status
	}{
		{
			name: testutil.JoinStrings(
				"should return status with code Internal and err details",
				"when give error machine it",
			),
			args: args{
				err: &errs.Error{
					Message: "error",
					Cause:   errs.CauseInternal,
					Domain:  errs.DomainMessageWithOtomo,
					Field:   errs.FieldID,
				},
			},
			want: func() *status.Status {
				st, err := status.New(
					codes.Internal,
					"error",
				).WithDetails(
					&errdetails.ErrorInfo{
						Reason:   string(errs.CauseInternal),
						Domain:   string(errs.DomainMessageWithOtomo),
						Metadata: map[string]string{"field": string(errs.FieldID)},
					},
				)
				if err != nil {
					t.Fatal(err)
				}
				return st
			}(),
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			pr := &ErrorPresenter{}
			got := pr.ErrorOutput(context.TODO(), tt.args.err)
			assert.Exactly(t, got, tt.want)
		})
	}
}

func TestErrorPresenter_ErrorOutput_ForErrCodes(t *testing.T) {
	type args struct {
		err *errs.Error
	}
	tests := []struct {
		name string
		args args
		want codes.Code
	}{
		{
			name: "should return code Internal when cause is CauseInternal",
			args: args{
				err: &errs.Error{Cause: errs.CauseInternal},
			},
			want: codes.Internal,
		},
		{
			name: "should return code InvalidArgument when cause is InvalidArg",
			args: args{
				err: &errs.Error{Cause: errs.CauseInvalidArg},
			},
			want: codes.InvalidArgument,
		},
		{
			name: "should return code NotFound when cause is CauseNotFound",
			args: args{
				err: &errs.Error{Cause: errs.CauseNotFound},
			},
			want: codes.NotFound,
		},
		{
			name: "should return code Unknown when cause is CauseNotFoundFromContext",
			args: args{
				err: &errs.Error{Cause: errs.CauseNotFoundFromContext},
			},
			want: codes.Unknown,
		},
		{
			name: "should return code Internal when cause is CauseNotExist",
			args: args{
				err: &errs.Error{Cause: errs.CauseNotExist},
			},
			want: codes.Internal,
		},
		{
			name: "should return code Unknown when cause is invalid",
			args: args{
				err: &errs.Error{Cause: "test"},
			},
			want: codes.Unknown,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			pr := &ErrorPresenter{}
			got := pr.ErrorOutput(context.TODO(), tt.args.err)
			assert.Exactly(t, got.Code(), tt.want)
		})
	}
}
