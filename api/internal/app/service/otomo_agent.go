package service

import (
	"context"
	_ "embed"
	"encoding/json"
	"otomo/internal/app/interfaces/svc"
	"otomo/internal/app/model"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
)

const (
	tellAboutPlacesFuncName       = "tell_about_places"
	tellAboutRouteFuncName        = "tell_about_route"
	tellAboutPlaceDetailsFuncName = "tell_about_place_details"
)

var (
	//go:embed tell_about_places.schema.json
	tellAboutPlacesSchema []byte
	//go:embed tell_about_route.schema.json
	tellAboutRouteSchema []byte
	//go:embed tell_about_place_details.schema.json
	tellAboutPlaceDetailsSchema []byte
)

var funcAndStructNamesMap = map[string]model.StructName{
	tellAboutPlacesFuncName:       model.SNPlaces,
	tellAboutRouteFuncName:        model.SNRoute,
	tellAboutPlaceDetailsFuncName: model.SNPlaceDetails,
}

var _ svc.OtomoAgentService = (*OtomoAgentService)(nil)

type OtomoAgentService struct {
	convSvc    svc.ConversationService
	summarySvc svc.SummaryService
}

func NewOtomoAgentService(
	convSvc svc.ConversationService,
	summarySvc svc.SummaryService,
) *OtomoAgentService {
	return &OtomoAgentService{
		convSvc:    convSvc,
		summarySvc: summarySvc,
	}
}

func (oas *OtomoAgentService) Respond(
	ctx context.Context,
	otomo *model.Otomo,
	msg *model.Message,
	opts svc.OtomoAgentOptions,
) (*model.Otomo, *model.Message, error) {
	var (
		replyID = model.MessageID(uuid.NewString())
	)

	personality, err := otomo.Profile.TransJustFriendly().Prompt()
	if err != nil {
		return nil, nil, err
	}
	replyRet, err := oas.convSvc.Respond(ctx, msg, svc.ConversationOptions{
		History:     otomo.Memory.Summary,
		Personality: personality,
		Functions: []svc.FunctionDefinition{
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
		},
		SpeakingFunc: func(ctx context.Context, sc *svc.SpokenChunk) error {
			if opts.MessagingFunc == nil {
				return nil
			}
			msgChunk := oas.spokenChunkToMessageChunk(replyID, sc)
			return opts.MessagingFunc(ctx, msgChunk)
		},
	})
	if err != nil {
		return nil, nil, err
	}

	var (
		// TODO: Add the procedure to convert function call to struct.
		structName string
		strct      model.Struct
	)

	reply := model.RestoreMessageWithStruct(
		replyID,
		replyRet.Content, // TODO:: How about when function call? It might be given json added explanation.
		model.OtomoRole,
		times.C.Now(),
		nil,
		replyRet.Content,
		structName,
		strct,
	)

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
