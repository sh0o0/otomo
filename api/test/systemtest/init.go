package systemtest

import "os"

var (
	_            = os.Getenv("FIRESTORE_EMULATOR_HOST")
	mapsApiKey   = os.Getenv("GOOGLE_MAPS_API_KEY")
	openaiApiKey = os.Getenv("OPENAI_API_KEY")
)

func init() {
	if err := initFirestoreClient(); err != nil {
		panic(err)
	}
	if err := initMapsClient(); err != nil {
		panic(err)
	}
	if err := initLcGpt(); err != nil {
		panic(err)
	}
	initGpt()
}
