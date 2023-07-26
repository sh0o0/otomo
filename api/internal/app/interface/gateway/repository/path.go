package repository

import "strings"

const (
	VersionCollectionName string = "versions"
	Version1DocumentName  string = "1"

	MessageWithOtomoCollectionName string = "message_with_otomo"
)

var (
	V1DocumentPath                 string = strings.Join([]string{VersionCollectionName, Version1DocumentName}, "/")
	MessageWithOtomoCollectionPath string = strings.Join([]string{V1DocumentPath, MessageWithOtomoCollectionName}, "/")
)

func GetTripPath(id string) string {
	return strings.Join([]string{MessageWithOtomoCollectionPath, id}, "/")
}
