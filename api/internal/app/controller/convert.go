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
	role            convertRole
	wrapper         convertWrapper
	placeExtraction convertPlaceExtraction
	structure       convertStructure
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
	role, err := cm.role.ModelToGrpc(msg.Role)
	if err != nil {
		return nil, err
	}

	var st *grpcgen.Structure
	if msg.Structure != nil {
		st = cm.structure.ModelToGrpc(msg.Structure)
	}

	return &grpcgen.Message{
		Id:              string(msg.ID),
		Text:            msg.Text,
		Role:            role,
		SentAt:          timestamppb.New(msg.SentAt),
		ClientId:        cm.wrapper.StringPtrToStringValue(msg.ClientID),
		PlaceExtraction: cm.placeExtraction.ModelToGrpc(&msg.PlaceExtraction),
		Content:         msg.Content,
		Structure:       st,
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
	var gp *grpcgen.GeocodedPlace
	if ep.GeocodedPlace != nil {
		gp = ca.geocodedPlace.ModelToGrpc(ep.GeocodedPlace)
	}

	return &grpcgen.ExtractedPlace{
		Text:          ep.Text,
		GeocodedPlace: gp,
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

type convertMessageChunk struct {
	structName convertStructName
}

func (c convertMessageChunk) ModelToGrpc(
	chunk *model.MessageChunk,
) (*grpcgen.MessageChunk, error) {
	role, err := conv.Message.role.ModelToGrpc(chunk.Role)
	if err != nil {
		return nil, err
	}

	var st *grpcgen.StructureChunk
	if chunk.Structure != nil {
		st = &grpcgen.StructureChunk{
			Name:   c.structName.ModelToGrpc(chunk.Structure.Name),
			Struct: chunk.Structure.Struct,
		}
	}

	return &grpcgen.MessageChunk{
		MessageId: string(chunk.MessageID),
		Text:      chunk.Text,
		Role:      role,
		SentAt:    timestamppb.New(chunk.SentAt),
		ClientId:  conv.Message.wrapper.StringPtrToStringValue(chunk.ClientID),
		IsLast:    chunk.IsLast,
		Content:   chunk.Content,
		Structure: st,
	}, nil
}

type convertStructName struct{}

func (convertStructName) ModelToGrpc(
	name model.StructName,
) grpcgen.StructName {
	switch name {
	case model.SNPlaceDetails:
		return grpcgen.StructName_PLACE_DETAILS
	case model.SNPlaces:
		return grpcgen.StructName_PLACES
	case model.SNRoute:
		return grpcgen.StructName_ROUTE
	default:
		return grpcgen.StructName_STRUCT_NAME_UNKNOWN
	}
}

type convertRole struct{}

func (convertRole) ModelToGrpc(r model.Role) (grpcgen.Role, error) {
	switch r {
	case model.UserRole:
		return grpcgen.Role_USER, nil
	case model.OtomoRole:
		return grpcgen.Role_OTOMO, nil
	default:
		return grpcgen.Role_ROLE_UNKNOWN, &errs.Error{
			Domain: errs.DomainMessage,
			Cause:  errs.CauseNotExist,
			Field:  errs.FieldRole,
		}
	}
}

type convertStructure struct {
	placeDetailsStruct convertPlaceDetailsStruct
	placesStruct       convertPlacesStruct
	routeStruct        convertRouteStruct
}

func (c convertStructure) ModelToGrpc(
	s *model.Structure,
) *grpcgen.Structure {
	switch s.Name {
	case model.SNPlaceDetails:
		return &grpcgen.Structure{
			Name: grpcgen.StructName_PLACE_DETAILS,
			Struct: &grpcgen.Structure_PlaceDetailsStruct{
				PlaceDetailsStruct: c.placeDetailsStruct.ModelToGrpc(
					s.Struct.(*model.PlaceDetailsStruct),
				),
			},
		}
	case model.SNPlaces:
		return &grpcgen.Structure{
			Name: grpcgen.StructName_PLACES,
			Struct: &grpcgen.Structure_PlacesStruct{
				PlacesStruct: c.placesStruct.ModelToGrpc(
					s.Struct.(*model.PlacesStruct),
				),
			},
		}
	case model.SNRoute:
		return &grpcgen.Structure{
			Name: grpcgen.StructName_ROUTE,
			Struct: &grpcgen.Structure_RouteStruct{
				RouteStruct: c.routeStruct.ModelToGrpc(
					s.Struct.(*model.RouteStruct),
				),
			},
		}
	default:
		return &grpcgen.Structure{
			Name:   grpcgen.StructName_STRUCT_NAME_UNKNOWN,
			Struct: nil,
		}
	}
}

type convertPlaceDetailsStruct struct {
	geocodedPlace convertGeocodedPlace
}

func (c convertPlaceDetailsStruct) ModelToGrpc(
	pd *model.PlaceDetailsStruct,
) *grpcgen.PlaceDetailsStruct {
	var gp *grpcgen.GeocodedPlace
	if pd.Details.GeocodedPlace != nil {
		gp = c.geocodedPlace.ModelToGrpc(pd.Details.GeocodedPlace)
	}

	return &grpcgen.PlaceDetailsStruct{
		Prologue: pd.Prologue,
		Details: &grpcgen.PlaceDetails{
			Name:          pd.Details.Name,
			Description:   pd.Details.Description,
			GeocodedPlace: gp,
		},
		Epilogue: pd.Epilogue,
	}
}

type convertPlacesStruct struct {
	geocodedPlace convertGeocodedPlace
}

func (c convertPlacesStruct) ModelToGrpc(
	ps *model.PlacesStruct,
) *grpcgen.PlacesStruct {
	places := make([]*grpcgen.Place, len(ps.Places))
	for i, p := range ps.Places {
		var gp *grpcgen.GeocodedPlace
		if p.GeocodedPlace != nil {
			gp = c.geocodedPlace.ModelToGrpc(p.GeocodedPlace)
		}
		places[i] = &grpcgen.Place{
			Name:          p.Name,
			Description:   p.Description,
			GeocodedPlace: gp,
		}
	}

	return &grpcgen.PlacesStruct{
		Prologue: ps.Prologue,
		Places:   places,
		Epilogue: ps.Epilogue,
	}
}

type convertRouteStruct struct {
	geocodedPlace  convertGeocodedPlace
	transportation convertTransportation
}

func (c convertRouteStruct) ModelToGrpc(
	rs *model.RouteStruct,
) *grpcgen.RouteStruct {
	waypoints := make([]*grpcgen.Waypoint, len(rs.Waypoints))
	for i, wp := range rs.Waypoints {
		var gp *grpcgen.GeocodedPlace
		if wp.GeocodedPlace != nil {
			gp = c.geocodedPlace.ModelToGrpc(wp.GeocodedPlace)
		}
		waypoints[i] = &grpcgen.Waypoint{
			Name:                      wp.Name,
			Description:               wp.Description,
			Transportation:            c.transportation.ModelToGrpcList(wp.Transportation),
			TransportationDescription: wp.TransportationDescription,
			GeocodedPlace:             gp,
		}
	}

	return &grpcgen.RouteStruct{
		Prologue:  rs.Prologue,
		Waypoints: waypoints,
		Epilogue:  rs.Epilogue,
	}
}

type convertTransportation struct {
}

func (c convertTransportation) ModelToGrpcList(
	ts []model.Transportation,
) []grpcgen.Transportation {
	grpcTs := make([]grpcgen.Transportation, len(ts))
	for i, t := range ts {
		grpcTs[i] = c.ModelToGrpc(t)
	}
	return grpcTs
}

func (convertTransportation) ModelToGrpc(
	t model.Transportation,
) grpcgen.Transportation {
	switch t {
	case model.Airplane:
		return grpcgen.Transportation_AIRPLANE
	case model.Train:
		return grpcgen.Transportation_TRAIN
	case model.Bicycle:
		return grpcgen.Transportation_BICYCLE
	case model.Bus:
		return grpcgen.Transportation_BUS
	case model.Car:
		return grpcgen.Transportation_CAR
	case model.Ship:
		return grpcgen.Transportation_SHIP
	case model.Motorcycle:
		return grpcgen.Transportation_MOTORCYCLE
	case model.Taxi:
		return grpcgen.Transportation_TAXI
	case model.Other:
		return grpcgen.Transportation_OTHER
	default:
		return grpcgen.Transportation_TRANSPORTATION_UNKNOWN
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
