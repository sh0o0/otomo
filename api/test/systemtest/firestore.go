package systemtest

import (
	"context"

	"cloud.google.com/go/firestore"
)

var (
	FirestoreClient *firestore.Client
)

func initFirestoreClient() error {
	ctx := context.Background()
	client, err := firestore.NewClient(ctx, "dummy-project-id")
	if err != nil {
		return err
	}

	FirestoreClient = client
	return nil
}
