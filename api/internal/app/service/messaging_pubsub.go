package service

import (
	"context"
	"errors"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"

	evbus "github.com/asaskevich/EventBus"
)

const (
	messagingTopic = "messaging"
)

type messagingHandler struct {
	ctx context.Context
	fn  func(context.Context, *model.MessageChunk)
}

var _ svc.MessagingSubscriber = (*MessagingSubscriber)(nil)

type MessagingSubscriber struct {
	sub      evbus.BusSubscriber
	handlers map[model.UserID]*messagingHandler
}

func NewMessagingSubscriber(
	sub evbus.BusSubscriber,
) (*MessagingSubscriber, error) {
	msginSub := &MessagingSubscriber{
		sub: sub,
	}
	return msginSub, nil
}

func (s *MessagingSubscriber) Init() error {
	return s.sub.SubscribeAsync(messagingTopic, s.handle, false)
}

func (s *MessagingSubscriber) handle(userID model.UserID, msg *model.MessageChunk) {
	handler := s.handlers[userID]
	if handler == nil {
		return
	}
	handler.fn(handler.ctx, msg)
}

func (s *MessagingSubscriber) Close() error {
	return s.sub.Unsubscribe(messagingTopic, s.handle)
}

func (s *MessagingSubscriber) Subscribe(
	ctx context.Context,
	userID model.UserID,
	fn func(context.Context, *model.MessageChunk),
) error {
	s.handlers[userID] = &messagingHandler{
		ctx: ctx,
		fn:  fn,
	}
	return nil
}

func (s *MessagingSubscriber) Unsubscribe(
	ctx context.Context,
	userID model.UserID,
) error {
	if s.handlers[userID] == nil {
		return errors.New("no handler in messaging subscriber")
	}

	delete(s.handlers, userID)
	return nil
}

type MessagingPublisher struct {
	sub evbus.BusPublisher
}

func NewMessagingPublisher(
	pub evbus.BusPublisher,
) *MessagingPublisher {
	msginPub := &MessagingPublisher{
		sub: pub,
	}
	return msginPub
}

func (p *MessagingPublisher) Publish(
	userID model.UserID,
	msg *model.MessageChunk,
) {
	p.sub.Publish(messagingTopic, userID, msg)
}
