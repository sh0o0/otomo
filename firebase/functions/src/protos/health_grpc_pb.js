// GENERATED CODE -- DO NOT EDIT!

'use strict';
var grpc = require('@grpc/grpc-js');
var health_pb = require('./health_pb.js');
var google_protobuf_empty_pb = require('google-protobuf/google/protobuf/empty_pb.js');

function serialize_HealthCheckResponse(arg) {
  if (!(arg instanceof health_pb.HealthCheckResponse)) {
    throw new Error('Expected argument of type HealthCheckResponse');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_HealthCheckResponse(buffer_arg) {
  return health_pb.HealthCheckResponse.deserializeBinary(new Uint8Array(buffer_arg));
}

function serialize_google_protobuf_Empty(arg) {
  if (!(arg instanceof google_protobuf_empty_pb.Empty)) {
    throw new Error('Expected argument of type google.protobuf.Empty');
  }
  return Buffer.from(arg.serializeBinary());
}

function deserialize_google_protobuf_Empty(buffer_arg) {
  return google_protobuf_empty_pb.Empty.deserializeBinary(new Uint8Array(buffer_arg));
}


var HealthServiceService = exports.HealthServiceService = {
  check: {
    path: '/HealthService/Check',
    requestStream: false,
    responseStream: false,
    requestType: google_protobuf_empty_pb.Empty,
    responseType: health_pb.HealthCheckResponse,
    requestSerialize: serialize_google_protobuf_Empty,
    requestDeserialize: deserialize_google_protobuf_Empty,
    responseSerialize: serialize_HealthCheckResponse,
    responseDeserialize: deserialize_HealthCheckResponse,
  },
};

exports.HealthServiceClient = grpc.makeGenericClientConstructor(HealthServiceService);
