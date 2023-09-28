package times

import "time"

type realClock struct{}

func (*realClock) Now() time.Time        { return time.Now().UTC() }
func (*realClock) Sleep(d time.Duration) { time.Sleep(d) }
func (*realClock) Date(
	year int, month time.Month, day, hour, min, sec, nsec int) time.Time {
	return time.Date(year, month, day, hour, min, sec, nsec, Location)
}
