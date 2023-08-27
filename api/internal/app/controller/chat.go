package controller

import (
	"context"
	"otomo/internal/app/controller/repo"
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/errs"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/schema"
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
	errorPresenter
	chat       *openai.Chat
	msgFactory *model.MessageFactory
	msgRepo    repo.MessageRepository
}

func NewChatController(
	chat *openai.Chat,
	msgFactory *model.MessageFactory,
	msgRepo repo.MessageRepository,
) *ChatController {
	return &ChatController{
		chat:       chat,
		msgFactory: msgFactory,
		msgRepo:    msgRepo,
	}
}

func (c *ChatController) SendMessage(
	req *grpcgen.ChatService_SendMessageRequest,
	stream grpcgen.ChatService_SendMessageServer,
) error {
	// STEP: Add a message to the repo
	// STEP: make a reply
	// STEP: response
	// STEP: Add a message to the repo
	userID, err := ctxs.UserIDFromContext(stream.Context())
	if err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	msg, err := c.msgFactory.NewMessage(
		req.GetText(),
		model.UserRole,
	)
	if err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	if err := c.msgRepo.Add(
		stream.Context(), model.UserID(userID), msg); err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	completion, err := c.chat.Call(stream.Context(), []schema.ChatMessage{
		schema.HumanChatMessage{Content: msg.Text},
	}, llms.WithStreamingFunc(func(ctx context.Context, chunk []byte) error {
		stream.Send(&grpcgen.ChatService_SendMessageStreamResponse{
			Text:   string(chunk),
			SentAt: timestamppb.Now(),
		})
		return nil
	}))
	if err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	reply, err := c.msgFactory.NewMessage(
		completion.Content,
		model.OtomoRole,
	)
	if err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}
	if err := c.msgRepo.Add(
		stream.Context(), model.UserID(userID), reply); err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	return nil
}

func (c *ChatController) ListMessages(
	ctx context.Context,
	req *grpcgen.ChatService_ListMessagesRequest,
) (*grpcgen.ChatService_ListMessagesResponse, error) {
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
		return nil, c.ErrorOutput(ctx, err).Err()
	}

	resMsgs, err := c.toGrpcMessages(msgs)
	if err != nil {
		return nil, c.ErrorOutput(ctx, err).Err()
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
			Domain: errs.DomainMessageWithOtomo,
			Cause:  errs.CauseNotExist,
			Field:  errs.FieldRole,
		}
	}
	return
}
