package model

import (
	"otomo/internal/pkg/times"
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
	t := times.C.Date(int(year), time.Month(month), 1, 0, 0, 0, 0)
	return NewYearMonthFromTime(t)
}

func NewYearMonthFromTime(t time.Time) YearMonth {
	return NewYearMonth(
		Year(t.Year()),
		Month(t.Month()),
	)
}

func (ym YearMonth) In(t time.Time) bool {
	return ym.Year == Year(t.Year()) && ym.Month == Month(t.Month())
}

func (ym YearMonth) After(t time.Time) bool {
	if ym.Year > Year(t.Year()) {
		return true
	}

	if ym.Year == Year(t.Year()) && ym.Month > Month(t.Month()) {
		return true
	}
	return false
}

func (ym YearMonth) Before(t time.Time) bool {
	if ym.Year < Year(t.Year()) {
		return true
	}

	if ym.Year == Year(t.Year()) && ym.Month < Month(t.Month()) {
		return true
	}
	return false
}
