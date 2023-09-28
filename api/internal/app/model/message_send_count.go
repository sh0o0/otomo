package model

type MonthlySentCount struct {
	YearMonth YearMonth
	Count     int32
}

type DailySentCount struct {
	Date  Date
	Count int32
}

type RemainingSendCount struct {
	Monthly RemainingMonthlySendCount
	Daily   RemainingDailySendCount
}

type RemainingMonthlySendCount struct {
	YearMonth YearMonth
	Count     int32
}

type RemainingDailySendCount struct {
	Date  Date
	Count int32
}
