package model

type (
	Year  int32
	Month int32
	Day   int32
)

type Date struct {
	Year  Year  `firestore:"year"`
	Month Month `firestore:"month"`
	Day   Day   `firestore:"day"`
}

type YearMonth struct {
	Year  Year  `firestore:"year"`
	Month Month `firestore:"month"`
}
