package testutil

import (
	"otomo/internal/pkg/times"
	"time"
)

var _ times.Clock = (*mockClock)(nil)

type mockClock struct{}

func (*mockClock) Now() time.Time        { return time.Now().UTC().Truncate(time.Microsecond * 100) }
func (*mockClock) Sleep(d time.Duration) { time.Sleep(d) }
func (*mockClock) Date(
	year int, month time.Month, day, hour, min, sec, nsec int) time.Time {
	return time.Date(year, month, day, hour, min, sec, nsec, time.UTC)
}

func SetMockClock() {
	times.C = &mockClock{}
}
