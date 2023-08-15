package times

import "time"

type realClock struct{}

func (*realClock) Now() time.Time        { return time.Now().UTC() }
func (*realClock) Sleep(d time.Duration) { time.Sleep(d) }
