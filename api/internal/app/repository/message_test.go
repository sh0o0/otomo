package repository

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
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

var msgRepo = NewMessageRepository(systemtest.FirestoreClient)

func TestMessageWithOtomoRepository_Add_ShouldAddMsg_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = &model.Message{
			ID:       uuid.NewString(),
			UserID:   uuid.NewString(),
			Text:     "test test test",
			Sender:   model.OtomoRole,
			Receiver: model.UserRole,
			SentAt:   times.C.Now(),
		}
	)

	if err := msgRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(string(giveMsg.UserID), string(giveMsg.ID))).
		Get(giveCtx)
	if err != nil {
		t.Fatal(err)
	}

	var gotModel = &model.Message{}
	if err := snapshot.DataTo(gotModel); err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, giveMsg, gotModel)
}

func TestMessageWithOtomoRepository_Add_ShouldReturnErr_WhenAddDuplicateMsg(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = &model.Message{
			ID:       uuid.NewString(),
			UserID:   uuid.NewString(),
			Text:     "test test test",
			Sender:   model.OtomoRole,
			Receiver: model.UserRole,
			SentAt:   times.C.Now(),
		}
	)

	if err := msgRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}
	err := msgRepo.Add(giveCtx, giveMsg)
	assert.Error(t, err)
}

func TestMessageWithOtomoRepository_DeleteByIDAndUserID_ShouldDelete_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = &model.Message{
			ID:       uuid.NewString(),
			UserID:   uuid.NewString(),
			Text:     "test test test",
			Sender:   model.OtomoRole,
			Receiver: model.UserRole,
			SentAt:   times.C.Now(),
		}
	)

	if err := msgRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}
	if err := msgRepo.DeleteByIDAndUserID(
		giveCtx, giveMsg.ID, giveMsg.UserID); err != nil {
		t.Fatal(err)
	}

	_, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(string(giveMsg.ID), string(giveMsg.ID))).
		Get(giveCtx)
	assert.Equal(t, codes.NotFound, status.Code(err))
}

func TestMessageWithOtomoRepository_DeleteByIDAndUserID_ShouldReturnNotFoundErr_WhenDeleteMsgNotExist(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveMsgID  = uuid.NewString()
		giveUserID = uuid.NewString()
	)

	err := msgRepo.DeleteByIDAndUserID(
		giveCtx,
		giveMsgID,
		giveUserID,
	)

	assert.True(t, errs.IsNotFoundErr(err))
}
