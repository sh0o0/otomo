package repository

import (
	"otomo/pkg/errs"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

// TODO: Add tests

func ifCodesNotFoundReturnErrsNotFound(
	err error,
	domain errs.Domain,
	field errs.Field,
) error {
	if status.Code(err) == codes.NotFound {
		return &errs.Error{
			Message: err.Error(),
			Cause:   errs.CauseNotFound,
			Domain:  domain,
			Field:   field,
		}
	}
	return err
}
