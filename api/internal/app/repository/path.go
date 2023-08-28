package repository

import "strings"

const (
	versionColName  string = "versions"
	version1DocName string = "1"

	userColName    string = "users"
	messageColName string = "messages"
)

var (
	//  /versions/1
	v1DocPath string = strings.Join([]string{versionColName, version1DocName}, "/")
	//  /versions/1/users
	userColPath string = strings.Join([]string{v1DocPath, userColName}, "/")
)

// TODO: Add tests
func getUserDocPath(userID string) string {
	return strings.Join([]string{userColPath, userID}, "/")
}

// /versions/1/users/{userID}/messages
func getMessagesColPath(userID string) string {
	return strings.Join([]string{userColPath, userID, messageColName}, "/")
}

// /versions/1/users/{userID}/messages/{msgID}
func getMessageDocPath(userID string, msgID string) string {
	return strings.Join([]string{getMessagesColPath(userID), msgID}, "/")
}
