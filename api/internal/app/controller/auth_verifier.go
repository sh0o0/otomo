package controller

import (
	"context"
	"errors"

	"firebase.google.com/go/auth"
)

var _ AuthVerifier = (*AuthVerifierImpl)(nil)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type IDTokenVerifier interface {
	VerifyIDTokenAndCheckRevoked(
		ctx context.Context,
		tokenStr string,
	) (*auth.Token, error)
}

type AuthVerifierImpl struct {
	idTokenVerifier     IDTokenVerifier
	usernamePasswordMap map[string]string
}

func NewAuthVerifierImpl(
	idTokenVerifier IDTokenVerifier,
	usernamePasswordMap map[string]string,
) *AuthVerifierImpl {
	return &AuthVerifierImpl{
		idTokenVerifier:     idTokenVerifier,
		usernamePasswordMap: usernamePasswordMap,
	}
}

func (av *AuthVerifierImpl) VerifyIDTokenAndCheckRevoked(
	ctx context.Context,
	tokenStr string,
) (*auth.Token, error) {
	return av.idTokenVerifier.VerifyIDTokenAndCheckRevoked(ctx, tokenStr)
}

func (av *AuthVerifierImpl) VerifyUsernameAndPassword(
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
