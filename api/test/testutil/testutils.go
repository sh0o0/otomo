package testutil

import (
	"otomo/pkg/times"
	"strings"
)

func JoinStrings(strs ...string) string {
	return strings.Join(strs, " ")
}

func SetMockClock() {
	times.C = &mockClock{}
}
