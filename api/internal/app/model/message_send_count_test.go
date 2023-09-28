package model

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestMonthlySurplusSentCount_IsRemaining(t *testing.T) {
	type fields struct {
		YearMonth YearMonth
		Daily     []*DailySentMessageCount
	}
	tests := []struct {
		name   string
		fields fields
		want   bool
	}{
		{
			name: "Should return false when one day count is 35",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 35,
					},
				},
			},
			want: false,
		},
		{
			name: "Should return true when one day count is 34",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 34,
					},
				},
			},
			want: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			m := &MonthlySurplusSentMessageCount{
				YearMonth: tt.fields.YearMonth,
				Daily:     tt.fields.Daily,
			}
			got := m.IsRemaining()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestMonthlySurplusSentCount_Count(t *testing.T) {
	type fields struct {
		YearMonth YearMonth
		Daily     []*DailySentMessageCount
	}
	tests := []struct {
		name   string
		fields fields
		want   int
	}{
		{
			name: "Should return 1 when one day count is 6",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 6,
					},
					{
						Count: 2,
					},
					{
						Count: 3,
					},
				},
			},
			want: 1,
		},
		{
			name: "Should return 2 when two day count is 6",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 6,
					},
					{
						Count: 6,
					},
					{
						Count: 3,
					},
				},
			},
			want: 2,
		},
		{
			name: "Should return 0 when no day count is exceeded",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 5,
					},
					{
						Count: 2,
					},
					{
						Count: 3,
					},
				},
			},
			want: 0,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			m := &MonthlySurplusSentMessageCount{
				YearMonth: tt.fields.YearMonth,
				Daily:     tt.fields.Daily,
			}
			got := m.Count()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestMonthlySurplusSentCount_CountRemaining(t *testing.T) {
	type fields struct {
		YearMonth YearMonth
		Daily     []*DailySentMessageCount
	}
	tests := []struct {
		name   string
		fields fields
		want   int
	}{
		{
			name: "Should return 0 when one day count is 35",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 35,
					},
				},
			},
			want: 0,
		},
		{
			name: "Should return 1 when one day count is 34",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 34,
					},
				},
			},
			want: 1,
		},
		{
			name: "Should return 30 when days count is 5",
			fields: fields{
				YearMonth: YearMonth{},
				Daily: []*DailySentMessageCount{
					{
						Count: 5,
					},
					{
						Count: 5,
					},
					{
						Count: 5,
					},
				},
			},
			want: 30,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			m := &MonthlySurplusSentMessageCount{
				YearMonth: tt.fields.YearMonth,
				Daily:     tt.fields.Daily,
			}
			got := m.CountRemaining()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestDailySentCount_IsRemaining(t *testing.T) {
	type fields struct {
		Day   Day
		Count int
	}
	tests := []struct {
		name   string
		fields fields
		want   bool
	}{
		{
			name: "Should return false when count is not remaining",
			fields: fields{
				Day:   1,
				Count: 5,
			},
			want: false,
		},
		{
			name: "Should return true when count is remaining",
			fields: fields{
				Day:   1,
				Count: 4,
			},
			want: true,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			d := &DailySentMessageCount{
				Day:   tt.fields.Day,
				Count: tt.fields.Count,
			}
			got := d.IsRemaining()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestDailySentCount_CountRemaining(t *testing.T) {
	type fields struct {
		Day   Day
		Count int
	}
	tests := []struct {
		name   string
		fields fields
		want   int
	}{
		{
			name: "Should return 0 when count is 6",
			fields: fields{
				Day:   1,
				Count: 6,
			},
			want: 0,
		},
		{
			name: "Should return 0 when count is 5",
			fields: fields{
				Day:   1,
				Count: 5,
			},
			want: 0,
		},
		{
			name: "Should return 1 when count is 4",
			fields: fields{
				Day:   1,
				Count: 4,
			},
			want: 1,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			d := &DailySentMessageCount{
				Day:   tt.fields.Day,
				Count: tt.fields.Count,
			}
			got := d.CountRemaining()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestDailySentCount_CountExceeded(t *testing.T) {
	type fields struct {
		Day   Day
		Count int
	}
	tests := []struct {
		name   string
		fields fields
		want   int
	}{
		{
			name: "Should return 1 when count is 6",
			fields: fields{
				Day:   1,
				Count: 6,
			},
			want: 1,
		},
		{
			name: "Should return 0 when count is 5",
			fields: fields{
				Day:   1,
				Count: 5,
			},
			want: 0,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			d := &DailySentMessageCount{
				Day:   tt.fields.Day,
				Count: tt.fields.Count,
			}
			got := d.CountExceeded()
			assert.Exactly(t, tt.want, got)
		})
	}
}
