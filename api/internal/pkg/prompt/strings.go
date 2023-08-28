package prompt

import "strings"

func JoinWithNewLine(ss ...string) string {
	return strings.Join(ss, "\n")
}
