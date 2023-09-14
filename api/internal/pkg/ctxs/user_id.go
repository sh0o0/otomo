package ctxs

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"
)

type (
	ctxUserIDKey   struct{}
	ctxAuthRoleKey struct{}
)

func UserIDToContext(ctx context.Context, userID model.UserID) context.Context {
	return context.WithValue(ctx, ctxUserIDKey{}, userID)
}

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

func AuthRoleToContext(ctx context.Context, role model.AuthRole) context.Context {
	return context.WithValue(ctx, ctxAuthRoleKey{}, role)
}

func AuthRoleFromContext(ctx context.Context) (model.AuthRole, error) {
	if role, ok := ctx.Value(ctxAuthRoleKey{}).(model.AuthRole); ok {
		return role, nil
	}
	return 0, &errs.Error{
		Message: "not inject auth role to context",
		Cause:   errs.CauseNotFoundFromContext,
		Domain:  errs.DomainUser,
		Field:   errs.FieldAuthRole,
	}
}

func AuthRoleIs(ctx context.Context, role model.AuthRole) bool {
	roleFromCtx, err := AuthRoleFromContext(ctx)
	if err != nil {
		return false
	}

	return role == roleFromCtx
}
