//
//  Generated code. Do not modify.
//  source: health.proto
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

import 'google/protobuf/empty.pb.dart' as $0;
import 'health.pb.dart' as $1;

export 'health.pb.dart';

@$pb.GrpcServiceName('HealthService')
class HealthServiceClient extends $grpc.Client {
  static final _$check = $grpc.ClientMethod<$0.Empty, $1.HealthCheckResponse>(
      '/HealthService/Check',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.HealthCheckResponse.fromBuffer(value));

  HealthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.HealthCheckResponse> check($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$check, request, options: options);
  }
}

@$pb.GrpcServiceName('HealthService')
abstract class HealthServiceBase extends $grpc.Service {
  $core.String get $name => 'HealthService';

  HealthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.HealthCheckResponse>(
        'Check',
        check_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.HealthCheckResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.HealthCheckResponse> check_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return check(call, await request);
  }

  $async.Future<$1.HealthCheckResponse> check($grpc.ServiceCall call, $0.Empty request);
}
