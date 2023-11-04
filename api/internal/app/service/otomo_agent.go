package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
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
	opts svc.ConversationOptions,
) (*model.Otomo, *model.Message, error) {
	panic("not implemented") // TODO: Implement
}

func (oas *OtomoAgentService) Message(
	ctx context.Context,
	otomo *model.Otomo,
	opts svc.ConversationOptions,
) (*model.Otomo, *model.Message, error) {
	panic("not implemented") // TODO: Implement
}
