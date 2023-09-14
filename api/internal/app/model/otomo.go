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
	) (*Message, error)
	Message(
		ctx context.Context,
		memory *Memory,
	) (*Message, error)
}
type Summarizer interface {
	Summary(
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

func (o *Otomo) Respond(ctx context.Context, msg *Message) (*Message, error) {
	return o.converser.Respond(ctx, msg, &o.Memory)
}

func (o *Otomo) Message(ctx context.Context, userID UserID) (*Message, error) {
	return o.converser.Message(ctx, &o.Memory)
}
