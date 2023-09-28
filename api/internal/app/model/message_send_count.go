package model

const (
	maxMonthlySurplusSendCount = 30
	maxDailySendCount          = 5
)

type MonthlySurplusMessageSentCount struct {
	YearMonth YearMonth
	Daily     []*DailyMessageSentCount
}

func NewMonthlySurplusMessageSentCount(
	yearMonth YearMonth,
	daily []*DailyMessageSentCount,
) *MonthlySurplusMessageSentCount {
	return &MonthlySurplusMessageSentCount{
		YearMonth: yearMonth,
		Daily:     daily,
	}
}

func (m *MonthlySurplusMessageSentCount) IsRemaining() bool {
	return m.Count() < maxMonthlySurplusSendCount
}

func (m *MonthlySurplusMessageSentCount) Count() int {
	var exceeded int
	for _, d := range m.Daily {
		exceeded += d.CountExceeded()
	}
	return exceeded
}

func (m *MonthlySurplusMessageSentCount) CountRemaining() int {
	remaining := maxMonthlySurplusSendCount - m.Count()
	if remaining < 0 {
		return 0
	}
	return remaining
}

type DailyMessageSentCount struct {
	Day   Day
	Count int
}

func NewDailyMessageSentCount(day Day, count int) *DailyMessageSentCount {
	return &DailyMessageSentCount{
		Day:   day,
		Count: count,
	}
}

func (d *DailyMessageSentCount) IsRemaining() bool {
	return d.Count < maxDailySendCount
}

func (d *DailyMessageSentCount) CountRemaining() int {
	remaining := maxDailySendCount - d.Count
	if remaining < 0 {
		return 0
	}
	return remaining
}

func (d *DailyMessageSentCount) CountExceeded() int {
	exceeded := d.Count - maxDailySendCount
	if exceeded < 0 {
		return 0
	}
	return exceeded
}
