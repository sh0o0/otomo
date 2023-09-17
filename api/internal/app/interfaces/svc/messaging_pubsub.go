package svc

import (
	"context"
	"otomo/internal/app/model"
)

type MessagingSubscriber interface {
	Subscribe(
		context.Context,
		model.UserID,
		func(context.Context, *model.MessageChunk),
	) error
	Unsubscribe(context.Context, model.UserID) error
}

type MessagingPublisher interface {
	Publish(model.UserID, *model.MessageChunk)
}
