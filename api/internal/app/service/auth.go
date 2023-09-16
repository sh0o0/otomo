package service

import (
	"context"
	"errors"
	"otomo/internal/app/controller"

	"firebase.google.com/go/v4/auth"
)

var _ controller.AuthVerifier = (*AuthVerifyService)(nil)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type IDTokenVerifier interface {
	VerifyIDTokenAndCheckRevoked(
		ctx context.Context,
		tokenStr string,
	) (*auth.Token, error)
}

type AuthVerifyService struct {
	idTokenVerifier     IDTokenVerifier
	usernamePasswordMap map[string]string
}

func NewAuthVerifyService(
	idTokenVerifier IDTokenVerifier,
	usernamePasswordMap map[string]string,
) *AuthVerifyService {
	return &AuthVerifyService{
		idTokenVerifier:     idTokenVerifier,
		usernamePasswordMap: usernamePasswordMap,
	}
}

func (av *AuthVerifyService) VerifyIDTokenAndCheckRevoked(
	ctx context.Context,
	tokenStr string,
) (*auth.Token, error) {
	return av.idTokenVerifier.VerifyIDTokenAndCheckRevoked(ctx, tokenStr)
}

func (av *AuthVerifyService) VerifyUsernameAndPassword(
	ctx context.Context,
	username,
	password string,
) error {
	pass, ok := av.usernamePasswordMap[username]
	if !ok {
		return errors.New("not exist user")
	}

	if password != pass {
		return errors.New("invalid password")
	}

	return nil
}
