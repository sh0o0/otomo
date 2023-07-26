package testinfra

import (
	"context"

	"cloud.google.com/go/firestore"
)

var (
	FirestoreClient *firestore.Client
)

func init() {
	ctx := context.Background()
	client, err := firestore.NewClient(ctx, "dummy-project-id")
	if err != nil {
		panic(err)
	}

	FirestoreClient = client
}
