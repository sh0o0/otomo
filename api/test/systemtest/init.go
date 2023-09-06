package systemtest

func init() {
	if err := initFirestoreClient(); err != nil {
		panic(err)
	}
}
