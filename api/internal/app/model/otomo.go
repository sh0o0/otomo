package model

import (
	"context"
	"otomo/internal/pkg/errs"
)

type Summarizer interface {
	Summarize(
		ctx context.Context,
		newMsgs []*Message,
		currentSummary string,
	) (string, error)
}

// TODO: Add tests
type Otomo struct {
	UserID  UserID       `firestore:"user_id"`
	Memory  Memory       `firestore:"memory"`
	Profile OtomoProfile `firestore:"profile"`

	converser     Converser
	summarizer    Summarizer
	messagingFunc MessagingFunc
}

func RestoreOtomo(
	userID UserID,
	memory Memory,
	profile OtomoProfile,
) (*Otomo, error) {
	return &Otomo{
		UserID:  userID,
		Memory:  memory,
		Profile: profile,
	}, nil
}

func (o *Otomo) WithConverser(converser Converser) *Otomo {
	newOtomo := *o
	newOtomo.converser = converser
	return &newOtomo
}

func (o *Otomo) WithSummarizer(summarizer Summarizer) *Otomo {
	newOtomo := *o
	newOtomo.summarizer = summarizer
	return &newOtomo
}

func (o *Otomo) WithMessagingFunc(fn MessagingFunc) *Otomo {
	newOtomo := *o
	newOtomo.messagingFunc = fn
	return &newOtomo
}

func (o *Otomo) Respond(
	ctx context.Context,
	msg *Message,
) (*Otomo, *Message, error) {
	if err := o.validateAbilities(); err != nil {
		return nil, nil, err
	}

	personality, err := o.Profile.TransJustFriendly().Prompt()
	if err != nil {
		return nil, nil, err
	}
	respond, err := o.converser.Respond(ctx, msg, ConversationOptions{
		Memory:        &o.Memory,
		Personality:   personality,
		MessagingFunc: o.messagingFunc,
	})
	if err != nil {
		return nil, nil, err
	}

	summary, err := o.summarizer.Summarize(
		ctx, []*Message{msg, respond}, o.Memory.Summary)
	if err != nil {
		return nil, nil, err
	}

	newOtomo := *o
	newOtomo.Memory.Summary = summary
	return &newOtomo, respond, nil
}

func (o *Otomo) Message(
	ctx context.Context,
) (*Otomo, *Message, error) {
	if err := o.validateAbilities(); err != nil {
		return nil, nil, err
	}

	personality, err := o.Profile.TransJustFriendly().Prompt()
	if err != nil {
		return nil, nil, err
	}

	newMsg, err := o.converser.Message(ctx, ConversationOptions{
		Memory:        &o.Memory,
		Personality:   personality,
		MessagingFunc: o.messagingFunc,
	})
	if err != nil {
		return nil, nil, err
	}

	summary, err := o.summarizer.Summarize(
		ctx, []*Message{newMsg}, o.Memory.Summary)
	if err != nil {
		return nil, nil, err
	}

	newOtomo := *o
	newOtomo.Memory.Summary = summary

	return &newOtomo, newMsg, nil
}

func (o *Otomo) validateAbilities() error {
	if o.converser == nil {
		return &errs.Error{
			Message: "converser is not set",
			Cause:   errs.CauseUnavailable,
			Domain:  errs.DomainOtomo,
			Field:   errs.FieldAbility,
		}
	}
	if o.summarizer == nil {
		return &errs.Error{
			Message: "summarizer is not set",
			Cause:   errs.CauseUnavailable,
			Domain:  errs.DomainOtomo,
			Field:   errs.FieldAbility,
		}

	}
	return nil
}

func (o *Otomo) conversationResultToMessage(
	result *ConversationResult,
) (*Message, error) {
	var (
		text = result.Content
	)

	if result.FunctionCall != nil {
		text = result.FunctionCall.Name
	}

	return &Message{
		ID:      result.MsgID,
		Text:    text,
		Role:    result.Role,
		SentAt:  result.SentAt,
		Content: result.Content,

		ClientID: nil,
	}, nil
}

type Memory struct {
	Summary string `firestore:"summary"`
}
