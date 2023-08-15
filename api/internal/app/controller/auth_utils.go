package controller

import (
	"context"
	"encoding/base64"
	"errors"
	"strings"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

var (
// authTokenRequiredHeaderMd = metadata.Pairs(
//
//	authRespHeaderKey,
//	`bearer realm="token_required"`,
//
// )
// authInvalidReqMd = metadata.Pairs(
//
//	authRespHeaderKey,
//	`Bearer error="invalid_request"`,
//
// )
// authInsufficientScopeMd = metadata.Pairs(
//
//	authRespHeaderKey,
//	`Bearer error="insufficient_scope"`,
//
// )
)

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

func invalidTokenError(ctx context.Context, msg string) error {
	return status.New(
		codes.Unauthenticated,
		"invalid token. "+msg,
	).Err()
}

func EncodeBasicAuth(username, password string) string {
	payload := username + ":" + password
	return base64.StdEncoding.EncodeToString([]byte(payload))
}

func DecodeBasicAuth(auth string) (username string, password string, err error) {
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
