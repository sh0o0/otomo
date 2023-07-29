package testutil

import (
	"otomo/pkg/times"
	"time"
)

var _ times.Clock = (*mockClock)(nil)

type mockClock struct{}

func (*mockClock) Now() time.Time { return time.Now().UTC() }
