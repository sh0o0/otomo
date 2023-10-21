package repository

import (
	"context"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testmodel"
	"testing"

	"github.com/stretchr/testify/assert"
)

var testOtomoRepo = NewOtomoRepository(systemtest.FirestoreClient())

func TestOtomoRepository_Save_ShouldAddOtomo_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveOtomo  = testmodel.DefaultOtomoFactory.UserID(giveUserID).New()
	)

	if err := testOtomoRepo.Save(giveCtx, giveOtomo); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient().
		Doc(GetOtomoDocPath(giveUserID)).
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
		initialOtomo     = testmodel.DefaultOtomoFactory.UserID(giveUserID).New()
		giveUpdatedOtomo = testmodel.DefaultOtomoFactory.UserID(giveUserID).New()
	)

	if err := testOtomoRepo.Save(giveCtx, initialOtomo); err != nil {
		t.Fatal(err)
	}
	if err := testOtomoRepo.Save(giveCtx, giveUpdatedOtomo); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient().
		Doc(GetOtomoDocPath(giveUserID)).
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
func TestOtomoRepository_GetByID_ShouldReturnOtomo_WhenFound(t *testing.T) {
	var (
		giveCtx   = context.Background()
		userID    = model.UserID(uuid.NewString())
		giveOtomo = testmodel.DefaultOtomoFactory.UserID(userID).New()
	)

	if err := testOtomoRepo.Save(giveCtx, giveOtomo); err != nil {
		t.Fatal(err)
	}

	gotOtomo, err := testOtomoRepo.GetByUserID(giveCtx, userID)
	if err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, giveOtomo, gotOtomo)
}

func TestOtomoRepository_Get_ShouldReturnNotFoundErr_WhenNotFound(t *testing.T) {
	var (
		giveCtx = context.Background()
		userID  = model.UserID(uuid.NewString())
	)

	gotChat, err := testOtomoRepo.GetByUserID(giveCtx, userID)
	assert.Nil(t, gotChat)
	assert.True(t, errs.IsNotFoundErr(err))
}
