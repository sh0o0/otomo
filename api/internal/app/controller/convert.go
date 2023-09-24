package controller

import (
	"otomo/internal/app/grpcgen"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"

	"google.golang.org/protobuf/types/known/timestamppb"
	"google.golang.org/protobuf/types/known/wrapperspb"
)

var conv = &convert{}

type convert struct {
	Message      convertMessage
	MessageChunk convertMessageChunk
	Wrapper      convertWrapper
}

type convertMessage struct {
	Role             convertRole
	Wrapper          convertWrapper
	locationAnalysis convertLocationAnalysis
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
		Id:               string(msg.ID),
		Text:             msg.Text,
		Role:             role,
		SentAt:           timestamppb.New(msg.SentAt),
		ClientId:         cm.Wrapper.StringPtrToStringValue(msg.ClientID),
		LocationAnalysis: cm.locationAnalysis.ModelToGrpc(&msg.LocationAnalysis),
	}, nil
}

type convertLocationAnalysis struct {
	analyzedLocation convertAnalyzedLocation
}

func (cla convertLocationAnalysis) ModelToGrpc(
	la *model.LocationAnalysis,
) *grpcgen.LocationAnalysis {
	var analyzedAt *timestamppb.Timestamp
	if la.AnalyzedAt != nil {
		analyzedAt = timestamppb.New(*la.AnalyzedAt)
	}
	return &grpcgen.LocationAnalysis{
		Locations:  cla.analyzedLocation.ModelToGrpcList(la.Locations),
		AnalyzedAt: analyzedAt,
	}
}

type convertAnalyzedLocation struct {
	location convertLocation
}

func (ca convertAnalyzedLocation) ModelToGrpc(
	al *model.AnalyzedLocation,
) *grpcgen.AnalyzedLocation {
	return &grpcgen.AnalyzedLocation{
		Text:     al.Text,
		Location: ca.location.ModelToGrpc(al.Location),
	}
}

func (ca convertAnalyzedLocation) ModelToGrpcList(
	als []*model.AnalyzedLocation,
) []*grpcgen.AnalyzedLocation {
	grpcAls := make([]*grpcgen.AnalyzedLocation, len(als))
	for i, al := range als {
		grpcAls[i] = ca.ModelToGrpc(al)
	}
	return grpcAls
}

type convertLocation struct {
	geometry convertGeometry
}

func (cl convertLocation) ModelToGrpc(
	location model.Location,
) *grpcgen.Location {
	return &grpcgen.Location{
		GooglePlaceId: location.GooglePlaceID,
		LongName:      location.LongName,
		ShortName:     location.ShortName,
		Address:       location.Address,
		Types:         location.Types,
		Geometry:      cl.geometry.ModelToGrpc(location.Geometry),
	}
}

type convertGeometry struct {
	latLng convertLatLng
}

func (cg convertGeometry) ModelToGrpc(
	geometry model.Geometry,
) *grpcgen.Geometry {
	return &grpcgen.Geometry{
		LatLng: cg.latLng.ModelToGrpc(geometry.LatLng),
	}
}

type convertLatLng struct{}

func (convertLatLng) ModelToGrpc(
	latLng model.LatLng,
) *grpcgen.LatLng {
	return &grpcgen.LatLng{
		Latitude:  latLng.Lat,
		Longitude: latLng.Lng,
	}
}

type convertMessageChunk struct{}

func (convertMessageChunk) ModelToGrpc(
	chunk *model.MessageChunk,
) (*grpcgen.MessageChunk, error) {
	role, err := conv.Message.Role.ModelToGrpc(chunk.Role)
	if err != nil {
		return nil, err
	}

	return &grpcgen.MessageChunk{
		MessageId: string(chunk.MessageID),
		Text:      chunk.Text,
		Role:      role,
		SentAt:    timestamppb.New(chunk.SentAt),
		ClientId:  conv.Message.Wrapper.StringPtrToStringValue(chunk.ClientID),
		IsLast:    chunk.IsLast,
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

type convertWrapper struct{}

func (convertWrapper) StringValueToPtr(
	strVal *wrapperspb.StringValue,
) *string {
	if strVal == nil {
		return nil
	}
	return &strVal.Value
}

func (convertWrapper) StringPtrToStringValue(
	strPtr *string,
) *wrapperspb.StringValue {
	if strPtr == nil {
		return nil
	}
	return &wrapperspb.StringValue{Value: *strPtr}
}
