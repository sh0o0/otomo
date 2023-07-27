package present

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/interface/controller/grpc/grpcgen"

	"google.golang.org/grpc/status"
)

//go:generate mockgen -source=$GOFILE -destination=mock_$GOPACKAGE/$GOFILE -package=mock_$GOPACKAGE

type ChatWithOtomoPresenter interface {
	MessageToOtomoOutput(
		ctx context.Context,
		msg *message.MessageWithOtomo,
	) (*grpcgen.ChatWithOtomoMessageToOtomoResponse, error)
	ErrorOutput(ctx context.Context, err error) *status.Status
}
