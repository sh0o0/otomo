package controller

import (
	"context"
	"fmt"
	"otomo/internal/app/interface/controller/grpc/grpcgen"

	"github.com/tmc/langchaingo/llms"
	"github.com/tmc/langchaingo/llms/openai"
	"github.com/tmc/langchaingo/schema"
)

var _ grpcgen.ChatServiceServer = (*ChatController)(nil)

type ChatController struct{}

func NewChatController() *ChatController {
	return &ChatController{}
}

func (c *ChatController) SendMessage(
	req *grpcgen.ChatService_SendMessageRequest,
	stream grpcgen.ChatService_SendMessageServer,
) error {
	// STEP: Add a message to the repo
	// STEP: make a reply
	// STEP: response
	// STEP: Add a message to the repo

	llm, err := openai.NewChat()
	if err != nil {
		return err
	}
	completion, err := llm.Call(stream.Context(), []schema.ChatMessage{
		schema.SystemChatMessage{Content: "Hello, I am a friendly chatbot. I love to talk about movies, books and music. Answer in long form yaml."},
		schema.HumanChatMessage{Content: "What would be a good company name a company that makes colorful socks?"},
	}, llms.WithStreamingFunc(func(ctx context.Context, chunk []byte) error {
		fmt.Print(string(chunk))
		return nil
	}),
	)
	fmt.Println(completion)
	return err
}
