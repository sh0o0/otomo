package systemtest

import "os"

var (
	_            = os.Getenv("FIRESTORE_EMULATOR_HOST")
	mapsApiKey   = os.Getenv("GOOGLE_MAPS_API_KEY")
	openaiApiKey = os.Getenv("OPENAI_API_KEY")
)
