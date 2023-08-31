package ctxs

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"
)

type ctxUserIDKey struct{}

func UserIDFromContext(ctx context.Context) (model.UserID, error) {
	if id, ok := ctx.Value(ctxUserIDKey{}).(model.UserID); ok {
		return id, nil
	}
	return "", &errs.Error{
		Message: "not inject user id to context",
		Cause:   errs.CauseNotFoundFromContext,
		Domain:  errs.DomainUser,
		Field:   errs.FieldID,
	}
}

func UserIs(ctx context.Context, userID model.UserID) bool {
	userIDFromCtx, err := UserIDFromContext(ctx)
	if err != nil {
		return false
	}

	return userID == userIDFromCtx
}

func UserIDToContext(ctx context.Context, userID model.UserID) context.Context {
	return context.WithValue(ctx, ctxUserIDKey{}, userID)
}
