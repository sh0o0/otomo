package controller

import (
	"context"
	"errors"
	"otomo/internal/app/controller/mock_controller"
	"otomo/internal/pkg/uuid"
	"strings"
	"testing"

	"firebase.google.com/go/auth"

	"github.com/golang/mock/gomock"
	"github.com/stretchr/testify/assert"
)

type authVerifierImplFields struct {
	idTokenVerifier     *mock_controller.MockIDTokenVerifier
	usernamePasswordMap map[string]string
}

func newAuthVerifierImplFields(t *testing.T) authVerifierImplFields {
	mockCtrl := gomock.NewController(t)
	idTokenVerifier := mock_controller.NewMockIDTokenVerifier(mockCtrl)
	return authVerifierImplFields{
		idTokenVerifier: idTokenVerifier,
	}
}
func TestAuthVerifierImpl_VerifyIDTokenAndCheckRevoked(t *testing.T) {
	var (
		ctx      = context.TODO()
		tokenStr = uuid.NewString()
		token    = &auth.Token{UID: uuid.NewString()}
	)
	type args struct {
		ctx      context.Context
		tokenStr string
	}
	tests := []struct {
		name      string
		fields    authVerifierImplFields
		args      args
		want      *auth.Token
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return Token",
				"when input valid token string",
			}, " "),
			fields: func() authVerifierImplFields {
				fields := newAuthVerifierImplFields(t)
				fields.idTokenVerifier.
					EXPECT().
					VerifyIDTokenAndCheckRevoked(ctx, tokenStr).
					Return(token, nil).
					Times(1)
				return fields
			}(),
			args:      args{ctx: ctx, tokenStr: tokenStr},
			want:      token,
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when input invalid token string",
			}, " "),
			fields: func() authVerifierImplFields {
				fields := newAuthVerifierImplFields(t)
				fields.idTokenVerifier.
					EXPECT().
					VerifyIDTokenAndCheckRevoked(ctx, tokenStr).
					Return(nil, errors.New("invalid")).
					Times(1)
				return fields
			}(),
			args:      args{ctx: ctx, tokenStr: tokenStr},
			want:      nil,
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			av := &AuthVerifierImpl{
				idTokenVerifier:     tt.fields.idTokenVerifier,
				usernamePasswordMap: tt.fields.usernamePasswordMap,
			}
			got, err := av.VerifyIDTokenAndCheckRevoked(tt.args.ctx, tt.args.tokenStr)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("AuthVerifierImpl.VerifyIDTokenAndCheckRevoked() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			assert.Exactly(t, got, tt.want)
		})
	}
}

func TestAuthVerifierImpl_VerifyUsernameAndPassword(t *testing.T) {
	var (
		ctx                       = context.TODO()
		username                  = uuid.NewString()
		password                  = uuid.NewString()
		usernamePasswordMapsField = map[string]string{
			username:         password,
			uuid.NewString(): uuid.NewString(),
			uuid.NewString(): uuid.NewString(),
		}
	)
	type args struct {
		ctx      context.Context
		username string
		password string
	}
	tests := []struct {
		name                      string
		usernamePasswordMapsField map[string]string
		args                      args
		wantIsErr                 bool
	}{
		{
			name: strings.Join([]string{
				"should return nil",
				"when valid username and password",
			}, " "),
			usernamePasswordMapsField: usernamePasswordMapsField,
			args: args{
				ctx:      ctx,
				username: username,
				password: password,
			},
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when not exist username",
			}, " "),
			usernamePasswordMapsField: usernamePasswordMapsField,
			args: args{
				ctx:      ctx,
				username: uuid.NewString(),
				password: password,
			},
			wantIsErr: true,
		},
		{
			name: strings.Join([]string{
				"should return nil",
				"when invalid password",
			}, " "),
			usernamePasswordMapsField: usernamePasswordMapsField,
			args: args{
				ctx:      ctx,
				username: username,
				password: uuid.NewString(),
			},
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			av := &AuthVerifierImpl{
				usernamePasswordMap: tt.usernamePasswordMapsField,
			}
			if err := av.VerifyUsernameAndPassword(tt.args.ctx, tt.args.username, tt.args.password); (err != nil) != tt.wantIsErr {
				t.Errorf("AuthVerifierImpl.VerifyUsernameAndPassword() error = %v, wantIsErr %v", err, tt.wantIsErr)
			}
		})
	}
}
