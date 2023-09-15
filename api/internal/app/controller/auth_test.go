package controller

import (
	"context"
	"encoding/base64"
	"errors"
	"otomo/internal/app/controller/mock_controller"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
	"strings"
	"testing"

	"firebase.google.com/go/v4/auth"
	"github.com/golang/mock/gomock"
	grpc_auth "github.com/grpc-ecosystem/go-grpc-middleware/auth"
	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

type AuthInterceptorArgs struct {
	verifier *mock_controller.MockAuthVerifier
}

func newAuthInterceptorArgs(t *testing.T) AuthInterceptorArgs {
	mockCtrl := gomock.NewController(t)
	verifier := mock_controller.NewMockAuthVerifier(mockCtrl)
	return AuthInterceptorArgs{verifier: verifier}
}

func TestAuthInterceptor(t *testing.T) {
	var (
		token             = uuid.NewString()
		userID            = model.UserID(uuid.NewString())
		username          = uuid.NewString()
		password          = uuid.NewString()
		bearerTokenHeader = "bearer " + token
		basicTokenHeader  = "basic " + encodeBasicAuth(username, password)
	)
	type callArgs struct {
		headers map[string]string
	}
	tests := []struct {
		name              string
		interceptorArgs   AuthInterceptorArgs
		callArgs          callArgs
		verifyInterceptor grpc.UnaryServerInterceptor
		wantCalledIsErr   bool
		wantCalledErrCode codes.Code
	}{
		{
			name: strings.Join([]string{
				"should set user id to context",
				"when set valid bearer authorization token",
			}, " "),
			interceptorArgs: func() AuthInterceptorArgs {
				args := newAuthInterceptorArgs(t)
				args.verifier.
					EXPECT().
					VerifyIDTokenAndCheckRevoked(gomock.Any(), token).
					Return(&auth.Token{UID: string(userID)}, nil).
					Times(1)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{
					AuthRequestHeaderKey: bearerTokenHeader,
				},
			},
			verifyInterceptor: func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
				assert.NoError(t, err)
				assert.True(t, ctxs.UserIs(ctx, userID))
				assert.True(t, ctxs.AuthRoleIs(ctx, model.UserAuthRole))
				return handler(ctx, req)
			},
			wantCalledIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when set invalid bearer authorization token",
			}, " "),
			interceptorArgs: func() AuthInterceptorArgs {
				args := newAuthInterceptorArgs(t)
				args.verifier.
					EXPECT().
					VerifyIDTokenAndCheckRevoked(gomock.Any(), token).
					Return(nil, errors.New("invalid token")).
					Times(1)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{
					AuthRequestHeaderKey: bearerTokenHeader,
				},
			},
			wantCalledIsErr:   true,
			wantCalledErrCode: codes.Unauthenticated,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when not set header",
			}, " "),
			interceptorArgs: func() AuthInterceptorArgs {
				args := newAuthInterceptorArgs(t)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{},
			},
			wantCalledIsErr:   true,
			wantCalledErrCode: codes.Unauthenticated,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when not set bearer authorization token",
			}, " "),
			interceptorArgs: func() AuthInterceptorArgs {
				args := newAuthInterceptorArgs(t)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{
					AuthRequestHeaderKey: "",
				},
			},
			wantCalledIsErr:   true,
			wantCalledErrCode: codes.Unauthenticated,
		},
		{
			name: strings.Join([]string{
				"should return nil",
				"when set valid basic authorization token",
			}, " "),
			interceptorArgs: func() AuthInterceptorArgs {
				args := newAuthInterceptorArgs(t)
				args.verifier.
					EXPECT().
					VerifyUsernameAndPassword(
						gomock.Any(),
						username,
						password,
					).
					Return(nil).
					Times(1)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{
					AuthRequestHeaderKey: basicTokenHeader,
				},
			},
			wantCalledIsErr:   false,
			wantCalledErrCode: codes.OK,
			verifyInterceptor: func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
				assert.True(t, ctxs.AuthRoleIs(ctx, model.AdminAuthRole))
				return handler(ctx, req)
			},
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when invalid username or password",
			}, " "),
			interceptorArgs: func() AuthInterceptorArgs {
				args := newAuthInterceptorArgs(t)
				args.verifier.
					EXPECT().
					VerifyUsernameAndPassword(
						gomock.Any(),
						username,
						password,
					).
					Return(errors.New("invalid username or password")).
					Times(1)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{
					AuthRequestHeaderKey: basicTokenHeader,
				},
			},
			wantCalledIsErr:   true,
			wantCalledErrCode: codes.Unauthenticated,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()

			auth := &AuthController{verifier: tt.interceptorArgs.verifier}

			sOpts := []grpc.ServerOption{
				grpc.ChainUnaryInterceptor(
					grpc_auth.UnaryServerInterceptor(auth.Authorization),
					tt.verifyInterceptor,
				),
			}

			lis := testutil.NewListener()
			server := testutil.ServeTestService(t, lis, sOpts...)
			defer server.Stop()
			conn, err := testutil.NewClientConn(lis)
			if err != nil {
				t.Fatal(err)
			}
			defer conn.Close()

			var ctx = context.Background()
			for k, v := range tt.callArgs.headers {
				ctx = metadata.AppendToOutgoingContext(ctx, k, v)
			}

			err = testutil.CallTestService(ctx, conn)
			assert.Exactly(t, tt.wantCalledIsErr, err != nil)
			if tt.wantCalledIsErr {
				assert.Exactly(t, tt.wantCalledErrCode, status.Code(err))
			}
		})
	}
}

func TestEncodeBasicAuth(t *testing.T) {
	var (
		userID   = uuid.NewString()
		password = uuid.NewString()
		payload  = userID + ":" + password
		decoded  = base64.StdEncoding.EncodeToString([]byte(payload))
	)
	type args struct {
		userID   string
		password string
	}
	tests := []struct {
		name string
		args args
		want string
	}{
		{
			name: strings.Join([]string{
				"should return encoded basic auth string",
				"when input userID and password",
			}, " "),
			args: args{userID: userID, password: password},
			want: decoded,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			if got := encodeBasicAuth(tt.args.userID, tt.args.password); got != tt.want {
				t.Errorf("EncodeBasicAuth() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestDecodeBasicAuth(t *testing.T) {
	var (
		userID   = uuid.NewString()
		password = uuid.NewString()
		auth     = encodeBasicAuth(userID, password)
		misAuth  = base64.StdEncoding.EncodeToString([]byte(userID + password))
	)
	type args struct {
		auth string
	}
	tests := []struct {
		name         string
		args         args
		wantUsername string
		wantPassword string
		wantIsErr    bool
	}{
		{
			name: strings.Join([]string{
				"should return userID and password",
				"when input auth",
			}, " "),
			args:         args{auth: auth},
			wantUsername: userID,
			wantPassword: password,
			wantIsErr:    false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when input misAuth",
			}, " "),
			args:         args{misAuth},
			wantUsername: "",
			wantPassword: "",
			wantIsErr:    true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			gotUsername, gotPassword, err := decodeBasicAuth(tt.args.auth)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("DecodeBasicAuth() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			if gotUsername != tt.wantUsername {
				t.Errorf("DecodeBasicAuth() gotUsername = %v, want %v", gotUsername, tt.wantUsername)
			}
			if gotPassword != tt.wantPassword {
				t.Errorf("DecodeBasicAuth() gotPassword = %v, want %v", gotPassword, tt.wantPassword)
			}
		})
	}
}
