// package: 
// file: chat_service.proto

/* tslint:disable */
/* eslint-disable */

import * as grpc from "grpc";
import * as chat_service_pb from "./chat_service_pb";
import * as google_protobuf_wrappers_pb from "google-protobuf/google/protobuf/wrappers_pb";
import * as message_pb from "./message_pb";

interface IChatServiceService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
    sendMessage: IChatServiceService_ISendMessage;
    listMessages: IChatServiceService_IListMessages;
    askToMessage: IChatServiceService_IAskToMessage;
    messagingStream: IChatServiceService_IMessagingStream;
}

interface IChatServiceService_ISendMessage extends grpc.MethodDefinition<chat_service_pb.ChatService_SendMessageRequest, chat_service_pb.ChatService_SendMessageResponse> {
    path: "/ChatService/SendMessage";
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<chat_service_pb.ChatService_SendMessageRequest>;
    requestDeserialize: grpc.deserialize<chat_service_pb.ChatService_SendMessageRequest>;
    responseSerialize: grpc.serialize<chat_service_pb.ChatService_SendMessageResponse>;
    responseDeserialize: grpc.deserialize<chat_service_pb.ChatService_SendMessageResponse>;
}
interface IChatServiceService_IListMessages extends grpc.MethodDefinition<chat_service_pb.ChatService_ListMessagesRequest, chat_service_pb.ChatService_ListMessagesResponse> {
    path: "/ChatService/ListMessages";
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<chat_service_pb.ChatService_ListMessagesRequest>;
    requestDeserialize: grpc.deserialize<chat_service_pb.ChatService_ListMessagesRequest>;
    responseSerialize: grpc.serialize<chat_service_pb.ChatService_ListMessagesResponse>;
    responseDeserialize: grpc.deserialize<chat_service_pb.ChatService_ListMessagesResponse>;
}
interface IChatServiceService_IAskToMessage extends grpc.MethodDefinition<chat_service_pb.ChatService_AskToMessageRequest, chat_service_pb.ChatService_AskToMessageResponse> {
    path: "/ChatService/AskToMessage";
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<chat_service_pb.ChatService_AskToMessageRequest>;
    requestDeserialize: grpc.deserialize<chat_service_pb.ChatService_AskToMessageRequest>;
    responseSerialize: grpc.serialize<chat_service_pb.ChatService_AskToMessageResponse>;
    responseDeserialize: grpc.deserialize<chat_service_pb.ChatService_AskToMessageResponse>;
}
interface IChatServiceService_IMessagingStream extends grpc.MethodDefinition<chat_service_pb.ChatService_MessagingStreamRequest, chat_service_pb.ChatService_MessagingStreamResponse> {
    path: "/ChatService/MessagingStream";
    requestStream: false;
    responseStream: true;
    requestSerialize: grpc.serialize<chat_service_pb.ChatService_MessagingStreamRequest>;
    requestDeserialize: grpc.deserialize<chat_service_pb.ChatService_MessagingStreamRequest>;
    responseSerialize: grpc.serialize<chat_service_pb.ChatService_MessagingStreamResponse>;
    responseDeserialize: grpc.deserialize<chat_service_pb.ChatService_MessagingStreamResponse>;
}

export const ChatServiceService: IChatServiceService;

export interface IChatServiceServer {
    sendMessage: grpc.handleUnaryCall<chat_service_pb.ChatService_SendMessageRequest, chat_service_pb.ChatService_SendMessageResponse>;
    listMessages: grpc.handleUnaryCall<chat_service_pb.ChatService_ListMessagesRequest, chat_service_pb.ChatService_ListMessagesResponse>;
    askToMessage: grpc.handleUnaryCall<chat_service_pb.ChatService_AskToMessageRequest, chat_service_pb.ChatService_AskToMessageResponse>;
    messagingStream: grpc.handleServerStreamingCall<chat_service_pb.ChatService_MessagingStreamRequest, chat_service_pb.ChatService_MessagingStreamResponse>;
}

export interface IChatServiceClient {
    sendMessage(request: chat_service_pb.ChatService_SendMessageRequest, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_SendMessageResponse) => void): grpc.ClientUnaryCall;
    sendMessage(request: chat_service_pb.ChatService_SendMessageRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_SendMessageResponse) => void): grpc.ClientUnaryCall;
    sendMessage(request: chat_service_pb.ChatService_SendMessageRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_SendMessageResponse) => void): grpc.ClientUnaryCall;
    listMessages(request: chat_service_pb.ChatService_ListMessagesRequest, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_ListMessagesResponse) => void): grpc.ClientUnaryCall;
    listMessages(request: chat_service_pb.ChatService_ListMessagesRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_ListMessagesResponse) => void): grpc.ClientUnaryCall;
    listMessages(request: chat_service_pb.ChatService_ListMessagesRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_ListMessagesResponse) => void): grpc.ClientUnaryCall;
    askToMessage(request: chat_service_pb.ChatService_AskToMessageRequest, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_AskToMessageResponse) => void): grpc.ClientUnaryCall;
    askToMessage(request: chat_service_pb.ChatService_AskToMessageRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_AskToMessageResponse) => void): grpc.ClientUnaryCall;
    askToMessage(request: chat_service_pb.ChatService_AskToMessageRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_AskToMessageResponse) => void): grpc.ClientUnaryCall;
    messagingStream(request: chat_service_pb.ChatService_MessagingStreamRequest, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<chat_service_pb.ChatService_MessagingStreamResponse>;
    messagingStream(request: chat_service_pb.ChatService_MessagingStreamRequest, metadata?: grpc.Metadata, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<chat_service_pb.ChatService_MessagingStreamResponse>;
}

export class ChatServiceClient extends grpc.Client implements IChatServiceClient {
    constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
    public sendMessage(request: chat_service_pb.ChatService_SendMessageRequest, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_SendMessageResponse) => void): grpc.ClientUnaryCall;
    public sendMessage(request: chat_service_pb.ChatService_SendMessageRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_SendMessageResponse) => void): grpc.ClientUnaryCall;
    public sendMessage(request: chat_service_pb.ChatService_SendMessageRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_SendMessageResponse) => void): grpc.ClientUnaryCall;
    public listMessages(request: chat_service_pb.ChatService_ListMessagesRequest, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_ListMessagesResponse) => void): grpc.ClientUnaryCall;
    public listMessages(request: chat_service_pb.ChatService_ListMessagesRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_ListMessagesResponse) => void): grpc.ClientUnaryCall;
    public listMessages(request: chat_service_pb.ChatService_ListMessagesRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_ListMessagesResponse) => void): grpc.ClientUnaryCall;
    public askToMessage(request: chat_service_pb.ChatService_AskToMessageRequest, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_AskToMessageResponse) => void): grpc.ClientUnaryCall;
    public askToMessage(request: chat_service_pb.ChatService_AskToMessageRequest, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_AskToMessageResponse) => void): grpc.ClientUnaryCall;
    public askToMessage(request: chat_service_pb.ChatService_AskToMessageRequest, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: chat_service_pb.ChatService_AskToMessageResponse) => void): grpc.ClientUnaryCall;
    public messagingStream(request: chat_service_pb.ChatService_MessagingStreamRequest, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<chat_service_pb.ChatService_MessagingStreamResponse>;
    public messagingStream(request: chat_service_pb.ChatService_MessagingStreamRequest, metadata?: grpc.Metadata, options?: Partial<grpc.CallOptions>): grpc.ClientReadableStream<chat_service_pb.ChatService_MessagingStreamResponse>;
}
