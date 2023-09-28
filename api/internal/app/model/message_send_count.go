package model

const (
	maxMonthlySurplusSendCount = 30
	maxDailySendCount          = 5
)

type MonthlySurplusSentCount struct {
	YearMonth YearMonth
	Daily     []*DailySentCount
}

func NewMonthlySurplusSentCount(
	yearMonth YearMonth,
	daily []*DailySentCount,
) *MonthlySurplusSentCount {
	return &MonthlySurplusSentCount{
		YearMonth: yearMonth,
		Daily:     daily,
	}
}

func (m *MonthlySurplusSentCount) IsOver() bool {
	return m.Count() >= maxMonthlySurplusSendCount
}

func (m *MonthlySurplusSentCount) Count() int {
	var exceeded int
	for _, d := range m.Daily {
		exceeded += d.CountExceeded()
	}
	return exceeded
}

func (m *MonthlySurplusSentCount) CountRemaining() int {
	remaining := maxMonthlySurplusSendCount - m.Count()
	if remaining < 0 {
		return 0
	}
	return remaining
}

type DailySentCount struct {
	Day   Day
	Count int
}

func NewDailySentCount(day Day, count int) *DailySentCount {
	return &DailySentCount{
		Day:   day,
		Count: count,
	}
}

func (d *DailySentCount) IsOver() bool {
	return d.Count >= maxDailySendCount
}

func (d *DailySentCount) CountRemaining() int {
	remaining := maxDailySendCount - d.Count
	if remaining < 0 {
		return 0
	}
	return remaining
}

func (d *DailySentCount) CountExceeded() int {
	exceeded := d.Count - maxDailySendCount
	if exceeded < 0 {
		return 0
	}
	return exceeded
}
