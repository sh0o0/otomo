package repository

import (
	"context"
	"otomo/internal/app/controller/repo"
	"otomo/internal/app/model"

	"cloud.google.com/go/firestore"
)

var _ repo.ChatRepository = (*ChatRepository)(nil)

type ChatRepository struct {
	fsClient *firestore.Client
}

func NewChatRepository(
	fsClient *firestore.Client,
) *ChatRepository {
	return &ChatRepository{
		fsClient: fsClient,
	}
}

func (r *ChatRepository) Save(
	ctx context.Context,
	userID model.UserID,
	chat *model.Chat,
) error {
	chatDoc := r.getDoc(ctx, userID)
	_, err := chatDoc.Set(ctx, chat)
	return err
}

func (r *ChatRepository) getDoc(
	ctx context.Context,
	userID model.UserID,
) *firestore.DocumentRef {
	return r.fsClient.Doc(getChatDocPath(userID))
}
