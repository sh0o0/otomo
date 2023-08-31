package repository

import (
	"context"
	"otomo/internal/app/model"
	"otomo/test/systemtest"
	"testing"

	"cloud.google.com/go/firestore"
)

var chatRepo = NewChatRepository(systemtest.FirestoreClient)

func TestChatRepository_Save(t *testing.T) {
	type fields struct {
		fsClient *firestore.Client
	}
	type args struct {
		ctx    context.Context
		userID model.UserID
		chat   *model.Chat
	}
	tests := []struct {
		name      string
		fields    fields
		args      args
		wantIsErr bool
	}{
		// TODO: Add test cases.
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			r := &ChatRepository{
				fsClient: tt.fields.fsClient,
			}
			if err := r.Save(tt.args.ctx, tt.args.userID, tt.args.chat); (err != nil) != tt.wantIsErr {
				t.Errorf("ChatRepository.Save() error = %v, wantIsErr %v", err, tt.wantIsErr)
			}
		})
	}
}
