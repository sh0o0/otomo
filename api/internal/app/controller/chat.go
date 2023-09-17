package controller

import (
	"context"
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/interfaces/repo"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/logs"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/testutil"
	"time"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
)

// TODO: Add tests
// TODO: Add presenter

var _ grpcgen.ChatServiceServer = (*ChatController)(nil)

type ChatController struct {
	errorPresenter errorPresenter
	msgFactory     *model.MessageFactory
	msgRepo        repo.MessageRepository
	otomoRepo      repo.OtomoRepository
	msginSub       svc.MessagingSubscriber
	msginPub       svc.MessagingPublisher
	converser      model.Converser
	summarizer     model.Summarizer
}

func NewChatController(
	errorPresenter errorPresenter,
	msgFactory *model.MessageFactory,
	msgRepo repo.MessageRepository,
	otomoRepo repo.OtomoRepository,
	msginSub svc.MessagingSubscriber,
	msginPub svc.MessagingPublisher,
	converser model.Converser,
	summarizer model.Summarizer,
) *ChatController {
	return &ChatController{
		errorPresenter: errorPresenter,
		msgFactory:     msgFactory,
		msgRepo:        msgRepo,
		otomoRepo:      otomoRepo,
		msginSub:       msginSub,
		msginPub:       msginPub,
		converser:      converser,
		summarizer:     summarizer,
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

	otomo, err := cc.otomoRepo.GetByID(context, userID)
	if err != nil {
		if errs.IsNotFoundErr(err) {
			otomo, err = model.RestoreOtomo(userID, model.Memory{})
			if err != nil {
				return nil, err
			}
		} else {
			return nil, err
		}
	}
	otomo = otomo.WithConverser(cc.converser).WithSummarizer(cc.summarizer)

	var (
		updatedOtomo *model.Otomo
		newMsg       *model.Message
		convErr      error
	)

	lastMsg, err := cc.msgRepo.Last(context, userID)
	if err != nil {
		if !errs.IsNotFoundErr(err) {
			return nil, err
		}
	}
	if lastMsg != nil && lastMsg.RoleIs(model.UserRole) {
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

	resMsg, err := conv.Message.ModelToGrpc(newMsg)
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

	resMsgs, err := conv.Message.ModelToGrpcList(msgs)
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
	ctx context.Context,
	req *grpcgen.ChatService_SendMessageRequest,
) (*grpcgen.ChatService_SendMessageResponse, error) {
	resp, err := cc.sendMessage(ctx, req)
	if err != nil {
		return nil, cc.toGrpcError(ctx, err)
	}
	return resp, nil
}

func (cc *ChatController) sendMessage(
	ctx context.Context,
	req *grpcgen.ChatService_SendMessageRequest,
) (*grpcgen.ChatService_SendMessageResponse, error) {
	if err := req.ValidateAll(); err != nil {
		return nil, err
	}
	var (
		userID = model.UserID(req.GetUserId())
	)

	if !ctxs.UserIs(ctx, userID) {
		return nil, &errs.Error{
			Message: "can only send own message",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainMessage,
			Field:   errs.FieldNone,
		}
	}

	msg, err := cc.msgFactory.New(
		req.GetText(),
		model.UserRole,
		conv.Wrapper.StringValueToPtr(req.ClientId),
	)
	if err != nil {
		return nil, err
	}

	grpcMsg, err := conv.Message.ModelToGrpc(msg)
	if err != nil {
		return nil, err
	}

	if err := cc.msgRepo.Add(ctx, userID, msg); err != nil {
		return nil, err
	}

	return &grpcgen.ChatService_SendMessageResponse{
		Message: grpcMsg,
	}, nil
}

func (cc *ChatController) saveMsgAndOtomo(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
	otomo *model.Otomo,
) error {
	if err := cc.msgRepo.Add(ctx, userID, msg); err != nil {
		return err
	}
	if err := cc.otomoRepo.Save(ctx, otomo); err != nil {
		if err := cc.msgRepo.DeleteByIDAndUserID(
			ctx, userID, msg.ID); err != nil {

			return &errs.Error{
				Message: "Failed rollback. ERROR: " + err.Error(),
				Cause:   errs.CauseInternal,
				Domain:  errs.DomainMessage,
				Field:   errs.FieldNone,
			}
		}
		return err
	}
	return nil
}

func (cc *ChatController) toGrpcError(ctx context.Context, err error) error {
	return cc.errorPresenter.ErrorOutput(ctx, err).Err()
}

func (cc *ChatController) MessagingStream(
	req *grpcgen.ChatService_MessagingStreamRequest,
	stream grpcgen.ChatService_MessagingStreamServer,
) error {
	msgID := model.MessageID(uuid.NewString())

	for i := 0; i < 3600; i++ {
		if err := stream.Send(&grpcgen.ChatService_MessagingStreamResponse{
			Chunk: &grpcgen.MessageChunk{
				MessageId: string(msgID),
				Text:      testutil.Faker.Lorem().Word(),
				Role:      grpcgen.Role_OTOMO,
				SentAt:    timestamppb.New(times.C.Now()),
				ClientId:  nil,
				IsLast:    false,
			},
		}); err != nil {
			logs.Logger.Warn(err.Error())
			return err
		}

		times.C.Sleep(time.Second)
	}

	return nil
}

func (cc *ChatController) messagingStream(
	req *grpcgen.ChatService_MessagingStreamRequest,
	stream grpcgen.ChatService_MessagingStreamServer,
) error {
	msgID := model.MessageID(uuid.NewString())

	for i := 0; i < 3600; i++ {
		if err := stream.Send(&grpcgen.ChatService_MessagingStreamResponse{
			Chunk: &grpcgen.MessageChunk{
				MessageId: string(msgID),
				Text:      testutil.Faker.Lorem().Word(),
				Role:      grpcgen.Role_OTOMO,
				SentAt:    timestamppb.New(times.C.Now()),
				ClientId:  nil,
				IsLast:    false,
			},
		}); err != nil {
			logs.Logger.Warn(err.Error())
			return err
		}

		times.C.Sleep(time.Second)
	}

	return nil
}
