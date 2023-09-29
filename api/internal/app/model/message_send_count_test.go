package model

import (
	"otomo/internal/pkg/times"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

func TestMonthlySurplusSentCount_IsRemaining(t *testing.T) {
	type fields struct {
		YearMonth YearMonth
		Daily     []*DailyMessageSentCount
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
				Daily: []*DailyMessageSentCount{
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
				Daily: []*DailyMessageSentCount{
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
			m := &MonthlySurplusMessageSentCount{
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
		Daily     []*DailyMessageSentCount
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
				Daily: []*DailyMessageSentCount{
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
				Daily: []*DailyMessageSentCount{
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
				Daily: []*DailyMessageSentCount{
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
			m := &MonthlySurplusMessageSentCount{
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
		Daily     []*DailyMessageSentCount
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
				Daily: []*DailyMessageSentCount{
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
				Daily: []*DailyMessageSentCount{
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
				Daily: []*DailyMessageSentCount{
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
			m := &MonthlySurplusMessageSentCount{
				YearMonth: tt.fields.YearMonth,
				Daily:     tt.fields.Daily,
			}
			got := m.CountRemaining()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestMonthlySurplusMessageSentCount_IfSent(t *testing.T) {
	type fields struct {
		YearMonth YearMonth
		Daily     []*DailyMessageSentCount
	}
	type args struct {
		sentAt time.Time
	}
	tests := []struct {
		name      string
		fields    fields
		args      args
		want      *MonthlySurplusMessageSentCount
		wantIsErr bool
	}{
		{
			name: "Should return error when sentAt is not in the month",
			fields: fields{
				YearMonth: YearMonth{Year: 2020, Month: 1},
			},
			args: args{
				sentAt: time.Date(2020, 2, 1, 0, 0, 0, 0, time.UTC),
			},
			want:      nil,
			wantIsErr: true,
		},
		{
			name: "Should return the last day incremented count when sentAt is the last day",
			fields: fields{
				YearMonth: YearMonth{Year: 2020, Month: 1},
				Daily: []*DailyMessageSentCount{
					{
						Day:   15,
						Count: 5,
					},
					{
						Day:   16,
						Count: 5,
					},
					{
						Day:   17,
						Count: 4,
					},
				},
			},
			args: args{
				sentAt: times.C.Date(2020, 1, 17, 0, 0, 0, 0),
			},
			want: &MonthlySurplusMessageSentCount{
				YearMonth: YearMonth{Year: 2020, Month: 1},
				Daily: []*DailyMessageSentCount{
					{
						Day:   15,
						Count: 5,
					},
					{
						Day:   16,
						Count: 5,
					},
					{
						Day:   17,
						Count: 5,
					},
				},
			},
			wantIsErr: false,
		},
		{
			name: "Should return the new day incremented count when sentAt is the new day",
			fields: fields{
				YearMonth: YearMonth{Year: 2020, Month: 1},
				Daily: []*DailyMessageSentCount{
					{
						Day:   15,
						Count: 5,
					},
					{
						Day:   16,
						Count: 5,
					},
				},
			},
			args: args{
				sentAt: times.C.Date(2020, 1, 17, 0, 0, 0, 0),
			},
			want: &MonthlySurplusMessageSentCount{
				YearMonth: YearMonth{Year: 2020, Month: 1},
				Daily: []*DailyMessageSentCount{
					{
						Day:   15,
						Count: 5,
					},
					{
						Day:   16,
						Count: 5,
					},
					{
						Day:   17,
						Count: 1,
					},
				},
			},
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			m := &MonthlySurplusMessageSentCount{
				YearMonth: tt.fields.YearMonth,
				Daily:     tt.fields.Daily,
			}
			got, err := m.IfSent(tt.args.sentAt)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("MonthlySurplusMessageSentCount.IfSent() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

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
			d := &DailyMessageSentCount{
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
			d := &DailyMessageSentCount{
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
			d := &DailyMessageSentCount{
				Day:   tt.fields.Day,
				Count: tt.fields.Count,
			}
			got := d.CountExceeded()
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestDailyMessageSentCountList_IndexByDay(t *testing.T) {
	type args struct {
		day Day
	}
	tests := []struct {
		name string
		list DailyMessageSentCountList
		args args
		want int
	}{
		{
			name: "Should return -1 when day is not found",
			list: DailyMessageSentCountList{
				{
					Day: 1,
				},
				{
					Day: 2,
				},
			},
			args: args{
				day: 3,
			},
			want: -1,
		},
		{
			name: "Should return index when day is found",
			list: DailyMessageSentCountList{
				{
					Day: 1,
				},
				{
					Day: 2,
				},
			},
			args: args{
				day: 2,
			},
			want: 1,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got := tt.list.IndexByDay(tt.args.day)
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestDailyMessageSentCountList_WhereByDay(t *testing.T) {
	type args struct {
		day Day
	}
	tests := []struct {
		name      string
		list      DailyMessageSentCountList
		args      args
		want      *DailyMessageSentCount
		wantIsErr bool
	}{
		{
			name: "Should return error when day is not found",
			list: DailyMessageSentCountList{
				{
					Day: 1,
				},
				{
					Day: 2,
				},
			},
			args: args{
				day: 3,
			},
			want:      nil,
			wantIsErr: true,
		},
		{
			name: "Should return count when day is found",
			list: DailyMessageSentCountList{
				{
					Day: 1,
				},
				{
					Day: 2,
				},
			},
			args: args{
				day: 2,
			},
			want: &DailyMessageSentCount{
				Day: 2,
			},
			wantIsErr: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			got, err := tt.list.WhereByDay(tt.args.day)
			if (err != nil) != tt.wantIsErr {
				t.Errorf("DailyMessageSentCountList.WhereByDay() error = %v, wantIsErr %v", err, tt.wantIsErr)
				return
			}

			assert.Exactly(t, tt.want, got)
		})
	}
}
