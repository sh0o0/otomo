// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('grpc');
var chat_service_pb = require('./chat_service_pb.js');
var google_protobuf_wrappers_pb = require('google-protobuf/google/protobuf/wrappers_pb.js');
var message_pb = require('./message_pb.js');

function serialize_ChatService_AskToMessageRequest(arg) {
  if (!(arg instanceof chat_service_pb.ChatService_AskToMessageRequest)) {
    throw new Error('Expected argument of type ChatService_AskToMessageRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_ChatService_AskToMessageRequest(buffer_arg) {
  return chat_service_pb.ChatService_AskToMessageRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_ChatService_AskToMessageResponse(arg) {
  if (!(arg instanceof chat_service_pb.ChatService_AskToMessageResponse)) {
    throw new Error('Expected argument of type ChatService_AskToMessageResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_ChatService_AskToMessageResponse(buffer_arg) {
  return chat_service_pb.ChatService_AskToMessageResponse.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_ChatService_ListMessagesRequest(arg) {
  if (!(arg instanceof chat_service_pb.ChatService_ListMessagesRequest)) {
    throw new Error('Expected argument of type ChatService_ListMessagesRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_ChatService_ListMessagesRequest(buffer_arg) {
  return chat_service_pb.ChatService_ListMessagesRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_ChatService_ListMessagesResponse(arg) {
  if (!(arg instanceof chat_service_pb.ChatService_ListMessagesResponse)) {
    throw new Error('Expected argument of type ChatService_ListMessagesResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_ChatService_ListMessagesResponse(buffer_arg) {
  return chat_service_pb.ChatService_ListMessagesResponse.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_ChatService_SendMessageRequest(arg) {
  if (!(arg instanceof chat_service_pb.ChatService_SendMessageRequest)) {
    throw new Error('Expected argument of type ChatService_SendMessageRequest');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_ChatService_SendMessageRequest(buffer_arg) {
  return chat_service_pb.ChatService_SendMessageRequest.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_ChatService_SendMessageResponse(arg) {
  if (!(arg instanceof chat_service_pb.ChatService_SendMessageResponse)) {
    throw new Error('Expected argument of type ChatService_SendMessageResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_ChatService_SendMessageResponse(buffer_arg) {
  return chat_service_pb.ChatService_SendMessageResponse.deserializeBinary(new Uint8Array(buffer_arg));
}


var ChatServiceService = exports.ChatServiceService = {
  sendMessage: {
    path: '/ChatService/SendMessage',
    requestStream: false,
    responseStream: false,
    requestType: chat_service_pb.ChatService_SendMessageRequest,
    responseType: chat_service_pb.ChatService_SendMessageResponse,
    requestSerialize: serialize_ChatService_SendMessageRequest,
    requestDeserialize: deserialize_ChatService_SendMessageRequest,
    responseSerialize: serialize_ChatService_SendMessageResponse,
    responseDeserialize: deserialize_ChatService_SendMessageResponse,
  },
  listMessages: {
    path: '/ChatService/ListMessages',
    requestStream: false,
    responseStream: false,
    requestType: chat_service_pb.ChatService_ListMessagesRequest,
    responseType: chat_service_pb.ChatService_ListMessagesResponse,
    requestSerialize: serialize_ChatService_ListMessagesRequest,
    requestDeserialize: deserialize_ChatService_ListMessagesRequest,
    responseSerialize: serialize_ChatService_ListMessagesResponse,
    responseDeserialize: deserialize_ChatService_ListMessagesResponse,
  },
  askToMessage: {
    path: '/ChatService/AskToMessage',
    requestStream: false,
    responseStream: false,
    requestType: chat_service_pb.ChatService_AskToMessageRequest,
    responseType: chat_service_pb.ChatService_AskToMessageResponse,
    requestSerialize: serialize_ChatService_AskToMessageRequest,
    requestDeserialize: deserialize_ChatService_AskToMessageRequest,
    responseSerialize: serialize_ChatService_AskToMessageResponse,
    responseDeserialize: deserialize_ChatService_AskToMessageResponse,
  },
};

exports.ChatServiceClient = grpc.makeGenericClientConstructor(ChatServiceService);
