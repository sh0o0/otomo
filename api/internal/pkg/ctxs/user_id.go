package ctxs

import (
	"context"
	"otomo/internal/pkg/errs"
)

type ctxUserIDKey struct{}

func UserIDFromContext(ctx context.Context) (string, error) {
	if id, ok := ctx.Value(ctxUserIDKey{}).(string); ok {
		return id, nil
	}
	return "", &errs.Error{
		Message: "not inject user id to context",
		Cause:   errs.CauseNotFoundFromContext,
		Domain:  errs.DomainUser,
		Field:   errs.FieldID,
	}
}

func UserIs(ctx context.Context, userID string) bool {
	userIDFromCtx, err := UserIDFromContext(ctx)
	if err != nil {
		return false
	}

	return userID == userIDFromCtx
}

func UserIDToContext(ctx context.Context, userID string) context.Context {
	return context.WithValue(ctx, ctxUserIDKey{}, userID)
}
