package repository

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/interface/gateway/repository/model"
	"otomo/pkg/times"
	"otomo/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testutil"
	"testing"

	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

func init() {
	testutil.SetMockClock()
}

var messageWithOtomoRepo = NewMessageWithOtomoRepository(systemtest.FirestoreClient)

// TODO: Add test cases
func TestMessageWithOtomoRepository_Add(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = message.RestoreMessageWithOtomo(
			message.MessageWithOtomoID(uuid.NewString()),
			user.ID(uuid.NewString()),
			message.OtomoRole,
			message.UserRole,
			"test test test test test ",
			times.C.Now(),
		)
	)

	if err := messageWithOtomoRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(string(giveMsg.UserID()), string(giveMsg.ID()))).
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
func TestMessageWithOtomoRepository_DeleteByIDAndUserID(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = message.NewMessageWithOtomo(
			user.ID(uuid.NewString()),
			message.OtomoRole,
			message.UserRole,
			"test test test test test",
		)
	)

	if err := messageWithOtomoRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}
	if err := messageWithOtomoRepo.DeleteByIDAndUserID(
		giveCtx, giveMsg.ID(), giveMsg.UserID()); err != nil {
		t.Fatal(err)
	}

	_, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(string(giveMsg.ID()), string(giveMsg.ID()))).
		Get(giveCtx)
	if err == nil {
		t.Fatal("message should be deleted")
	}
	assert.Equal(t, codes.NotFound, status.Code(err))
}
