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

var testOtomoRepo = NewOtomoRepository(systemtest.FirestoreClient)

func TestOtomoRepository_Save_ShouldAddOtomo_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveOtomo  = testmodel.DefaultTestOtomoFactory.UserID(giveUserID).New()
	)

	if err := testOtomoRepo.Save(giveCtx, giveOtomo); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getOtomoDocPath(giveUserID)).
		Get(giveCtx)
	if err != nil {
		t.Fatal(err)
	}

	var gotChat = &model.Otomo{}
	if err := snapshot.DataTo(gotChat); err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, giveOtomo, gotChat)
}

func TestOtomoRepository_Save_ShouldUpdateOtomo_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx          = context.Background()
		giveUserID       = model.UserID(uuid.NewString())
		initialOtomo     = testmodel.DefaultTestOtomoFactory.UserID(giveUserID).New()
		giveUpdatedOtomo = testmodel.DefaultTestOtomoFactory.UserID(giveUserID).New()
	)

	if err := testOtomoRepo.Save(giveCtx, initialOtomo); err != nil {
		t.Fatal(err)
	}
	if err := testOtomoRepo.Save(giveCtx, giveUpdatedOtomo); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getOtomoDocPath(giveUserID)).
		Get(giveCtx)
	if err != nil {
		t.Fatal(err)
	}

	var gotChat = &model.Otomo{}
	if err := snapshot.DataTo(gotChat); err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, giveUpdatedOtomo, gotChat)
}

// func TestChatRepository_Get_ShouldGetChat_WhenFoundChat(t *testing.T) {
// 	var (
// 		giveCtx = context.Background()
// 		userID  = model.UserID(uuid.NewString())
// 		chat    = testmodel.DefaultTestChatFactory.Fake()
// 	)

// 	if err := chatRepo.Save(giveCtx, userID, chat); err != nil {
// 		t.Fatal(err)
// 	}

// 	gotChat, err := chatRepo.Get(giveCtx, userID)
// 	if err != nil {
// 		t.Fatal(err)
// 	}

// 	assert.Equal(t, chat, gotChat)
// }
