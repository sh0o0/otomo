package model

type MonthlySentCount struct {
	YearMonth YearMonth `firestore:"year_month"`
	Count     int32     `firestore:"count"`
}

type DailySentCount struct {
	Date  Date  `firestore:"date"`
	Count int32 `firestore:"count"`
}

type RemindingSendCount struct {
	Monthly RemindingMonthlySendCount `firestore:"monthly"`
	Daily   RemindingDailySendCount   `firestore:"daily"`
}

type RemindingMonthlySendCount struct {
	YearMonth YearMonth `firestore:"year_month"`
	Count     int32     `firestore:"count"`
}

type RemindingDailySendCount struct {
	Date  Date  `firestore:"date"`
	Count int32 `firestore:"count"`
}
