package model

type Chat struct {
	Summary string `firestore:"summary"`
}

type ChatFactory struct{}

func NewChatFactory() *ChatFactory {
	return &ChatFactory{}
}

func (*ChatFactory) NewChat(
	summary string,
) (*Chat, error) {
	return &Chat{
		Summary: summary,
	}, nil
}
