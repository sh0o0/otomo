package repository

import "strings"

const (
	versionColName  string = "versions"
	version1DocName string = "1"

	chatColName    string = "chats"
	messageColName string = "messages"
)

var (
	//  /versions/1
	v1DocPath string = strings.Join([]string{versionColName, version1DocName}, "/")
	//  /versions/1/chats
	chatColPath string = strings.Join([]string{v1DocPath, chatColName}, "/")
)

// /versions/1/chats/{chatID}/messages
// Chat id is user id when user chat with otomo
func getMessagesColPath(chatID string) string {
	return strings.Join([]string{chatColPath, chatID, messageColName}, "/")
}

// /versions/1/chats/{chatID}/messages/{msgID}
func getMessageDocPath(chatID string, msgID string) string {
	return strings.Join([]string{getMessagesColPath(chatID), msgID}, "/")
}
