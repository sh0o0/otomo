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

var chatRepo = NewChatRepository(systemtest.FirestoreClient)

func TestChatRepository_Save_ShouldAddChat_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveChat   = testmodel.DefaultTestChatFactory.Fake()
	)

	if err := chatRepo.Save(giveCtx, giveUserID, giveChat); err != nil {
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
