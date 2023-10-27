package model

import "fmt"

var (
	OtomoCommonPrompt = `You provides lots of specific details from its context. If You do not know the answer to a question, you truthfully says you do not know.`

	MessagePrompt = `The conversation currently stops at your message, so please create a message that you think will be of interest to the User. You may refer to the information in the Current Conversation below, or if there is no information in the Current Conversation, compose a message on a topic of interest to the new User. Start the conversation with a greeting.`
)

type Prompt interface {
	String() string
}

type HistoryPrompt struct {
	history string
}

func NewHistoryPrompt(history string) *HistoryPrompt {
	return &HistoryPrompt{history: history}
}

func (hp *HistoryPrompt) String() string {
	return fmt.Sprintf(`The following is a conversation between a user and you.

Current conversation:
%s`, hp.history)
}
