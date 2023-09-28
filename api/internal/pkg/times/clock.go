package times

import "time"

// This implementation references https://stackoverflow.com/questions/18970265/is-there-an-easy-way-to-stub-out-time-now-globally-during-test
var (
	C        Clock = &realClock{}
	Location       = time.UTC
)

type Clock interface {
	Now() time.Time
	Date(year int, month time.Month, day, hour, min, sec, nsec int) time.Time
	Sleep(d time.Duration)
}
