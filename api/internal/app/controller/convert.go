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
	Message                   convertMessage
	MessageChunk              convertMessageChunk
	Wrapper                   convertWrapper
	MessageSentCount          convertMessageSentCount
	RemainingMessageSendCount convertRemainingMessageSendCount
}

type convertMessage struct {
	Role            convertRole
	Wrapper         convertWrapper
	placeExtraction convertPlaceExtraction
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
		Id:              string(msg.ID),
		Text:            msg.Text,
		Role:            role,
		SentAt:          timestamppb.New(msg.SentAt),
		ClientId:        cm.Wrapper.StringPtrToStringValue(msg.ClientID),
		PlaceExtraction: cm.placeExtraction.ModelToGrpc(&msg.PlaceExtraction),
	}, nil
}

type convertPlaceExtraction struct {
	extractedPlace convertExtractedPlace
	wrapper        convertWrapper
}

func (cla convertPlaceExtraction) ModelToGrpc(
	pe *model.PlaceExtraction,
) *grpcgen.PlaceExtraction {
	var processedAt *timestamppb.Timestamp
	if pe.ProcessedAt != nil {
		processedAt = timestamppb.New(*pe.ProcessedAt)
	}
	return &grpcgen.PlaceExtraction{
		Places:      cla.extractedPlace.ModelToGrpcList(pe.Places),
		ProcessedAt: processedAt,
		Error:       cla.wrapper.StringPtrToStringValue(pe.Error),
	}
}

type convertExtractedPlace struct {
	geocodedPlace convertGeocodedPlace
}

func (ca convertExtractedPlace) ModelToGrpc(
	ep *model.ExtractedPlace,
) *grpcgen.ExtractedPlace {
	return &grpcgen.ExtractedPlace{
		Text:          ep.Text,
		GeocodedPlace: ca.geocodedPlace.ModelToGrpc(ep.GeocodedPlace),
	}
}

func (ca convertExtractedPlace) ModelToGrpcList(
	als []*model.ExtractedPlace,
) []*grpcgen.ExtractedPlace {
	grpcAls := make([]*grpcgen.ExtractedPlace, len(als))
	for i, al := range als {
		grpcAls[i] = ca.ModelToGrpc(al)
	}
	return grpcAls
}

type convertGeocodedPlace struct {
	latLng convertLatLng
}

func (cl convertGeocodedPlace) ModelToGrpc(
	gp *model.GeocodedPlace,
) *grpcgen.GeocodedPlace {
	return &grpcgen.GeocodedPlace{
		GooglePlaceId: gp.GooglePlaceID,
		LatLng:        cl.latLng.ModelToGrpc(gp.LatLng),
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

type convertMessageSentCount struct {
	monthlySurplus convertMonthlySurplusMessageSentCount
	daily          convertDailyMessageSentCount
}

func (c convertMessageSentCount) ModelToGrpc(
	m *model.MonthlySurplusMessageSentCount,
	d *model.DailyMessageSentCount,
) *grpcgen.MessageSentCount {
	return &grpcgen.MessageSentCount{
		MonthlySurplus: c.monthlySurplus.ModelToGrpc(m),
		Daily:          c.daily.ModelToGrpc(d, &m.YearMonth),
	}
}

type convertMonthlySurplusMessageSentCount struct {
	yearMonth convertYearMonth
}

func (c convertMonthlySurplusMessageSentCount) ModelToGrpc(
	count *model.MonthlySurplusMessageSentCount,
) *grpcgen.MonthlySurplusMessageSentCount {
	return &grpcgen.MonthlySurplusMessageSentCount{
		YearMonth: c.yearMonth.ModelToGrpc(&count.YearMonth),
		Count:     int32(count.Count()),
	}
}

type convertDailyMessageSentCount struct {
	date convertDate
}

func (c convertDailyMessageSentCount) ModelToGrpc(
	count *model.DailyMessageSentCount,
	ym *model.YearMonth,
) *grpcgen.DailyMessageSentCount {
	return &grpcgen.DailyMessageSentCount{
		Date:  c.date.ModelToGrpc(ym, count.Day),
		Count: int32(count.Count),
	}
}

type convertRemainingMessageSendCount struct {
	monthlySurplus convertRemainingMonthlySurplusMessageSendCount
	daily          convertRemainingDailyMessageSendCount
}

func (c convertRemainingMessageSendCount) ModelToGrpc(
	m *model.MonthlySurplusMessageSentCount,
	d *model.DailyMessageSentCount,
) *grpcgen.RemainingMessageSendCount {
	return &grpcgen.RemainingMessageSendCount{
		MonthlySurplus: c.monthlySurplus.ModelToGrpc(m),
		Daily:          c.daily.ModelToGrpc(d, &m.YearMonth),
	}
}

type convertRemainingMonthlySurplusMessageSendCount struct {
	yearMonth convertYearMonth
}

func (c convertRemainingMonthlySurplusMessageSendCount) ModelToGrpc(
	count *model.MonthlySurplusMessageSentCount,
) *grpcgen.RemainingMonthlySurplusMessageSendCount {
	return &grpcgen.RemainingMonthlySurplusMessageSendCount{
		YearMonth: c.yearMonth.ModelToGrpc(&count.YearMonth),
		Count:     int32(count.CountRemaining()),
	}
}

type convertRemainingDailyMessageSendCount struct {
	date convertDate
}

func (c convertRemainingDailyMessageSendCount) ModelToGrpc(
	count *model.DailyMessageSentCount,
	ym *model.YearMonth,
) *grpcgen.RemainingDailyMessageSendCount {
	return &grpcgen.RemainingDailyMessageSendCount{
		Date:  c.date.ModelToGrpc(ym, count.Day),
		Count: int32(count.CountRemaining()),
	}
}

type convertDate struct{}

func (convertDate) ModelToGrpc(
	ym *model.YearMonth,
	day model.Day,
) *grpcgen.Date {
	return &grpcgen.Date{
		Year:  int32(ym.Year),
		Month: int32(ym.Month),
		Day:   int32(day),
	}
}

type convertYearMonth struct{}

func (convertYearMonth) ModelToGrpc(ym *model.YearMonth) *grpcgen.YearMonth {
	return &grpcgen.YearMonth{
		Year:  int32(ym.Year),
		Month: int32(ym.Month),
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
