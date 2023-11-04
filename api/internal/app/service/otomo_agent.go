package service

import (
	"context"
	_ "embed"
	"encoding/json"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/jschema"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"

	"googlemaps.github.io/maps"
)

const (
	tellAboutPlacesFuncName       = "tell_about_places"
	tellAboutRouteFuncName        = "tell_about_route"
	tellAboutPlaceDetailsFuncName = "tell_about_place_details"
)

var funcAndStructNamesMap = map[string]model.StructName{
	tellAboutPlacesFuncName:       model.SNPlaces,
	tellAboutRouteFuncName:        model.SNRoute,
	tellAboutPlaceDetailsFuncName: model.SNPlaceDetails,
}

type PlaceDetailsSchema struct {
	Prologue string `json:"prologue" jsonschema:"required"`
	Details  struct {
		Name        string `json:"name" jsonschema:"required"`
		Description string `json:"description" jsonschema:"required"`
	} `json:"details" jsonschema:"required"`
	Epilogue string `json:"epilogue" jsonschema:"required"`
}

type PlacesSchema struct {
	Prologue string `json:"prologue" jsonschema:"required"`
	Places   []struct {
		Name        string `json:"name" jsonschema:"required"`
		Description string `json:"description" jsonschema:"required"`
	} `json:"places" jsonschema:"required"`
	Epilogue string `json:"epilogue" jsonschema:"required"`
}

type RouteSchema struct {
	Prologue  string `json:"prologue" jsonschema:"required"`
	Waypoints []struct {
		Name                      string   `json:"name" jsonschema:"required"`
		Description               string   `json:"description" jsonschema:"required"`
		Transportation            []string `json:"transportation" jsonschema:"enum=train,enum=airplane,enum=car,enum=ship,enum=bus,enum=bicycle,enum=motorcycle,enum=walking,enum=taxi,enum=other"`
		TransportationDescription string   `json:"transportation_description"`
	} `json:"waypoints" jsonschema:"required"`
	Epilogue string `json:"epilogue" jsonschema:"required"`
}

var (
	tellAboutPlaceDetailsSchema = func() []byte {
		b, err := jschema.ReflectMin(&PlaceDetailsSchema{}).MarshalJSON()
		if err != nil {
			panic(err)
		}
		return b
	}()
	tellAboutPlacesSchema = func() []byte {
		b, err := jschema.ReflectMin(&PlacesSchema{}).MarshalJSON()
		if err != nil {
			panic(err)
		}
		return b
	}()
	tellAboutRouteSchema = func() []byte {
		b, err := jschema.ReflectMin(&RouteSchema{}).MarshalJSON()
		if err != nil {
			panic(err)
		}
		return b
	}()
)

var functions = []svc.FunctionDefinition{
	{
		Name:        tellAboutPlacesFuncName,
		Description: "Called when the user asks for places. For example, some recommended places.",
		Parameters:  json.RawMessage(tellAboutPlacesSchema),
	},
	{
		Name:        tellAboutRouteFuncName,
		Description: "Called when the user asks for a route. For example, a recommended route.",
		Parameters:  json.RawMessage(tellAboutRouteSchema),
	},
	{
		Name:        tellAboutPlaceDetailsFuncName,
		Description: "Called when the user asks for details about a place. For example, the details of a place.",
		Parameters:  json.RawMessage(tellAboutPlaceDetailsSchema),
	},
}

var _ svc.OtomoAgentService = (*OtomoAgentService)(nil)

type OtomoAgentService struct {
	convSvc      svc.ConversationService
	summarySvc   svc.SummaryService
	geocodingSvc svc.GeocodingService
}

func NewOtomoAgentService(
	convSvc svc.ConversationService,
	summarySvc svc.SummaryService,
	geocodingSvc svc.GeocodingService,
) *OtomoAgentService {
	return &OtomoAgentService{
		convSvc:      convSvc,
		summarySvc:   summarySvc,
		geocodingSvc: geocodingSvc,
	}
}

func (oas *OtomoAgentService) Respond(
	ctx context.Context,
	otomo *model.Otomo,
	msg *model.Message,
	opts svc.OtomoAgentOptions,
) (*model.Otomo, *model.Message, error) {
	var replyID = model.MessageID(uuid.NewString())

	personality, err := otomo.Profile.TransJustFriendly().Prompt()
	if err != nil {
		return nil, nil, err
	}
	replyRet, err := oas.convSvc.Respond(ctx, msg, svc.ConversationOptions{
		History:      otomo.Memory.Summary,
		Personality:  personality,
		Functions:    functions,
		SpeakingFunc: oas.speakingFunc(opts.MessagingFunc, replyID),
	})
	if err != nil {
		return nil, nil, err
	}

	reply, err := oas.resultToMsg(ctx, replyID, replyRet)
	if err != nil {
		return nil, nil, err
	}

	newOtomo, err := oas.updateMemory(ctx, otomo, []*model.Message{reply})
	if err != nil {
		return nil, nil, err
	}

	return newOtomo, reply, nil
}

func (oas *OtomoAgentService) Message(
	ctx context.Context,
	otomo *model.Otomo,
	opts svc.OtomoAgentOptions,
) (*model.Otomo, *model.Message, error) {
	panic("not implemented") // TODO: Implement
}

func (oas *OtomoAgentService) updateMemory(
	ctx context.Context,
	crntOtomo *model.Otomo,
	newMsgs []*model.Message,
) (*model.Otomo, error) {
	summary, err := oas.summarySvc.Summarize(
		ctx, newMsgs, crntOtomo.Memory.Summary)
	if err != nil {
		return nil, err
	}

	return model.RestoreOtomo(
		crntOtomo.UserID,
		*model.NewMemory(summary),
		crntOtomo.Profile,
	)
}

func (oas *OtomoAgentService) resultToMsg(
	ctx context.Context,
	msgID model.MessageID,
	result *svc.ConversationResult,
) (*model.Message, error) {
	sn, s, err := oas.funcToStruct(ctx, result.FunctionCall)
	if err != nil {
		return nil, err
	}

	return model.RestoreMessageWithStruct(
		msgID,
		result.Content,
		model.OtomoRole,
		times.C.Now(),
		nil,
		result.Content,
		sn,
		s,
	), nil
}

func (oas *OtomoAgentService) funcToStruct(
	ctx context.Context,
	funk *svc.FunctionCall,
) (model.StructName, model.Struct, error) {
	sn, ok := funcAndStructNamesMap[funk.Name]
	if !ok {
		return model.SNEmpty, nil, nil
	}

	switch sn {
	case model.SNPlaceDetails:
		s, err := oas.placeDetailsToStruct(ctx, funk.Arguments)
		if err != nil {
			return "", nil, err
		}
		return sn, s, nil
	case model.SNPlaces:
		s, err := oas.placesToStruct(ctx, funk.Arguments)
		if err != nil {
			return "", nil, err
		}
		return sn, s, nil
	case model.SNRoute:
		s, err := oas.routeToStruct(ctx, funk.Arguments)
		if err != nil {
			return "", nil, err
		}
		return sn, s, nil
	default:
		return model.SNEmpty, nil, nil
	}
}

func (oas *OtomoAgentService) placeDetailsToStruct(
	ctx context.Context,
	arguments string,
) (model.Struct, error) {
	var schema = &PlaceDetailsSchema{}
	if err := json.Unmarshal([]byte(arguments), schema); err != nil {
		return nil, err
	}

	return &model.PlaceDetailsStruct{
		Prologue: schema.Prologue,
		Details: model.PlaceDetails{
			Name:        schema.Details.Name,
			Description: schema.Details.Description,
		},
		Epilogue: schema.Epilogue,
	}, nil
}

func (oas *OtomoAgentService) placesToStruct(
	ctx context.Context,
	arguments string,
) (model.Struct, error) {
	var schema = &PlacesSchema{}
	if err := json.Unmarshal([]byte(arguments), schema); err != nil {
		return nil, err
	}

	places := make([]*model.Place, len(schema.Places))
	for i, place := range schema.Places {
		var gp *model.GeocodedPlace
		geo, err := oas.geocodingSvc.One(ctx, &maps.GeocodingRequest{
			Address: place.Name,
		})
		if err == nil {
			gp = &model.GeocodedPlace{
				GooglePlaceID: geo.PlaceID,
				LatLng: model.LatLng{
					Lat: geo.Geometry.Location.Lat,
					Lng: geo.Geometry.Location.Lng,
				},
			}
		}

		places[i] = &model.Place{
			Name:          place.Name,
			Description:   place.Description,
			GeocodedPlace: gp,
		}
	}

	return &model.PlacesStruct{
		Prologue: schema.Prologue,
		Places:   places,
		Epilogue: schema.Epilogue,
	}, nil
}

func (oas *OtomoAgentService) routeToStruct(
	ctx context.Context,
	arguments string,
) (model.Struct, error) {
	var schema = &RouteSchema{}
	if err := json.Unmarshal([]byte(arguments), schema); err != nil {
		return nil, err
	}

	waypoints := make([]*model.Waypoint, len(schema.Waypoints))
	for i, waypoint := range schema.Waypoints {
		waypoints[i] = &model.Waypoint{
			Name:        waypoint.Name,
			Description: waypoint.Description,
			Transportation: oas.convertTransportationList(
				waypoint.Transportation),
			TransportationDescription: waypoint.TransportationDescription,
		}
	}

	return &model.RouteStruct{
		Prologue:  schema.Prologue,
		Waypoints: waypoints,
		Epilogue:  schema.Epilogue,
	}, nil
}

func (oas *OtomoAgentService) convertTransportationList(
	transportationList []string,
) []model.Transportation {
	var ret []model.Transportation

	for _, t := range transportationList {
		var a model.Transportation
		switch t {
		case "train":
			a = model.Train
		case "airplane":
			a = model.Airplane
		case "car":
			a = model.Car
		case "ship":
			a = model.Ship
		case "bus":
			a = model.Bus
		case "bicycle":
			a = model.Bicycle
		case "motorcycle":
			a = model.Motorcycle
		case "walking":
			a = model.Walking
		case "taxi":
			a = model.Taxi
		case "other":
			a = model.Other
		default:
			a = model.UnknownTransportation
		}
		ret = append(ret, a)
	}
	return ret
}

func (oas *OtomoAgentService) speakingFunc(
	messagingFunc model.MessagingFunc,
	msgID model.MessageID,
) func(ctx context.Context, chunk *svc.SpokenChunk) error {
	return func(ctx context.Context, chunk *svc.SpokenChunk) error {
		if messagingFunc == nil {
			return nil
		}
		msgChunk := oas.spokenChunkToMessageChunk(msgID, chunk)
		return messagingFunc(ctx, msgChunk)
	}
}

func (oas *OtomoAgentService) spokenChunkToMessageChunk(
	msgID model.MessageID,
	chunk *svc.SpokenChunk,
) *model.MessageChunk {
	var (
		structName model.StructName
		strct      string
	)
	if chunk.FunctionCall != nil {
		structName = funcAndStructNamesMap[chunk.FunctionCall.Name]
		strct = chunk.FunctionCall.Arguments
	}

	return model.NewMessageChunkWithStruct(
		msgID,
		model.OtomoRole,
		times.C.Now(),
		nil,
		chunk.IsLast,
		chunk.Content,
		structName,
		strct,
	)
}
