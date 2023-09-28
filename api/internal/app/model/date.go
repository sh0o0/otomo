package model

import (
	"time"
)

type (
	Year  int32
	Month int32
	Day   int32
)

type Date struct {
	Year  Year
	Month Month
	Day   Day
}

type YearMonth struct {
	Year  Year
	Month Month
}

func NewYearMonth(year Year, month Month) YearMonth {
	return YearMonth{
		Year:  year,
		Month: month,
	}
}

func NewYearMonthFromTime(t time.Time) YearMonth {
	return NewYearMonth(
		Year(t.Year()),
		Month(t.Month()),
	)
}
