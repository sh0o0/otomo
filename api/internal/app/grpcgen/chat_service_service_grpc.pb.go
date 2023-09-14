// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.3.0
// - protoc             v4.23.4
// source: chat_service_service.proto

package grpcgen

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

const (
	ChatService_SendMessage_FullMethodName  = "/ChatService/SendMessage"
	ChatService_ListMessages_FullMethodName = "/ChatService/ListMessages"
	ChatService_AskToMessage_FullMethodName = "/ChatService/AskToMessage"
)

// ChatServiceClient is the client API for ChatService service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type ChatServiceClient interface {
	SendMessage(ctx context.Context, in *ChatService_SendMessageRequest, opts ...grpc.CallOption) (ChatService_SendMessageClient, error)
	ListMessages(ctx context.Context, in *ChatService_ListMessagesRequest, opts ...grpc.CallOption) (*ChatService_ListMessagesResponse, error)
	AskToMessage(ctx context.Context, in *ChatService_AskToMessageRequest, opts ...grpc.CallOption) (*ChatService_AskToMessageResponse, error)
}

type chatServiceClient struct {
	cc grpc.ClientConnInterface
}

func NewChatServiceClient(cc grpc.ClientConnInterface) ChatServiceClient {
	return &chatServiceClient{cc}
}

func (c *chatServiceClient) SendMessage(ctx context.Context, in *ChatService_SendMessageRequest, opts ...grpc.CallOption) (ChatService_SendMessageClient, error) {
	stream, err := c.cc.NewStream(ctx, &ChatService_ServiceDesc.Streams[0], ChatService_SendMessage_FullMethodName, opts...)
	if err != nil {
		return nil, err
	}
	x := &chatServiceSendMessageClient{stream}
	if err := x.ClientStream.SendMsg(in); err != nil {
		return nil, err
	}
	if err := x.ClientStream.CloseSend(); err != nil {
		return nil, err
	}
	return x, nil
}

type ChatService_SendMessageClient interface {
	Recv() (*ChatService_SendMessageStreamResponse, error)
	grpc.ClientStream
}

type chatServiceSendMessageClient struct {
	grpc.ClientStream
}

func (x *chatServiceSendMessageClient) Recv() (*ChatService_SendMessageStreamResponse, error) {
	m := new(ChatService_SendMessageStreamResponse)
	if err := x.ClientStream.RecvMsg(m); err != nil {
		return nil, err
	}
	return m, nil
}

func (c *chatServiceClient) ListMessages(ctx context.Context, in *ChatService_ListMessagesRequest, opts ...grpc.CallOption) (*ChatService_ListMessagesResponse, error) {
	out := new(ChatService_ListMessagesResponse)
	err := c.cc.Invoke(ctx, ChatService_ListMessages_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *chatServiceClient) AskToMessage(ctx context.Context, in *ChatService_AskToMessageRequest, opts ...grpc.CallOption) (*ChatService_AskToMessageResponse, error) {
	out := new(ChatService_AskToMessageResponse)
	err := c.cc.Invoke(ctx, ChatService_AskToMessage_FullMethodName, in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// ChatServiceServer is the server API for ChatService service.
// All implementations should embed UnimplementedChatServiceServer
// for forward compatibility
type ChatServiceServer interface {
	SendMessage(*ChatService_SendMessageRequest, ChatService_SendMessageServer) error
	ListMessages(context.Context, *ChatService_ListMessagesRequest) (*ChatService_ListMessagesResponse, error)
	AskToMessage(context.Context, *ChatService_AskToMessageRequest) (*ChatService_AskToMessageResponse, error)
}

// UnimplementedChatServiceServer should be embedded to have forward compatible implementations.
type UnimplementedChatServiceServer struct {
}

func (UnimplementedChatServiceServer) SendMessage(*ChatService_SendMessageRequest, ChatService_SendMessageServer) error {
	return status.Errorf(codes.Unimplemented, "method SendMessage not implemented")
}
func (UnimplementedChatServiceServer) ListMessages(context.Context, *ChatService_ListMessagesRequest) (*ChatService_ListMessagesResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method ListMessages not implemented")
}
func (UnimplementedChatServiceServer) AskToMessage(context.Context, *ChatService_AskToMessageRequest) (*ChatService_AskToMessageResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method AskToMessage not implemented")
}

// UnsafeChatServiceServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to ChatServiceServer will
// result in compilation errors.
type UnsafeChatServiceServer interface {
	mustEmbedUnimplementedChatServiceServer()
}

func RegisterChatServiceServer(s grpc.ServiceRegistrar, srv ChatServiceServer) {
	s.RegisterService(&ChatService_ServiceDesc, srv)
}

func _ChatService_SendMessage_Handler(srv interface{}, stream grpc.ServerStream) error {
	m := new(ChatService_SendMessageRequest)
	if err := stream.RecvMsg(m); err != nil {
		return err
	}
	return srv.(ChatServiceServer).SendMessage(m, &chatServiceSendMessageServer{stream})
}

type ChatService_SendMessageServer interface {
	Send(*ChatService_SendMessageStreamResponse) error
	grpc.ServerStream
}

type chatServiceSendMessageServer struct {
	grpc.ServerStream
}

func (x *chatServiceSendMessageServer) Send(m *ChatService_SendMessageStreamResponse) error {
	return x.ServerStream.SendMsg(m)
}

func _ChatService_ListMessages_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ChatService_ListMessagesRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChatServiceServer).ListMessages(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChatService_ListMessages_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChatServiceServer).ListMessages(ctx, req.(*ChatService_ListMessagesRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _ChatService_AskToMessage_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(ChatService_AskToMessageRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(ChatServiceServer).AskToMessage(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: ChatService_AskToMessage_FullMethodName,
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(ChatServiceServer).AskToMessage(ctx, req.(*ChatService_AskToMessageRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// ChatService_ServiceDesc is the grpc.ServiceDesc for ChatService service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var ChatService_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "ChatService",
	HandlerType: (*ChatServiceServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "ListMessages",
			Handler:    _ChatService_ListMessages_Handler,
		},
		{
			MethodName: "AskToMessage",
			Handler:    _ChatService_AskToMessage_Handler,
		},
	},
	Streams: []grpc.StreamDesc{
		{
			StreamName:    "SendMessage",
			Handler:       _ChatService_SendMessage_Handler,
			ServerStreams: true,
		},
	},
	Metadata: "chat_service_service.proto",
}
