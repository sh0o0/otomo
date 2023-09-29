package repository

import (
	"otomo/internal/app/model"
	"strings"
)

const (
	v1DocPath string = "versions/1"

	otomoColPath   string = "otomos"
	chatsColPath   string = "chats"
	messageColName string = "messages"
)

// versions/1/otomos/{userID}
func GetOtomoDocPath(userID model.UserID) string {
	return strings.Join([]string{v1DocPath, otomoColPath, string(userID)}, "/")
}

// versions/1/chats/{userID}/messages
func GetMessagesColPath(userID model.UserID) string {
	return strings.Join([]string{v1DocPath, chatsColPath, string(userID), messageColName}, "/")
}

// versions/1/chats/{userID}/messages/{messageID}
func GetMessageDocPath(userID model.UserID, messageID model.MessageID) string {
	return strings.Join([]string{GetMessagesColPath(userID), string(messageID)}, "/")
}
