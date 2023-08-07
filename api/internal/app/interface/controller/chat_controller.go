package controller

import (
	"context"
	"otomo/internal/app/domain/model"
	"otomo/internal/app/domain/repo"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
	"otomo/pkg/ctxs"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/schema"
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
		userID,
		req.Text,
		model.UserRole,
		model.OtomoRole,
	)
	if err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	if err := c.msgRepo.Add(stream.Context(), msg); err != nil {
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
		userID,
		completion.Content,
		model.OtomoRole,
		model.UserRole,
	)
	if err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}
	if err := c.msgRepo.Add(stream.Context(), reply); err != nil {
		return c.ErrorOutput(stream.Context(), err).Err()
	}

	return nil
}
