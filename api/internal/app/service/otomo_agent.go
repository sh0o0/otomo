package service

import (
	"context"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
)

var _ svc.OtomoAgentService = (*OtomoAgentService)(nil)

type OtomoAgentService struct {
}

func NewOtomoAgentService() *OtomoAgentService {
	return &OtomoAgentService{}
}

func (oas *OtomoAgentService) Respond(
	ctx context.Context,
	otomo *model.Otomo,
	msg *model.Message,
) (*model.Otomo, *model.Message, error) {
	panic("not implemented") // TODO: Implement
}

func (oas *OtomoAgentService) Message(
	ctx context.Context,
	otomo *model.Otomo,
) (*model.Otomo, *model.Message, error) {
	panic("not implemented") // TODO: Implement
}
