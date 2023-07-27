//
//  Generated code. Do not modify.
//  source: chat_with_otomo_service.proto
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

import 'chat_with_otomo_service.pb.dart' as $0;

export 'chat_with_otomo_service.pb.dart';

@$pb.GrpcServiceName('ChatWithOtomoService')
class ChatWithOtomoServiceClient extends $grpc.Client {
  static final _$messageToOtomo = $grpc.ClientMethod<$0.ChatWithOtomoMessageToOtomoRequest, $0.ChatWithOtomoMessageToOtomoResponse>(
      '/ChatWithOtomoService/MessageToOtomo',
      ($0.ChatWithOtomoMessageToOtomoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatWithOtomoMessageToOtomoResponse.fromBuffer(value));

  ChatWithOtomoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ChatWithOtomoMessageToOtomoResponse> messageToOtomo($0.ChatWithOtomoMessageToOtomoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$messageToOtomo, request, options: options);
  }
}

@$pb.GrpcServiceName('ChatWithOtomoService')
abstract class ChatWithOtomoServiceBase extends $grpc.Service {
  $core.String get $name => 'ChatWithOtomoService';

  ChatWithOtomoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatWithOtomoMessageToOtomoRequest, $0.ChatWithOtomoMessageToOtomoResponse>(
        'MessageToOtomo',
        messageToOtomo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatWithOtomoMessageToOtomoRequest.fromBuffer(value),
        ($0.ChatWithOtomoMessageToOtomoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ChatWithOtomoMessageToOtomoResponse> messageToOtomo_Pre($grpc.ServiceCall call, $async.Future<$0.ChatWithOtomoMessageToOtomoRequest> request) async {
    return messageToOtomo(call, await request);
  }

  $async.Future<$0.ChatWithOtomoMessageToOtomoResponse> messageToOtomo($grpc.ServiceCall call, $0.ChatWithOtomoMessageToOtomoRequest request);
}
