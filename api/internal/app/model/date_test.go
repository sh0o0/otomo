package model

import (
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

func TestYearMonth_In(t *testing.T) {
	type fields struct {
		Year  Year
		Month Month
	}
	type args struct {
		t time.Time
	}
	tests := []struct {
		name   string
		fields fields
		args   args
		want   bool
	}{
		{
			name: "Should return true when given time is in same year and month",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2020, 1, 1, 0, 0, 0, 0, time.UTC),
			},
			want: true,
		},
		{
			name: "Should return false when given time is before the year and time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2019, 1, 1, 0, 0, 0, 0, time.UTC),
			},
			want: false,
		},
		{
			name: "Should return false when given time is after the year and time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2020, 2, 1, 0, 0, 0, 0, time.UTC),
			},
			want: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			ym := YearMonth{
				Year:  tt.fields.Year,
				Month: tt.fields.Month,
			}
			got := ym.In(tt.args.t)
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestYearMonth_After(t *testing.T) {
	type fields struct {
		Year  Year
		Month Month
	}
	type args struct {
		t time.Time
	}
	tests := []struct {
		name   string
		fields fields
		args   args
		want   bool
	}{
		{
			name: "Should return true when year month is after given time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2019, 1, 1, 0, 0, 0, 0, time.UTC),
			},
			want: true,
		},
		{
			name: "Should return false when year month is before given time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2020, 2, 1, 0, 0, 0, 0, time.UTC),
			},
			want: false,
		},
		{
			name: "Should return false when year month is same given time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2020, 1, 1, 0, 0, 0, 0, time.UTC),
			},
			want: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			ym := YearMonth{
				Year:  tt.fields.Year,
				Month: tt.fields.Month,
			}
			got := ym.After(tt.args.t)
			assert.Exactly(t, tt.want, got)
		})
	}
}

func TestYearMonth_Before(t *testing.T) {
	type fields struct {
		Year  Year
		Month Month
	}
	type args struct {
		t time.Time
	}
	tests := []struct {
		name   string
		fields fields
		args   args
		want   bool
	}{
		{
			name: "Should return true when year month is before given time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2021, 1, 1, 0, 0, 0, 0, time.UTC),
			},
			want: true,
		},
		{
			name: "Should return false when year month is after given time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2019, 2, 1, 0, 0, 0, 0, time.UTC),
			},
			want: false,
		},
		{
			name: "Should return false when year month is same given time",
			fields: fields{
				Year:  2020,
				Month: 1,
			},
			args: args{
				t: time.Date(2020, 1, 1, 0, 0, 0, 0, time.UTC),
			},
			want: false,
		},
	}
	for _, tt := range tests {
		tt := tt
		t.Run(tt.name, func(t *testing.T) {
			t.Parallel()
			ym := YearMonth{
				Year:  tt.fields.Year,
				Month: tt.fields.Month,
			}
			got := ym.Before(tt.args.t)
			assert.Exactly(t, tt.want, got)
		})
	}
}
