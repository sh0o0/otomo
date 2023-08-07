package testutil

import "strings"

func JoinStrings(strs ...string) string {
	return strings.Join(strs, " ")
}
