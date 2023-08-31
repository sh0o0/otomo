package controller

import (
	"context"
	"otomo/internal/app/controller/repo"
	"otomo/internal/app/controller/svc"
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/errs"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

// TODO: Add tests
// TODO: Add presenter

var _ grpcgen.ChatServiceServer = (*ChatController)(nil)

var (
	ErrDomainMessage = "message"
)

type ChatController struct {
	errorPresenter errorPresenter
	chatFactory    *model.ChatFactory
	msgFactory     *model.MessageFactory
	chatRepo       repo.ChatRepository
	msgRepo        repo.MessageRepository
	chatService    svc.ChatService
	summaryService svc.SummaryService
}

func NewChatController(
	errorPresenter errorPresenter,
	chatFactory *model.ChatFactory,
	msgFactory *model.MessageFactory,
	chatRepo repo.ChatRepository,
	msgRepo repo.MessageRepository,
	chatService svc.ChatService,
	summaryService svc.SummaryService,
) *ChatController {
	return &ChatController{
		errorPresenter: errorPresenter,
		chatFactory:    chatFactory,
		msgFactory:     msgFactory,
		chatRepo:       chatRepo,
		msgRepo:        msgRepo,
		chatService:    chatService,
		summaryService: summaryService,
	}
}

func (c *ChatController) SendMessage(
	req *grpcgen.ChatService_SendMessageRequest,
	stream grpcgen.ChatService_SendMessageServer,
) error {
	panic("not implemented")
}

func (c *ChatController) ListMessages(
	ctx context.Context,
	req *grpcgen.ChatService_ListMessagesRequest,
) (*grpcgen.ChatService_ListMessagesResponse, error) {
	if err := req.ValidateAll(); err != nil {
		return nil, c.errorPresenter.ErrorOutput(ctx, err).Err()
	}

	if !ctxs.UserIs(ctx, req.UserId) {
		return nil, status.New(codes.PermissionDenied, "can only get own list").Err()
	}

	msgs, err := c.msgRepo.List(
		ctx,
		model.UserID(req.GetUserId()),
		&repo.MessagePage{
			Size: int(req.GetPageSize()),
			StartAfterMessageID: model.MessageID(
				req.GetPageStartAfterMessageId()),
		})
	if err != nil {
		return nil, c.errorPresenter.ErrorOutput(ctx, err).Err()
	}

	resMsgs, err := c.toGrpcMessages(msgs)
	if err != nil {
		return nil, c.errorPresenter.ErrorOutput(ctx, err).Err()
	}

	return &grpcgen.ChatService_ListMessagesResponse{
		PageSize: uint32(len(resMsgs)),
		Messages: resMsgs,
	}, nil
}

func (c *ChatController) toGrpcMessages(
	msgs []*model.Message,
) ([]*grpcgen.Message, error) {
	grpcMsgs := make([]*grpcgen.Message, len(msgs))
	for i, msg := range msgs {
		grpcMsg, err := c.toGrpcMessage(msg)
		if err != nil {
			return nil, err
		}
		grpcMsgs[i] = grpcMsg
	}
	return grpcMsgs, nil
}

func (c *ChatController) toGrpcMessage(
	msg *model.Message,
) (*grpcgen.Message, error) {
	role, err := toGrpcRole(msg.Role)
	if err != nil {
		return nil, err
	}

	return &grpcgen.Message{
		Id:     string(msg.ID),
		Text:   msg.Text,
		Role:   role,
		SentAt: timestamppb.New(msg.SentAt),
	}, nil
}

func toGrpcRole(r model.Role) (role grpcgen.Role, err error) {
	switch r {
	case model.UserRole:
		role = grpcgen.Role_USER
	case model.OtomoRole:
		role = grpcgen.Role_OTOMO
	default:
		err = &errs.Error{
			Domain: errs.DomainMessage,
			Cause:  errs.CauseNotExist,
			Field:  errs.FieldRole,
		}
	}
	return
}
