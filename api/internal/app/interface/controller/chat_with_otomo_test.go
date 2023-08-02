package controller

import (
	"context"
	"errors"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/internal/app/interface/controller/present/mock_present"
	"otomo/internal/app/usecase/ucboundary/mock_ucboundary"
	"otomo/pkg/ctxs"
	"otomo/pkg/uuid"
	"strings"
	"testing"

	"github.com/golang/mock/gomock"
	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type chatWithOtomoControllerFields struct {
	useCase   *mock_ucboundary.MockChatWithOtomoUseCase
	presenter *mock_present.MockChatWithOtomoPresenter
}

func newChatWithOtomoControllerFields(t *testing.T) *chatWithOtomoControllerFields {
	mockCtrl := gomock.NewController(t)
	useCase := mock_ucboundary.NewMockChatWithOtomoUseCase(mockCtrl)
	presenter := mock_present.NewMockChatWithOtomoPresenter(mockCtrl)
	return &chatWithOtomoControllerFields{
		useCase:   useCase,
		presenter: presenter,
	}
}

func TestChatWithOtomoController_MessageToOtomo(t *testing.T) {
	var (
		userID           = user.ID(uuid.NewString())
		giveCtxWithUseID = ctxs.UserIDToContext(context.TODO(), string(userID))
		giveText         = "Hello, Otomo!"
		reply            = message.NewMessageWithOtomo(
			userID,
			message.OtomoRole,
			message.UserRole,
			"Hello, User!",
		)
		output  = &grpcgen.ChatWithOtomoMessageToOtomoResponse{}
		testErr = errors.New("test error")
	)
	type args struct {
		ctx context.Context
		req *grpcgen.ChatWithOtomoMessageToOtomoRequest
	}
	tests := []struct {
		name      string
		fields    *chatWithOtomoControllerFields
		args      args
		want      *grpcgen.ChatWithOtomoMessageToOtomoResponse
		wantIsErr bool
	}{
		{
			name: strings.Join([]string{
				"should return the reply",
				"when given a valid request",
			}, " "),
			fields: func() *chatWithOtomoControllerFields {
				fields := newChatWithOtomoControllerFields(t)
				fields.useCase.
					EXPECT().
					MessageToOtomo(
						giveCtxWithUseID,
						userID,
						giveText,
					).Return(reply, nil).
					Times(1)
				fields.presenter.
					EXPECT().
					MessageToOtomoOutput(giveCtxWithUseID, reply).
					Return(output, nil).
					Times(1)
				return fields
			}(),
			args: args{
				ctx: giveCtxWithUseID,
				req: &grpcgen.ChatWithOtomoMessageToOtomoRequest{
					Text: giveText,
				},
			},
			want:      output,
			wantIsErr: false,
		},
		{
			name: strings.Join([]string{
				"should return error",
				"when use case return error",
			}, " "),
			fields: func() *chatWithOtomoControllerFields {
				fields := newChatWithOtomoControllerFields(t)
				fields.useCase.
					EXPECT().
					MessageToOtomo(
						giveCtxWithUseID,
						userID,
						giveText,
					).Return(nil, testErr).
					Times(1)
				fields.presenter.
					EXPECT().
					ErrorOutput(giveCtxWithUseID, testErr).
					Return(status.New(codes.Internal, testErr.Error())).
					Times(1)
				return fields
			}(),
			args: args{
				ctx: giveCtxWithUseID,
				req: &grpcgen.ChatWithOtomoMessageToOtomoRequest{Text: giveText},
			},
			want:      nil,
			wantIsErr: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			ctrl := &ChatWithOtomoController{
				useCase:   tt.fields.useCase,
				presenter: tt.fields.presenter,
			}
			got, err := ctrl.MessageToOtomo(tt.args.ctx, tt.args.req)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("ChatWithOtomoController.MessageToOtomo() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}
			assert.Exactly(t, tt.want, got)
		})
	}
}
