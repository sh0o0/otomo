package controller

import (
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"google.golang.org/protobuf/types/known/timestamppb"
)

var conv = &convert{}

type convert struct {
	Message convertMessage
}

type convertMessage struct {
	Role convertRole
}

func (cm convertMessage) ModelToGrpcList(
	msgs []*model.Message,
) ([]*grpcgen.Message, error) {
	grpcMsgs := make([]*grpcgen.Message, len(msgs))
	for i, msg := range msgs {
		grpcMsg, err := cm.ModelToGrpc(msg)
		if err != nil {
			return nil, err
		}
		grpcMsgs[i] = grpcMsg
	}
	return grpcMsgs, nil

}

func (cm convertMessage) ModelToGrpc(msg *model.Message) (*grpcgen.Message, error) {
	role, err := cm.Role.ModelToGrpc(msg.Role)
	if err != nil {
		return nil, err
	}

	return &grpcgen.Message{
		Id:     string(msg.ID),
		Text:   msg.Text,
		Role:   role,
		SentAt: timestamppb.New(msg.SentAt),
	}, nil
}

type convertRole struct{}

func (convertRole) ModelToGrpc(r model.Role) (grpcgen.Role, error) {
	switch r {
	case model.UserRole:
		return grpcgen.Role_USER, nil
	case model.OtomoRole:
		return grpcgen.Role_OTOMO, nil
	default:
		return grpcgen.Role_UNKNOWN, &errs.Error{
			Domain: errs.DomainMessage,
			Cause:  errs.CauseNotExist,
			Field:  errs.FieldRole,
		}
	}
}
