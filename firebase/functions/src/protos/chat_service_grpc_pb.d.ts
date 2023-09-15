// GENERATED CODE -- DO NOT EDIT!

// package: 
// file: chat_service.proto

import * as chat_service_pb from "./chat_service_pb";
import * as grpc from "@grpc/grpc-js";

interface IChatServiceService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
  sendMessage: grpc.MethodDefinition<chat_service_pb.ChatService_SendMessageRequest, chat_service_pb.ChatService_SendMessageResponse>;
  listMessages: grpc.MethodDefinition<chat_service_pb.ChatService_ListMessagesRequest, chat_service_pb.ChatService_ListMessagesResponse>;
  askToMessage: grpc.MethodDefinition<chat_service_pb.ChatService_AskToMessageRequest, chat_service_pb.ChatService_AskToMessageResponse>;
}

export const ChatServiceService: IChatServiceService;

export interface IChatServiceServer extends grpc.UntypedServiceImplementation {
  sendMessage: grpc.handleUnaryCall<chat_service_pb.ChatService_SendMessageRequest, chat_service_pb.ChatService_SendMessageResponse>;
  listMessages: grpc.handleUnaryCall<chat_service_pb.ChatService_ListMessagesRequest, chat_service_pb.ChatService_ListMessagesResponse>;
  askToMessage: grpc.handleUnaryCall<chat_service_pb.ChatService_AskToMessageRequest, chat_service_pb.ChatService_AskToMessageResponse>;
}

export class ChatServiceClient extends grpc.Client {
  constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
  sendMessage(argument: chat_service_pb.ChatService_SendMessageRequest, callback: grpc.requestCallback<chat_service_pb.ChatService_SendMessageResponse>): grpc.ClientUnaryCall;
  sendMessage(argument: chat_service_pb.ChatService_SendMessageRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<chat_service_pb.ChatService_SendMessageResponse>): grpc.ClientUnaryCall;
  sendMessage(argument: chat_service_pb.ChatService_SendMessageRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<chat_service_pb.ChatService_SendMessageResponse>): grpc.ClientUnaryCall;
  listMessages(argument: chat_service_pb.ChatService_ListMessagesRequest, callback: grpc.requestCallback<chat_service_pb.ChatService_ListMessagesResponse>): grpc.ClientUnaryCall;
  listMessages(argument: chat_service_pb.ChatService_ListMessagesRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<chat_service_pb.ChatService_ListMessagesResponse>): grpc.ClientUnaryCall;
  listMessages(argument: chat_service_pb.ChatService_ListMessagesRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<chat_service_pb.ChatService_ListMessagesResponse>): grpc.ClientUnaryCall;
  askToMessage(argument: chat_service_pb.ChatService_AskToMessageRequest, callback: grpc.requestCallback<chat_service_pb.ChatService_AskToMessageResponse>): grpc.ClientUnaryCall;
  askToMessage(argument: chat_service_pb.ChatService_AskToMessageRequest, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<chat_service_pb.ChatService_AskToMessageResponse>): grpc.ClientUnaryCall;
  askToMessage(argument: chat_service_pb.ChatService_AskToMessageRequest, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<chat_service_pb.ChatService_AskToMessageResponse>): grpc.ClientUnaryCall;
}
