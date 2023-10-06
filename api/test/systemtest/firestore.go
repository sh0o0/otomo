package systemtest

import (
	"context"

	"cloud.google.com/go/firestore"
)

var firestoreClient *firestore.Client

func FirestoreClient() *firestore.Client {
	if firestoreClient != nil {
		return firestoreClient
	}

	ctx := context.Background()
	client, err := firestore.NewClient(ctx, "dummy-project-id")
	if err != nil {
		panic(err)
	}

	firestoreClient = client
	return firestoreClient
}
