package repository

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testmodel"
	"testing"

	"github.com/stretchr/testify/assert"
)

var testChatRepo = NewChatRepository(systemtest.FirestoreClient)

func TestChatRepository_Save_ShouldAddChat_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveChat   = testmodel.DefaultTestChatFactory.Fake()
	)

	if err := testChatRepo.Save(giveCtx, giveUserID, giveChat); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getChatDocPath(giveUserID)).
		Get(giveCtx)
	if err != nil {
		t.Fatal(err)
	}

	var gotChat = &model.Chat{}
	if err := snapshot.DataTo(gotChat); err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, giveChat, gotChat)
}

func TestChatRepository_Get_ShouldGetChat_WhenFoundChat(t *testing.T) {
	var (
		giveCtx = context.Background()
		userID  = model.UserID(uuid.NewString())
		chat    = testmodel.DefaultTestChatFactory.Fake()
	)

	if err := testChatRepo.Save(giveCtx, userID, chat); err != nil {
		t.Fatal(err)
	}

	gotChat, err := testChatRepo.Get(giveCtx, userID)
	if err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, chat, gotChat)
}

func TestChatRepository_Get_ShouldGetEmptyChat_WhenNotFoundChat(t *testing.T) {
	var (
		giveCtx  = context.Background()
		userID   = model.UserID(uuid.NewString())
		wantChat = &model.Chat{}
	)

	gotChat, err := testChatRepo.Get(giveCtx, userID)
	if err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, wantChat, gotChat)
}
