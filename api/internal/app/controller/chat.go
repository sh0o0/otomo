package controller

import (
	"context"
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/interfaces/repo"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/times"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

// TODO: Add tests
// TODO: Add presenter

var _ grpcgen.ChatServiceServer = (*ChatController)(nil)

type ChatController struct {
	// Deprecated: Don't use this field.
	chatFactory *model.ChatFactory
	// Deprecated: Don't use this field.
	msgFactory *model.MessageFactory
	// Deprecated: Don't use this field.
	chatRepo repo.ChatRepository
	// Deprecated: Don't use this field.
	chatService svc.ChatService
	// Deprecated: Don't use this field.
	summaryService svc.SummaryService

	errorPresenter errorPresenter
	otomoRepo      repo.OtomoRepository
	msgRepo        repo.MessageRepository
	converser      model.Converser
	summarizer     model.Summarizer
}

func NewChatController(
	errorPresenter errorPresenter,
	chatFactory *model.ChatFactory,
	msgFactory *model.MessageFactory,
	chatRepo repo.ChatRepository,
	msgRepo repo.MessageRepository,
	chatService svc.ChatService,
	summaryService svc.SummaryService,

	otomoRepo repo.OtomoRepository,
	converser model.Converser,
	summarizer model.Summarizer,
) *ChatController {
	return &ChatController{
		errorPresenter: errorPresenter,
		chatFactory:    chatFactory,
		msgFactory:     msgFactory,
		chatRepo:       chatRepo,
		msgRepo:        msgRepo,
		chatService:    chatService,
		summaryService: summaryService,

		otomoRepo:  otomoRepo,
		converser:  converser,
		summarizer: summarizer,
	}
}

func (cc *ChatController) AskToMessage(
	context context.Context,
	req *grpcgen.ChatService_AskToMessageRequest,
) (*grpcgen.ChatService_AskToMessageResponse, error) {
	res, err := cc.askToMessage(context, req)
	if err != nil {
		return nil, cc.toGrpcError(context, err)
	}
	return res, nil
}

func (cc *ChatController) askToMessage(
	context context.Context,
	req *grpcgen.ChatService_AskToMessageRequest,
) (*grpcgen.ChatService_AskToMessageResponse, error) {
	if err := req.ValidateAll(); err != nil {
		return nil, err
	}

	var (
		userID = model.UserID(req.GetUserId())
	)

	if !ctxs.AuthRoleIs(context, model.AdminAuthRole) {
		return nil, &errs.Error{
			Message: "Only admin role can access this method",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainAuth,
			Field:   errs.FieldAuthRole,
		}
	}

	lastMsg, err := cc.msgRepo.Last(context, userID)
	if err != nil {
		return nil, err
	}

	otomo, err := cc.otomoRepo.GetByID(context, userID)
	if err != nil {
		return nil, err
	}
	otomo = otomo.WithConverser(cc.converser).WithSummarizer(cc.summarizer)

	var (
		updatedOtomo *model.Otomo
		newMsg       *model.Message
		convErr      error
	)

	if lastMsg.RoleIs(model.UserRole) {
		updatedOtomo, newMsg, convErr = otomo.Respond(context, lastMsg)
	} else {
		updatedOtomo, newMsg, convErr = otomo.Message(context)
	}
	if convErr != nil {
		return nil, convErr
	}

	if err := cc.saveMsgAndOtomo(
		context, userID, newMsg, updatedOtomo); err != nil {
		return nil, err
	}

	resMsg, err := cc.toGrpcMessage(newMsg)
	if err != nil {
		return nil, err
	}

	return &grpcgen.ChatService_AskToMessageResponse{
		Message: resMsg,
	}, nil
}

func (cc *ChatController) ListMessages(
	ctx context.Context,
	req *grpcgen.ChatService_ListMessagesRequest,
) (*grpcgen.ChatService_ListMessagesResponse, error) {
	res, err := cc.listMessages(ctx, req)
	if err != nil {
		return nil, cc.toGrpcError(ctx, err)
	}

	return res, nil
}

func (cc *ChatController) listMessages(
	ctx context.Context,
	req *grpcgen.ChatService_ListMessagesRequest,
) (*grpcgen.ChatService_ListMessagesResponse, error) {
	if err := req.ValidateAll(); err != nil {
		return nil, err
	}

	if !ctxs.UserIs(ctx, model.UserID(req.UserId)) {
		return nil, status.New(codes.PermissionDenied, "can only get own list").Err()
	}

	msgs, err := cc.msgRepo.List(
		ctx,
		model.UserID(req.GetUserId()),
		&repo.MessagePage{
			Size: int(req.GetPageSize()),
			StartAfterMessageID: model.MessageID(
				req.GetPageStartAfterMessageId()),
		})
	if err != nil {
		return nil, err
	}

	resMsgs, err := cc.toGrpcMessages(msgs)
	if err != nil {
		return nil, err
	}

	return &grpcgen.ChatService_ListMessagesResponse{
		PageSize: uint32(len(resMsgs)),
		Messages: resMsgs,
	}, nil
}

// TODO: Implement transaction
// Deprecated: Use AskToMessage instead.
func (cc *ChatController) SendMessage(
	req *grpcgen.ChatService_SendMessageRequest,
	stream grpcgen.ChatService_SendMessageServer,
) error {
	if err := cc.sendMessage(req, stream); err != nil {
		return cc.toGrpcError(stream.Context(), err)
	}
	return nil
}

func (cc *ChatController) sendMessage(
	req *grpcgen.ChatService_SendMessageRequest,
	stream grpcgen.ChatService_SendMessageServer,
) error {
	var ctx = stream.Context()

	if err := req.ValidateAll(); err != nil {
		return err
	}

	userID, err := ctxs.UserIDFromContext(ctx)
	if err != nil {
		return err
	}

	msg, err := cc.msgFactory.New(req.GetText(), model.UserRole)
	if err != nil {
		return err
	}

	if err := cc.msgRepo.Add(ctx, userID, msg); err != nil {
		return err
	}

	chat, err := cc.chatRepo.Get(ctx, userID)
	if err != nil {
		return err
	}

	reply, err := cc.chatService.Send(
		ctx,
		msg,
		chat.Summary,
		func(ctx context.Context, chunk []byte) error {
			return stream.Send(&grpcgen.ChatService_SendMessageStreamResponse{
				Text:   string(chunk),
				SentAt: timestamppb.New(times.C.Now()),
			})
		},
	)
	if err != nil {
		return err
	}

	if err := cc.msgRepo.Add(ctx, userID, reply); err != nil {
		return err
	}

	newSummary, err := cc.summaryService.Summarize(
		ctx, []*model.Message{msg, reply}, chat.Summary)
	if err != nil {
		return err
	}

	return cc.saveChat(ctx, userID, newSummary)
}

func (cc *ChatController) saveChat(
	ctx context.Context,
	userID model.UserID,
	summary string,
) error {
	newMsgChat, err := cc.chatFactory.New(summary)
	if err != nil {
		return err
	}

	return cc.chatRepo.Save(ctx, userID, newMsgChat)
}

func (cc *ChatController) saveMsgAndOtomo(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
	otomo *model.Otomo,
) error {
	// TODO: Impl transaction
	if err := cc.otomoRepo.Save(ctx, otomo); err != nil {
		return err
	}
	return cc.msgRepo.Add(ctx, userID, msg)
}

func (cc *ChatController) toGrpcMessages(
	msgs []*model.Message,
) ([]*grpcgen.Message, error) {
	grpcMsgs := make([]*grpcgen.Message, len(msgs))
	for i, msg := range msgs {
		grpcMsg, err := cc.toGrpcMessage(msg)
		if err != nil {
			return nil, err
		}
		grpcMsgs[i] = grpcMsg
	}
	return grpcMsgs, nil
}

func (cc *ChatController) toGrpcMessage(
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

func (cc *ChatController) toGrpcError(ctx context.Context, err error) error {
	return cc.errorPresenter.ErrorOutput(ctx, err).Err()
}
