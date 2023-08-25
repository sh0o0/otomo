package repository

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testmodel"
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
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.OtomoRole)
	)

	if err := msgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(string(giveUserID), string(giveMsg.ID))).
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
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.OtomoRole)
	)

	if err := msgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}
	err := msgRepo.Add(giveCtx, giveUserID, giveMsg)
	assert.Error(t, err)
}

func TestMessageWithOtomoRepository_DeleteByIDAndUserID_ShouldDelete_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.OtomoRole)
	)

	if err := msgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}
	if err := msgRepo.DeleteByIDAndUserID(
		giveCtx, giveUserID, giveMsg.ID); err != nil {
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
		giveUserID = model.UserID(uuid.NewString())
		giveMsgID  = model.MessageID(uuid.NewString())
	)

	err := msgRepo.DeleteByIDAndUserID(
		giveCtx,
		giveUserID,
		giveMsgID,
	)

	assert.True(t, errs.IsNotFoundErr(err))
}
