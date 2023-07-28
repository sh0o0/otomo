package usecase

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/domain/gateway/infra"
	"otomo/internal/app/domain/gateway/repo"
	"otomo/internal/app/usecase/ucboundary"
)

var _ ucboundary.ChatWithOtomoUseCase = (*ChatWithOtomoUseCase)(nil)

type ChatWithOtomoUseCase struct {
	msgMaker  infra.OtomoBot
	msgRepo   repo.MessageWithOtomoRepository
	rbFactory ucboundary.RollbackerFactory
}

func NewChatWithOtomoUseCase(
	msgMaker infra.OtomoBot,
	msgRepo repo.MessageWithOtomoRepository,
	rbFactory ucboundary.RollbackerFactory,
) *ChatWithOtomoUseCase {
	return &ChatWithOtomoUseCase{
		msgMaker:  msgMaker,
		msgRepo:   msgRepo,
		rbFactory: rbFactory,
	}
}

func (u *ChatWithOtomoUseCase) MessageToOtomo(
	ctx context.Context,
	userID user.ID,
	text string,
) (*message.MessageWithOtomo, error) {
	var rollbacker = u.rbFactory.New()
	defer rollbacker.RollbackForPanic(ctx)

	msg := message.NewMessageWithOtomo(
		userID,
		message.UserRole,
		message.OtomoRole,
		text,
	)

	if err := u.msgRepo.Add(ctx, msg); err != nil {
		return nil, err
	}
	rollbacker.Add(
		ctx,
		"Rollback for adding a message to otomo",
		func(c context.Context) error {
			return u.msgRepo.DeleteByIDAndUserID(ctx, msg.ID(), msg.UserID())
		},
	)

	reply, err := u.msgMaker.SendMessage(ctx, msg)
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
