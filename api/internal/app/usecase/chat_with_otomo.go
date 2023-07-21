package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/gateway/infra"
	"otomo/internal/app/domain/gateway/repo"
)

type ChatWithOtomoUseCase struct {
	msgMaker infra.MessageMaker
	msgRepo  repo.MessageWithOtomoRepository
}

func NewChatWithOtomoUseCase(
	msgMaker infra.MessageMaker,
	msgRepo repo.MessageWithOtomoRepository,
) *ChatWithOtomoUseCase {
	return &ChatWithOtomoUseCase{
		msgMaker: msgMaker,
		msgRepo:  msgRepo,
	}
}

func (u *ChatWithOtomoUseCase) Reply(
	ctx context.Context,
	msg *message.MessageWithOtomo,
) (*message.MessageWithOtomo, error) {
	reply, err := u.msgMaker.MakeFromMessageWithOtomo(ctx, msg)
	if err != nil {
		return nil, err
	}

	err = u.msgRepo.Add(ctx, reply)
	if err != nil {
		return nil, err
	}

	return reply, nil
}
