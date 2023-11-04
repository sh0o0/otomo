package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
)

var _ svc.OtomoAgentService = (*OtomoAgentService)(nil)

type OtomoAgentService struct {
	convSvc    svc.ConversationService
	summarySvc svc.SummaryService
}

func NewOtomoAgentService(
	convSvc svc.ConversationService,
	summarySvc svc.SummaryService,
) *OtomoAgentService {
	return &OtomoAgentService{
		convSvc:    convSvc,
		summarySvc: summarySvc,
	}
}

func (oas *OtomoAgentService) Respond(
	ctx context.Context,
	otomo *model.Otomo,
	msg *model.Message,
	opts svc.OtomoAgentOptions,
) (*model.Otomo, *model.Message, error) {
	var (
		replyID = model.MessageID(uuid.NewString())
	)

	personality, err := otomo.Profile.TransJustFriendly().Prompt()
	if err != nil {
		return nil, nil, err
	}
	replyRet, err := oas.convSvc.Respond(ctx, msg, svc.ConversationOptions{
		History:     otomo.Memory.Summary,
		Personality: personality,
		// TODO: Add messaging func
		// TODO: Add functions
	})
	if err != nil {
		return nil, nil, err
	}

	var (
		// TODO: Add the procedure to convert function call to struct.
		structName string
		strct      model.Struct
	)

	reply := model.RestoreMessageWithContent(
		replyID,
		replyRet.Content, // TODO:: How about when function call? It might be given json added explanation.
		model.OtomoRole,
		times.C.Now(),
		nil,
		replyRet.Content,
		structName,
		strct,
	)

	newOtomo, err := oas.updateMemory(ctx, otomo, []*model.Message{reply})
	if err != nil {
		return nil, nil, err
	}

	return newOtomo, reply, nil
}

func (oas *OtomoAgentService) Message(
	ctx context.Context,
	otomo *model.Otomo,
	opts svc.OtomoAgentOptions,
) (*model.Otomo, *model.Message, error) {
	panic("not implemented") // TODO: Implement
}

func (oas *OtomoAgentService) updateMemory(
	ctx context.Context,
	crntOtomo *model.Otomo,
	newMsgs []*model.Message,
) (*model.Otomo, error) {
	summary, err := oas.summarySvc.Summarize(
		ctx, newMsgs, crntOtomo.Memory.Summary)
	if err != nil {
		return nil, err
	}

	return model.RestoreOtomo(
		crntOtomo.UserID,
		*model.NewMemory(summary),
		crntOtomo.Profile,
	)
}
