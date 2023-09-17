package svc

import "otomo/internal/app/model"

type MessagingSubscriber interface {
	Subscribe(func(*model.MessageChunk)) error
	Unsubscribe() error
}

type MessagingPublisher interface {
	Publish(*model.MessageChunk)
}
