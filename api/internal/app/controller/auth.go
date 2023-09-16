package controller

import (
	"context"
	"encoding/base64"
	"errors"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"strings"

	"firebase.google.com/go/v4/auth"
	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"github.com/grpc-ecosystem/go-grpc-middleware/util/metautils"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

var (
	AuthRequestHeaderKey  = "authorization"
	AuthResponseHeaderKey = "www-authenticate"
	AuthSchemaBearer      = "bearer"
	AuthSchemaBasic       = "basic"
)

type AuthVerifier interface {
	VerifyIDTokenAndCheckRevoked(
		ctx context.Context,
		tokenStr string,
	) (*auth.Token, error)
	VerifyUsernameAndPassword(
		ctx context.Context,
		username,
		password string,
	) error
}

type AuthController struct {
	verifier AuthVerifier
}

func NewAuthController(verifier AuthVerifier) *AuthController {
	return &AuthController{
		verifier: verifier,
	}
}

func (a *AuthController) Authorization(ctx context.Context) (context.Context, error) {
	schema, err := a.getAuthSchema(ctx)
	if err != nil {
		if err := setInvalidTokenHeader(ctx, ""); err != nil {
			return nil, err
		}
		return nil, status.New(codes.Unauthenticated, err.Error()).Err()
	}

	var (
		userID  string
		authErr error
	)
	switch schema {
	case AuthSchemaBearer:
		userID, authErr = a.authorizeBearer(ctx)
		if authErr == nil {
			ctx = ctxs.AuthRoleToContext(ctx, model.UserAuthRole)
			ctx = ctxs.UserIDToContext(ctx, model.UserID(userID))
		}
	case AuthSchemaBasic:
		authErr = a.authorizeBasic(ctx)
		if authErr == nil {
			ctx = ctxs.AuthRoleToContext(ctx, model.AdminAuthRole)
		}
	default:
		authErr = errors.New(schema + " is unexpected authorization schema")
	}

	if authErr != nil {
		if err := setInvalidTokenHeader(ctx, schema); err != nil {
			return nil, err
		}
		return nil, invalidTokenError(authErr.Error())
	}

	if err := setAuthorizedMD(ctx, schema); err != nil {
		return nil, err
	}

	return ctx, nil
}

func (a *AuthController) getAuthSchema(ctx context.Context) (string, error) {
	val := metautils.ExtractIncoming(ctx).Get(AuthRequestHeaderKey)
	if val == "" {
		return "", errors.New("request unauthenticated")
	}
	splits := strings.SplitN(val, " ", 2)
	if len(splits) < 2 {
		return "", errors.New("bad authorization string")
	}
	return strings.TrimSpace(splits[0]), nil
}

func (a *AuthController) authorizeBasic(ctx context.Context) error {
	auth, err := grpc_auth.AuthFromMD(ctx, AuthSchemaBasic)
	if err != nil {
		return err
	}

	username, password, err := decodeBasicAuth(auth)
	if err != nil {
		return err
	}

	return a.verifier.VerifyUsernameAndPassword(
		ctx,
		username,
		password,
	)
}

func (a *AuthController) authorizeBearer(
	ctx context.Context,
) (
	userID string,
	err error,
) {
	tokenStr, err := grpc_auth.AuthFromMD(ctx, AuthSchemaBearer)
	if err != nil {
		return "", err
	}

	token, err := a.verifier.VerifyIDTokenAndCheckRevoked(ctx, tokenStr)
	if err != nil {
		return "", err
	}

	return token.UID, nil
}

func setInvalidTokenHeader(ctx context.Context, schema string) error {
	md := metadata.Pairs(
		AuthResponseHeaderKey,
		schema+` error="invalid_token"`,
	)
	if err := grpc.SetHeader(ctx, md); err != nil {
		return status.New(codes.Internal, err.Error()).Err()
	}

	return nil
}

func setAuthorizedMD(ctx context.Context, schema string) error {
	md := metadata.Pairs(
		AuthResponseHeaderKey,
		schema+` realm=""`,
	)
	if err := grpc.SetHeader(ctx, md); err != nil {
		return status.New(codes.Internal, err.Error()).Err()
	}

	return nil
}

func invalidTokenError(msg string) error {
	return status.New(
		codes.Unauthenticated,
		"invalid token. "+msg,
	).Err()
}

func encodeBasicAuth(username, password string) string {
	payload := username + ":" + password
	return base64.StdEncoding.EncodeToString([]byte(payload))
}

func decodeBasicAuth(auth string) (username string, password string, err error) {
	payload, err := base64.StdEncoding.DecodeString(auth)
	if err != nil {
		return "", "", err
	}

	pair := strings.Split(string(payload), ":")
	if len(pair) != 2 {
		return "", "", errors.New("unexpected basic auth payload")
	}

	return pair[0], pair[1], nil
}
