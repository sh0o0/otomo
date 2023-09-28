package cq

import "cloud.google.com/go/firestore"

type MessageSentCountQuery struct {
	fsClient *firestore.Client
}

func NewMessageSentCountQuery(fsClient *firestore.Client) *MessageSentCountQuery {
	return &MessageSentCountQuery{fsClient: fsClient}
}
