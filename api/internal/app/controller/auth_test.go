package controller

import (
	"context"
	"errors"
	"otomo/internal/app/controller/mock_controller"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/uuid"
	"otomo/test/testgrpc"
	"strings"
	"testing"

	"firebase.google.com/go/auth"
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
		userID            = uuid.NewString()
		username          = uuid.NewString()
		password          = uuid.NewString()
		bearerTokenHeader = "bearer " + token
		basicTokenHeader  = "basic " + EncodeBasicAuth(username, password)
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
					Return(&auth.Token{UID: userID}, nil).
					Times(1)
				return args
			}(),
			callArgs: callArgs{
				headers: map[string]string{
					AuthRequestHeaderKey: bearerTokenHeader,
				},
			},
			verifyInterceptor: func(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
				extractedUserID, err := ctxs.UserIDFromContext(ctx)
				assert.NoError(t, err)
				assert.Exactly(t, userID, extractedUserID)
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
				"should return",
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

			lis := testgrpc.NewListener()
			server := testgrpc.ServeTestService(t, lis, sOpts...)
			defer server.Stop()
			conn, err := testgrpc.NewClientConn(lis)
			if err != nil {
				t.Fatal(err)
			}
			defer conn.Close()

			var ctx = context.Background()
			for k, v := range tt.callArgs.headers {
				ctx = metadata.AppendToOutgoingContext(ctx, k, v)
			}

			err = testgrpc.CallTestService(ctx, conn)
			assert.Exactly(t, tt.wantCalledIsErr, err != nil)
			if tt.wantCalledIsErr {
				assert.Exactly(t, tt.wantCalledErrCode, status.Code(err))
			}
		})
	}
}
