package model

type MonthlySentCount struct {
	YearMonth YearMonth `firestore:"year_month"`
	Count     int32     `firestore:"count"`
}

type DailySentCount struct {
	Date  Date  `firestore:"date"`
	Count int32 `firestore:"count"`
}

type RemainingSendCount struct {
	Monthly RemainingMonthlySendCount `firestore:"monthly"`
	Daily   RemainingDailySendCount   `firestore:"daily"`
}

type RemainingMonthlySendCount struct {
	YearMonth YearMonth `firestore:"year_month"`
	Count     int32     `firestore:"count"`
}

type RemainingDailySendCount struct {
	Date  Date  `firestore:"date"`
	Count int32 `firestore:"count"`
}
