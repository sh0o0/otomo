package times

import "time"

type realClock struct{}

func (*realClock) Now() time.Time { return time.Now().UTC() }
