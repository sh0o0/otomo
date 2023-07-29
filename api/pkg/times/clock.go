package times

import "time"

// This implementation references https://stackoverflow.com/questions/18970265/is-there-an-easy-way-to-stub-out-time-now-globally-during-test
var C Clock = &realClock{}

type Clock interface {
	Now() time.Time
}
