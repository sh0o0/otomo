package repository

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/interface/gateway/repository/model"
	"otomo/pkg/uuid"
	"otomo/test/testinfra"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

var messageWithOtomoRepo = NewMessageWithOtomoRepository(testinfra.FirestoreClient)

func TestMessageWithOtomoRepository_Add(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = message.RestoreMessageWithOtomo(
			message.MessageWithOtomoID(uuid.NewString()),
			user.ID(uuid.NewString()),
			message.OtomoRole,
			message.UserRole,
			"test test test test test ",
			time.Now().Truncate(time.Second).Local(),
		)
	)

	if err := messageWithOtomoRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}

	snapshot, err := testinfra.FirestoreClient.
		Doc(GetMessageWithOtomoPath(string(giveMsg.ID()))).
		Get(giveCtx)
	if err != nil {
		t.Fatal(err)
	}

	var msgModel = &model.MessageWithOtomo{}
	if err := snapshot.DataTo(msgModel); err != nil {
		t.Fatal(err)
	}

	got, err := model.ConvertMessageWithOtomoModelToEntity(
		msgModel, giveMsg.UserID())
	if err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, giveMsg, got)
}
