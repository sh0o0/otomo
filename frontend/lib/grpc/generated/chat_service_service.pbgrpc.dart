//
//  Generated code. Do not modify.
//  source: chat_service_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat_service_service.pb.dart' as $0;

export 'chat_service_service.pb.dart';

@$pb.GrpcServiceName('ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$sendMessage = $grpc.ClientMethod<$0.ChatService_SendMessageRequest, $0.ChatService_SendMessageStreamResponse>(
      '/ChatService/SendMessage',
      ($0.ChatService_SendMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatService_SendMessageStreamResponse.fromBuffer(value));
  static final _$listMessages = $grpc.ClientMethod<$0.ChatService_ListMessagesRequest, $0.ChatService_ListMessagesResponse>(
      '/ChatService/ListMessages',
      ($0.ChatService_ListMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatService_ListMessagesResponse.fromBuffer(value));
  static final _$askToMessage = $grpc.ClientMethod<$0.ChatService_AskToMessageRequest, $0.ChatService_AskToMessageResponse>(
      '/ChatService/AskToMessage',
      ($0.ChatService_AskToMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatService_AskToMessageResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.ChatService_SendMessageStreamResponse> sendMessage($0.ChatService_SendMessageRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sendMessage, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.ChatService_ListMessagesResponse> listMessages($0.ChatService_ListMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listMessages, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatService_AskToMessageResponse> askToMessage($0.ChatService_AskToMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$askToMessage, request, options: options);
  }
}

@$pb.GrpcServiceName('ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatService_SendMessageRequest, $0.ChatService_SendMessageStreamResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ChatService_SendMessageRequest.fromBuffer(value),
        ($0.ChatService_SendMessageStreamResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatService_ListMessagesRequest, $0.ChatService_ListMessagesResponse>(
        'ListMessages',
        listMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatService_ListMessagesRequest.fromBuffer(value),
        ($0.ChatService_ListMessagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatService_AskToMessageRequest, $0.ChatService_AskToMessageResponse>(
        'AskToMessage',
        askToMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatService_AskToMessageRequest.fromBuffer(value),
        ($0.ChatService_AskToMessageResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ChatService_SendMessageStreamResponse> sendMessage_Pre($grpc.ServiceCall call, $async.Future<$0.ChatService_SendMessageRequest> request) async* {
    yield* sendMessage(call, await request);
  }

  $async.Future<$0.ChatService_ListMessagesResponse> listMessages_Pre($grpc.ServiceCall call, $async.Future<$0.ChatService_ListMessagesRequest> request) async {
    return listMessages(call, await request);
  }

  $async.Future<$0.ChatService_AskToMessageResponse> askToMessage_Pre($grpc.ServiceCall call, $async.Future<$0.ChatService_AskToMessageRequest> request) async {
    return askToMessage(call, await request);
  }

  $async.Stream<$0.ChatService_SendMessageStreamResponse> sendMessage($grpc.ServiceCall call, $0.ChatService_SendMessageRequest request);
  $async.Future<$0.ChatService_ListMessagesResponse> listMessages($grpc.ServiceCall call, $0.ChatService_ListMessagesRequest request);
  $async.Future<$0.ChatService_AskToMessageResponse> askToMessage($grpc.ServiceCall call, $0.ChatService_AskToMessageRequest request);
}
