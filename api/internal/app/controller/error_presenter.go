package controller

import (
	"context"
	"errors"
	"otomo/internal/pkg/errs"

	"github.com/golang/protobuf/proto"
	"google.golang.org/genproto/googleapis/rpc/errdetails"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type errorPresenter struct{}

func (pr errorPresenter) ErrorOutput(
	ctx context.Context, err error,
) *status.Status {
	st, err := status.New(
		pr.getCode(err),
		err.Error(),
	).WithDetails(pr.getDetails(err)...)
	if err != nil {
		return status.New(codes.Internal, err.Error())
	}
	return st
}

func (pr errorPresenter) getCode(err error) codes.Code {
	var errsErr *errs.Error
	if errors.As(err, &errsErr) {
		return pr.getCodeFromErrsErr(errsErr)
	}
	return codes.Code(codes.Unknown)
}

func (pr errorPresenter) getCodeFromErrsErr(errsErr *errs.Error) codes.Code {
	var code = codes.Unknown

	switch errsErr.Cause {
	case errs.CauseInternal:
		code = codes.Internal
	case errs.CauseInvalidArg:
		code = codes.InvalidArgument
	case errs.CauseNotFound:
		code = codes.NotFound
	case errs.CauseNotFoundFromContext:
		code = codes.Unknown
	case errs.CauseNotExist:
		code = codes.Internal
	}

	return code
}

func (pr errorPresenter) getDetails(err error) []proto.Message {
	var errsErr *errs.Error
	if errors.As(err, &errsErr) {
		return []proto.Message{
			&errdetails.ErrorInfo{
				Reason:   string(errsErr.Cause),
				Domain:   string(errsErr.Domain),
				Metadata: map[string]string{"field": string(errsErr.Field)},
			},
		}
	}
	return []proto.Message{}
}
