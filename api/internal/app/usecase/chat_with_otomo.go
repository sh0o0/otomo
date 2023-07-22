package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/gateway/infra"
	"otomo/internal/app/domain/gateway/repo"
	"otomo/pkg/rollback"
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
	var rollbacker = rollback.NewRollbacker()
	defer rollbacker.RollbackForPanic(ctx)

	if err := u.msgRepo.Add(ctx, msg); err != nil {
		return nil, err
	}
	rollbacker.Add(rollback.NewRollback(
		"Rollback for adding a message to otomo",
		func(c context.Context) error {
			return u.msgRepo.DeleteByID(ctx, msg.ID)
		},
	))

	reply, err := u.msgMaker.MakeFromMessageWithOtomo(ctx, msg)
	if err != nil {
		rollbacker.Rollback(ctx)
		return nil, err
	}

	if err = u.msgRepo.Add(ctx, reply); err != nil {
		rollbacker.Rollback(ctx)
		return nil, err
	}

	return reply, nil
}
