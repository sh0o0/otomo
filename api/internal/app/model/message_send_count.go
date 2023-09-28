package model

const (
	maxMonthlySurplusSendCount = 30
	maxDailySendCount          = 5
)

type MonthlySurplusSentMessageCount struct {
	YearMonth YearMonth
	Daily     []*DailySentMessageCount
}

func NewMonthlySurplusSentMessageCount(
	yearMonth YearMonth,
	daily []*DailySentMessageCount,
) *MonthlySurplusSentMessageCount {
	return &MonthlySurplusSentMessageCount{
		YearMonth: yearMonth,
		Daily:     daily,
	}
}

func (m *MonthlySurplusSentMessageCount) IsRemaining() bool {
	return m.Count() < maxMonthlySurplusSendCount
}

func (m *MonthlySurplusSentMessageCount) Count() int {
	var exceeded int
	for _, d := range m.Daily {
		exceeded += d.CountExceeded()
	}
	return exceeded
}

func (m *MonthlySurplusSentMessageCount) CountRemaining() int {
	remaining := maxMonthlySurplusSendCount - m.Count()
	if remaining < 0 {
		return 0
	}
	return remaining
}

type DailySentMessageCount struct {
	Day   Day
	Count int
}

func NewDailySentMessageCount(day Day, count int) *DailySentMessageCount {
	return &DailySentMessageCount{
		Day:   day,
		Count: count,
	}
}

func (d *DailySentMessageCount) IsRemaining() bool {
	return d.Count < maxDailySendCount
}

func (d *DailySentMessageCount) CountRemaining() int {
	remaining := maxDailySendCount - d.Count
	if remaining < 0 {
		return 0
	}
	return remaining
}

func (d *DailySentMessageCount) CountExceeded() int {
	exceeded := d.Count - maxDailySendCount
	if exceeded < 0 {
		return 0
	}
	return exceeded
}
