package repository

import (
	"context"
	"otomo/internal/app/interfaces/repo"
	"otomo/internal/app/model"
	"otomo/internal/pkg/errs"
	"otomo/internal/pkg/times"
	"otomo/internal/pkg/uuid"
	"otomo/test/systemtest"
	"otomo/test/testmodel"
	"otomo/test/testutil"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

var testMsgRepo = NewMessageRepository(systemtest.FirestoreClient)

func TestMessageRepository_Last_ShouldGetLastMsg_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.UserRole)
	)

	if err := testMsgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}

	gotMsg, err := testMsgRepo.Last(giveCtx, giveUserID)

	assert.NoError(t, err)
	assert.Equal(t, giveMsg, gotMsg)
}

func TestMessageRepository_Last_ShouldReturnErr_WhenThereIsNo(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
	)

	_, err := testMsgRepo.Last(giveCtx, giveUserID)

	assert.True(t, errs.IsNotFoundErr(err))
}

func TestMessageRepository_Add_ShouldAddMsg_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.OtomoRole)
	)

	if err := testMsgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}

	snapshot, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(giveUserID, giveMsg.ID)).
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

func TestMessageRepository_Add_ShouldReturnErr_WhenAddDuplicateMsg(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.OtomoRole)
	)

	if err := testMsgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}
	err := testMsgRepo.Add(giveCtx, giveUserID, giveMsg)
	assert.Error(t, err)
}

func TestMessageRepository_DeleteByIDAndUserID_ShouldDelete_WhenArgsAreValid(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsg    = testmodel.DefaultTestMessageFactory.Role(model.OtomoRole)
	)

	if err := testMsgRepo.Add(giveCtx, giveUserID, giveMsg); err != nil {
		t.Fatal(err)
	}
	if err := testMsgRepo.DeleteByIDAndUserID(
		giveCtx, giveUserID, giveMsg.ID); err != nil {
		t.Fatal(err)
	}

	_, err := systemtest.FirestoreClient.
		Doc(getMessageDocPath(giveUserID, giveMsg.ID)).
		Get(giveCtx)
	assert.Equal(t, codes.NotFound, status.Code(err))
}

func TestMessageRepository_DeleteByIDAndUserID_ShouldReturnNotFoundErr_WhenDeleteMsgNotExist(t *testing.T) {
	var (
		giveCtx    = context.Background()
		giveUserID = model.UserID(uuid.NewString())
		giveMsgID  = model.MessageID(uuid.NewString())
	)

	err := testMsgRepo.DeleteByIDAndUserID(
		giveCtx,
		giveUserID,
		giveMsgID,
	)

	assert.True(t, errs.IsNotFoundErr(err))
}

func TestMessageRepository_List(t *testing.T) {

	var (
		userID           = model.UserID(uuid.NewString())
		messagesCount    = 51
		msgs             = make([]*model.Message, messagesCount)
		descBySentAtMsgs = make([]*model.Message, messagesCount)
	)

	// Add messages for tests
	for i := 0; i < messagesCount; i++ {
		msgs[i] = testmodel.DefaultTestMessageFactory.
			SentAt(times.C.Now().Add(time.Second * time.Duration(i)))
		descBySentAtMsgs[messagesCount-i-1] = msgs[i]

		err := testMsgRepo.Add(context.TODO(), userID, msgs[i])
		if err != nil {
			t.Fatal(err)
		}
	}

	type args struct {
		ctx    context.Context
		userID model.UserID
		page   *repo.MessagePage
	}
	tests := []struct {
		name      string
		args      args
		want      []*model.Message
		wantIsErr bool
	}{
		{
			name: "should return 50 messages when page is nil",
			args: args{
				ctx:    context.TODO(),
				userID: userID,
				page:   nil,
			},
			want:      descBySentAtMsgs[:50],
			wantIsErr: false,
		},
		{
			name: testutil.JoinStrings(
				"should return first message",
				"when page_start_after_message_id is 50th message id",
			),
			args: args{
				ctx:    context.TODO(),
				userID: userID,
				page: &repo.MessagePage{
					StartAfterMessageID: descBySentAtMsgs[49].ID,
				},
			},
			want:      descBySentAtMsgs[50:51],
			wantIsErr: false,
		},
		{
			name: "should return 25 messages when page_size 25",
			args: args{
				ctx:    context.TODO(),
				userID: userID,
				page: &repo.MessagePage{
					Size: 25,
				},
			},
			want:      descBySentAtMsgs[:25],
			wantIsErr: false,
		},
		{
			name: testutil.JoinStrings(
				"should return 20 messages started after 30 of index",
				"when page_size is 20 and start_after is 30",
			),
			args: args{
				ctx:    context.TODO(),
				userID: userID,
				page: &repo.MessagePage{
					Size:                20,
					StartAfterMessageID: descBySentAtMsgs[30].ID,
				},
			},
			want:      descBySentAtMsgs[31:51],
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			r := testMsgRepo
			got, err := r.List(tt.args.ctx, tt.args.userID, tt.args.page)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("MessageRepository.List() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			assert.Exactly(t, tt.want, got)
		})
	}
}
