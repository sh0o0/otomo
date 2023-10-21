package controller

import (
	"context"
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/interfaces/cq"
	"otomo/internal/app/interfaces/repo"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/ctxs"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/logs"
	"otomo/internal/pkg/times"
)

// TODO: Add tests
// TODO: Add presenter

var _ grpcgen.ChatServiceServer = (*ChatController)(nil)

type ChatController struct {
	errorPresenter    errorPresenter
	msgFactory        *model.MessageFactory
	msgRepo           repo.MessageRepository
	otomoRepo         repo.OtomoRepository
	msginSub          svc.MessagingSubscriber
	msginPub          svc.MessagingPublisher
	msgAnaSvc         svc.MessageAnalysisService
	msgSentCountQuery cq.MessageSentCountQuery
	converser         model.Converser
	summarizer        model.Summarizer
}

func NewChatController(
	errorPresenter errorPresenter,
	msgFactory *model.MessageFactory,
	msgRepo repo.MessageRepository,
	otomoRepo repo.OtomoRepository,
	msginSub svc.MessagingSubscriber,
	msginPub svc.MessagingPublisher,
	msgAnaSvc svc.MessageAnalysisService,
	msgSentCountQuery cq.MessageSentCountQuery,
	converser model.Converser,
	summarizer model.Summarizer,
) *ChatController {
	return &ChatController{
		errorPresenter:    errorPresenter,
		msgFactory:        msgFactory,
		msgRepo:           msgRepo,
		otomoRepo:         otomoRepo,
		msginSub:          msginSub,
		msginPub:          msginPub,
		msgAnaSvc:         msgAnaSvc,
		msgSentCountQuery: msgSentCountQuery,
		converser:         converser,
		summarizer:        summarizer,
	}
}

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
		userID           = model.UserID(req.GetUserId())
		now              = times.C.Now()
		currentYearMonth = model.NewYearMonthFromTime(now)
		day              = model.Day(now.Day())
	)

	if !ctxs.UserIs(ctx, userID) {
		return nil, &errs.Error{
			Message: "can only send own message",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainUser,
			Field:   errs.FieldNone,
		}
	}

	monthlySurplusCount, err := cc.msgSentCountQuery.
		GetMonthlySurplusMessageSentCount(ctx, userID, currentYearMonth)
	if err != nil {
		return nil, err
	}
	if !monthlySurplusCount.IsRemainingDay(day) {
		return nil, &errs.Error{
			Message: "no remaining message sent count",
			Cause:   errs.CauseResourceExhausted,
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

	newMonthlySurplusCount := monthlySurplusCount.IfSent(day)
	newDailyCount := newMonthlySurplusCount.Daily.WhereByDay(day)

	grpcMsg, err := conv.Message.ModelToGrpc(msg)
	if err != nil {
		return nil, err
	}

	// This is last logic because it is not rollbackable.
	if err := cc.msgRepo.Add(ctx, userID, msg); err != nil {
		return nil, err
	}

	return &grpcgen.ChatService_SendMessageResponse{
		Message: grpcMsg,
		RemainingSendCount: conv.RemainingMessageSendCount.ModelToGrpc(
			newMonthlySurplusCount,
			newDailyCount,
		),
		SentCount: conv.MessageSentCount.ModelToGrpc(
			newMonthlySurplusCount,
			newDailyCount,
		),
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

func (cc *ChatController) AskToMessage(
	ctx context.Context,
	req *grpcgen.ChatService_AskToMessageRequest,
) (*grpcgen.ChatService_AskToMessageResponse, error) {
	res, err := cc.askToMessage(ctx, req)
	if err != nil {
		return nil, cc.toGrpcError(ctx, err)
	}
	return res, nil
}

func (cc *ChatController) askToMessage(
	ctx context.Context,
	req *grpcgen.ChatService_AskToMessageRequest,
) (*grpcgen.ChatService_AskToMessageResponse, error) {
	if err := req.ValidateAll(); err != nil {
		return nil, err
	}

	var (
		userID = model.UserID(req.GetUserId())
	)

	// TODO: Now if user is not exist, it can be requested.
	if !ctxs.AuthRoleIs(ctx, model.AdminAuthRole) {
		return nil, &errs.Error{
			Message: "Only admin role can access this method",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainAuth,
			Field:   errs.FieldAuthRole,
		}
	}

	otomo, err := cc.otomoRepo.GetByUserID(ctx, userID)
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
	otomo = otomo.
		WithConverser(cc.converser).
		WithSummarizer(cc.summarizer).
		WithMessagingFunc(func(ctx context.Context, msg *model.MessageChunk) error {
			cc.msginPub.Publish(userID, msg)
			return nil
		})

	var (
		updatedOtomo *model.Otomo
		newMsg       *model.Message
		cnvErr       error
	)

	lastMsg, err := cc.msgRepo.Last(ctx, userID)
	if err != nil {
		if !errs.IsNotFoundErr(err) {
			return nil, err
		}
	}
	if lastMsg != nil && lastMsg.RoleIs(model.UserRole) {
		updatedOtomo, newMsg, cnvErr = otomo.Respond(ctx, lastMsg)
	} else {
		updatedOtomo, newMsg, cnvErr = otomo.Message(ctx)
	}
	if cnvErr != nil {
		return nil, cnvErr
	}

	if err := cc.saveMsgAndOtomo(
		ctx, userID, newMsg, updatedOtomo); err != nil {
		return nil, err
	}
	go cc.analyzeAndUpdateMsg(context.Background(), userID, newMsg)

	resMsg, err := conv.Message.ModelToGrpc(newMsg)
	if err != nil {
		return nil, err
	}

	return &grpcgen.ChatService_AskToMessageResponse{
		Message: resMsg,
	}, nil
}

// TODO: Move to AnalyzeController by messaging
func (cc *ChatController) analyzeAndUpdateMsg(
	ctx context.Context,
	userID model.UserID,
	msg *model.Message,
) {
	places, err := cc.msgAnaSvc.ExtractPlacesFromMsg(ctx, msg)
	var errStr *string
	if err != nil {
		str := err.Error()
		errStr = &str
	}
	for _, place := range places {
		if place.GeocodedError != nil {
			logs.Logger.Warn(
				"Failed to geocode",
				logs.String("error", *place.GeocodedError),
			)
		}
	}

	now := times.C.Now()
	pe := model.NewPlaceExtraction(places, &now, errStr)
	newMsg := msg.SetPlaceExtraction(*pe)
	if err := cc.msgRepo.Update(ctx, userID, newMsg); err != nil {
		logs.Logger.Error(
			"Failed to update message",
			logs.Error(err),
			logs.String("messageId", string(newMsg.ID)),
		)
	} else {
		logs.Logger.Info(
			"Updated message",
			logs.String("messageId", string(newMsg.ID)),
		)
	}
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

	var (
		userID = model.UserID(req.GetUserId())
	)

	if !ctxs.UserIs(ctx, userID) {
		return nil, &errs.Error{
			Message: "can only list own message",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainMessage,
			Field:   errs.FieldNone,
		}
	}

	msgs, hasMore, err := cc.msgRepo.List(
		ctx,
		userID,
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
		HasMore:  hasMore,
		Messages: resMsgs,
	}, nil
}

func (cc *ChatController) toGrpcError(ctx context.Context, err error) error {
	return cc.errorPresenter.ErrorOutput(ctx, err).Err()
}

func (cc *ChatController) MessagingStream(
	req *grpcgen.ChatService_MessagingStreamRequest,
	stream grpcgen.ChatService_MessagingStreamServer,
) error {
	if err := cc.messagingStream(req, stream); err != nil {
		return cc.toGrpcError(stream.Context(), err)
	}
	return nil
}

func (cc *ChatController) messagingStream(
	req *grpcgen.ChatService_MessagingStreamRequest,
	stream grpcgen.ChatService_MessagingStreamServer,
) error {
	var (
		ctx    = stream.Context()
		userID = model.UserID(req.GetUserId())
	)

	if !ctxs.UserIs(ctx, userID) {
		return &errs.Error{
			Message: "can only subscribe own message",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainUser,
			Field:   errs.FieldNone,
		}
	}

	if err := cc.msginSub.Subscribe(
		ctx, userID, func(ctx context.Context, msg *model.MessageChunk) {
			err := func() error {
				chunk, err := conv.MessageChunk.ModelToGrpc(msg)
				if err != nil {
					return err
				}
				return stream.Send(&grpcgen.ChatService_MessagingStreamResponse{
					Chunk: chunk,
				})
			}()
			if err != nil {
				if err := stream.SendMsg(cc.toGrpcError(ctx, err)); err != nil {
					logs.Logger.Error(
						"Failed to send error message",
						logs.Error(err),
					)
				}
			}
		},
	); err != nil {
		return err
	}
	logs.Logger.Info(
		"started subscribing messaging stream",
		logs.String("userId", string(userID)),
	)

	<-ctx.Done()
	if err := ctx.Err(); err != nil {
		if err != context.Canceled {
			return err
		}
	}

	if err := cc.msginSub.Unsubscribe(ctx, userID); err != nil {
		return err
	}

	logs.Logger.Info(
		"unsubscribed messaging stream",
		logs.String("userId", string(userID)),
	)

	return nil
}

func (cc *ChatController) GetRemainingSendCount(
	ctx context.Context,
	req *grpcgen.ChatService_GetRemainingSendCountRequest,
) (*grpcgen.ChatService_GetRemainingSendCountResponse, error) {
	resp, err := cc.getRemainingSendCount(ctx, req)
	if err != nil {
		return nil, cc.toGrpcError(ctx, err)
	}
	return resp, nil
}

func (cc *ChatController) getRemainingSendCount(
	ctx context.Context,
	req *grpcgen.ChatService_GetRemainingSendCountRequest,
) (*grpcgen.ChatService_GetRemainingSendCountResponse, error) {
	var (
		userID           = model.UserID(req.GetUserId())
		now              = times.C.Now()
		currentYearMonth = model.NewYearMonthFromTime(now)
		day              = model.Day(now.Day())
	)

	if !ctxs.UserIs(ctx, userID) {
		return nil, &errs.Error{
			Message: "can only get own remaining send count",
			Cause:   errs.CausePermissionDenied,
			Domain:  errs.DomainUser,
			Field:   errs.FieldNone,
		}
	}

	monthlySurplusCount, err := cc.msgSentCountQuery.
		GetMonthlySurplusMessageSentCount(ctx, userID, currentYearMonth)
	if err != nil {
		return nil, err
	}
	dailyCount := monthlySurplusCount.Daily.WhereByDay(day)

	return &grpcgen.ChatService_GetRemainingSendCountResponse{
		RemainingSendCount: conv.RemainingMessageSendCount.ModelToGrpc(
			monthlySurplusCount,
			dailyCount,
		),
		SentCount: conv.MessageSentCount.ModelToGrpc(
			monthlySurplusCount,
			dailyCount,
		),
	}, nil

}
