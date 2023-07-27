package present

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/interface/controller/grpc/grpcgen"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type ChatWithOtomoPresenter interface {
	MessageToOtomo(
		ctx context.Context,
		msg *message.MessageWithOtomo,
	) (*grpcgen.ChatWithOtomoMessageToOtomoResponse, error)
}
