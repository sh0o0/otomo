package model

import (
	"testing"
	"time"

	"github.com/stretchr/testify/assert"

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
		// TODO: Add test cases.
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
		// TODO: Add test cases.
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
		// TODO: Add test cases.
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
