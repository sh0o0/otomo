package model

import (
	"context"
	"otomo/internal/pkg/errs"
)

type Converser interface {
	Respond(
		ctx context.Context,
		msg *Message,
		memory *Memory,
		listeningFunc func(ctx context.Context, chunk []byte) error,
	) (*Message, error)
	Message(
		ctx context.Context,
		memory *Memory,
		listeningFunc func(ctx context.Context, chunk []byte) error,
	) (*Message, error)
}
type Summarizer interface {
	Summarize(
		ctx context.Context,
		newMsgs []*Message,
		currentSummary string,
	) (string, error)
}

type Otomo struct {
	UserID UserID `firestore:"user_id"`
	Memory Memory `firestore:"memory"`

	converser  Converser
	summarizer Summarizer
}

func RestoreOtomo(
	userID UserID,
	memory Memory,
	converser Converser,
	summarizer Summarizer,
) (*Otomo, error) {
	if converser == nil {
		return nil, &errs.Error{
			Message: "converser cannot be nil",
			Cause:   errs.CauseInvalidArg,
			Domain:  errs.DomainOtomo,
		}
	}
	if summarizer == nil {
		return nil, &errs.Error{
			Message: "summarizer cannot be nil",
			Cause:   errs.CauseInvalidArg,
			Domain:  errs.DomainOtomo,
		}
	}

	return &Otomo{
		UserID:     userID,
		Memory:     memory,
		converser:  converser,
		summarizer: summarizer,
	}, nil
}

func (o *Otomo) Respond(
	ctx context.Context,
	msg *Message,
) (*Otomo, *Message, error) {
	// TODO: listeningFunc
	respond, err := o.converser.Respond(ctx, msg, &o.Memory, nil)
	if err != nil {
		return nil, nil, err
	}

	summary, err := o.summarizer.Summarize(
		ctx, []*Message{msg, respond}, o.Memory.Summary)
	if err != nil {
		return nil, nil, err
	}

	return &Otomo{
		UserID: o.UserID,
		Memory: Memory{
			Summary: summary,
		},
		converser:  o.converser,
		summarizer: o.summarizer,
	}, respond, nil
}

func (o *Otomo) Message(
	ctx context.Context,
) (*Otomo, *Message, error) {
	// TODO: listeningFunc
	newMsg, err := o.converser.Message(ctx, &o.Memory, nil)
	if err != nil {
		return nil, nil, err
	}

	summary, err := o.summarizer.Summarize(
		ctx, []*Message{newMsg}, o.Memory.Summary)
	if err != nil {
		return nil, nil, err
	}

	return &Otomo{
		UserID: o.UserID,
		Memory: Memory{
			Summary: summary,
		},
		converser:  o.converser,
		summarizer: o.summarizer,
	}, newMsg, nil
}
