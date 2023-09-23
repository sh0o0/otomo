package systemtest

func init() {
	if err := initFirestoreClient(); err != nil {
		panic(err)
	}
	if err := initMapsClient(); err != nil {
		panic(err)
	}
}
