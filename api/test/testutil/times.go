package testutil

import (
	"otomo/internal/pkg/times"
	"time"
)

var _ times.Clock = (*mockClock)(nil)

type mockClock struct{}

func (*mockClock) Now() time.Time        { return time.Now().UTC().Truncate(time.Microsecond * 100) }
func (*mockClock) Sleep(d time.Duration) { time.Sleep(d) }

func SetMockClock() {
	times.C = &mockClock{}
}
