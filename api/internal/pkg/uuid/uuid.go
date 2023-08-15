package uuid

import guuid "github.com/google/uuid"

func NewString() string {
	return guuid.NewString()
}
