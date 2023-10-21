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

var otomoProfileRepo = NewOtomoProfileRepository(systemtest.FirestoreClient())

func TestOtomoProfileRepository_GetByUserID_ShouldReturnOtomo_WhenFound(t *testing.T) {
	var (
		giveCtx = context.Background()
		userID  = model.UserID(uuid.NewString())
		profile = testmodel.DefaultOtomoProfileFactory.
			UserID(userID).
			Language("English").
			New()
	)
	if _, err := systemtest.FirestoreClient().
		Doc(GetOtomoProfileDocPath(userID)).
		Set(giveCtx, profile); err != nil {
		t.Fatal(err)
	}

	got, err := otomoProfileRepo.GetByUserID(giveCtx, userID)
	if err != nil {
		t.Fatal(err)
	}

	assert.Equal(t, profile, got)
}

func TestOtomoProfileRepository_GetByUserID_ShouldReturnNotFoundErr_WhenNotFound(t *testing.T) {
	var (
		giveCtx = context.Background()
		userID  = model.UserID(uuid.NewString())
	)

	got, err := otomoProfileRepo.GetByUserID(giveCtx, userID)
	assert.Nil(t, got)
	assert.True(t, errs.IsNotFoundErr(err))
}
