package timezone

import "time"

func ChangeToUTC() {
	time.Local = time.UTC
}
