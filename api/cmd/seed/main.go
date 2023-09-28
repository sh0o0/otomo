package main

import (
	"context"
	"fmt"
	"os"
	"otomo/internal/app/model"
	"otomo/internal/app/repository"
	"otomo/internal/pkg/times"
	"otomo/test/testmodel"
	"time"

	"cloud.google.com/go/firestore"
)

var (
	// # Config
	userID                = os.Getenv("USER_ID")
	firebaseProjectID     = os.Getenv("FIREBASE_PROJECT_ID")
	firestoreEmulatorHost = os.Getenv("FIRESTORE_EMULATOR_HOST")
)

func main() {
	fmt.Printf(
		"UserID: %s\nFirebaseProjectID: %s\nFirestoreEmulatorHost: %s\n",
		userID,
		firebaseProjectID,
		firestoreEmulatorHost,
	)
	fmt.Println("Seeding...")
	var (
		ctx          = context.Background()
		messageSeeds = func() []*model.Message {
			var (
				count   = 60
				results = make([]*model.Message, count)
			)

			for i := 0; i < count; i++ {
				msg := testmodel.DefaultMessageFactory.Times(
					times.C.Now().Add(-time.Hour * time.Duration(i)),
				)
				results[i] = msg
			}
			return results
		}()
	)
	fs, err := firestore.NewClient(ctx, firebaseProjectID)
	if err != nil {
		panic(err)
	}

	messageRepo := repository.NewMessageRepository(fs)

	for _, msg := range messageSeeds {
		fmt.Println(msg.ID)
		if err := messageRepo.Add(ctx, model.UserID(userID), msg); err != nil {
			panic(err)
		}
	}
	fmt.Println("Done!")
}
