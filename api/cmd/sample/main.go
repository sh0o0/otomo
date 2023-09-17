package main

import (
	"context"
	"fmt"
	"otomo/internal/app/model"
	"otomo/internal/app/service"
	"otomo/internal/pkg/uuid"

	evbus "github.com/asaskevich/EventBus"
)

func main() {
	bus := evbus.New()
	sub := service.NewMessagingSubscriber(bus)
	pub := service.NewMessagingPublisher(bus)

	if err := sub.Init(); err != nil {
		panic(err)
	}

	var (
		ctx    = context.Background()
		userID = model.UserID(uuid.NewString())
	)

	if err := sub.Subscribe(ctx, userID, func(ctx context.Context, msg *model.MessageChunk) {
		fmt.Println(msg.Text)
	}); err != nil {
		panic(err)
	}

	pub.Publish(userID, &model.MessageChunk{
		MessageID: model.MessageID(uuid.NewString()),
		Text:      "Hello",
	})

	bus.WaitAsync()

	fmt.Println("done")
}
