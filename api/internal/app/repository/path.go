package repository

import (
	"otomo/internal/app/model"
	"strings"
)

const (
	v1DocPath string = "versions/1"

	chatsColPath   string = "chats"
	messageColName string = "messages"
)

// versions/1/chats/{userID}
func getChatDocPath(userID model.UserID) string {
	return strings.Join([]string{v1DocPath, chatsColPath, string(userID)}, "/")
}

// versions/1/chats/{userID}/messages
func getChatMessagesColPath(userID model.UserID) string {
	return strings.Join([]string{getChatDocPath(userID), messageColName}, "/")
}

// versions/1/chats/{userID}/messages/{messageID}
func getChatMessageDocPath(userID model.UserID, messageID model.MessageID) string {
	return strings.Join([]string{getChatMessagesColPath(userID), string(messageID)}, "/")
}
