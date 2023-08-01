package repository

import (
	"context"
	"otomo/internal/app/domain/entity/message"
	"otomo/internal/app/domain/entity/user"
	"otomo/internal/app/interface/gateway/repository/model"
	"otomo/pkg/errs"
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

var msgWithOtomoRepo = NewMessageWithOtomoRepository(systemtest.FirestoreClient)

func TestMessageWithOtomoRepository_Add_ShouldAddMsg_WhenArgsAreValid(t *testing.T) {
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

	if err := msgWithOtomoRepo.Add(giveCtx, giveMsg); err != nil {
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

func TestMessageWithOtomoRepository_Add_ShouldReturnErr_WhenAddDuplicateMsg(t *testing.T) {
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

	if err := msgWithOtomoRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}
	err := msgWithOtomoRepo.Add(giveCtx, giveMsg)
	assert.Error(t, err)
}

func TestMessageWithOtomoRepository_DeleteByIDAndUserID_ShouldDelete_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx = context.Background()
		giveMsg = message.NewMessageWithOtomo(
			user.ID(uuid.NewString()),
			message.OtomoRole,
			message.UserRole,
			"test test test test test",
		)
	)

	if err := msgWithOtomoRepo.Add(giveCtx, giveMsg); err != nil {
		t.Fatal(err)
	}
	if err := msgWithOtomoRepo.DeleteByIDAndUserID(
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

func TestMessageWithOtomoRepository_DeleteByIDAndUserID_ShouldReturnNotFoundErr_WhenDeleteMsgNotExist(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveMsgID  = message.MessageWithOtomoID(uuid.NewString())
		giveUserID = user.ID(uuid.NewString())
	)

	err := msgWithOtomoRepo.DeleteByIDAndUserID(
		giveCtx,
		giveMsgID,
		giveUserID,
	)

	assert.True(t, errs.IsNotFoundErr(err))
}
