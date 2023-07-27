//
//  Generated code. Do not modify.
//  source: message_with_otomo_service.proto
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

import 'message_with_otomo_service.pb.dart' as $2;

export 'message_with_otomo_service.pb.dart';

@$pb.GrpcServiceName('MessageWithOtomoService')
class MessageWithOtomoServiceClient extends $grpc.Client {
  static final _$messageToOtomo = $grpc.ClientMethod<$2.MessageWithOtomoMessageToOtomoRequest, $2.MessageWithOtomoMessageToOtomoResponse>(
      '/MessageWithOtomoService/MessageToOtomo',
      ($2.MessageWithOtomoMessageToOtomoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.MessageWithOtomoMessageToOtomoResponse.fromBuffer(value));

  MessageWithOtomoServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.MessageWithOtomoMessageToOtomoResponse> messageToOtomo($2.MessageWithOtomoMessageToOtomoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$messageToOtomo, request, options: options);
  }
}

@$pb.GrpcServiceName('MessageWithOtomoService')
abstract class MessageWithOtomoServiceBase extends $grpc.Service {
  $core.String get $name => 'MessageWithOtomoService';

  MessageWithOtomoServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.MessageWithOtomoMessageToOtomoRequest, $2.MessageWithOtomoMessageToOtomoResponse>(
        'MessageToOtomo',
        messageToOtomo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.MessageWithOtomoMessageToOtomoRequest.fromBuffer(value),
        ($2.MessageWithOtomoMessageToOtomoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.MessageWithOtomoMessageToOtomoResponse> messageToOtomo_Pre($grpc.ServiceCall call, $async.Future<$2.MessageWithOtomoMessageToOtomoRequest> request) async {
    return messageToOtomo(call, await request);
  }

  $async.Future<$2.MessageWithOtomoMessageToOtomoResponse> messageToOtomo($grpc.ServiceCall call, $2.MessageWithOtomoMessageToOtomoRequest request);
}
