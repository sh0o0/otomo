// GENERATED CODE -- DO NOT EDIT!

// package: 
// file: health.proto

import * as health_pb from "./health_pb";
import * as google_protobuf_empty_pb from "google-protobuf/google/protobuf/empty_pb";
import * as grpc from "@grpc/grpc-js";

interface IHealthServiceService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
  check: grpc.MethodDefinition<google_protobuf_empty_pb.Empty, health_pb.HealthCheckResponse>;
}

export const HealthServiceService: IHealthServiceService;

export interface IHealthServiceServer extends grpc.UntypedServiceImplementation {
  check: grpc.handleUnaryCall<google_protobuf_empty_pb.Empty, health_pb.HealthCheckResponse>;
}

export class HealthServiceClient extends grpc.Client {
  constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
  check(argument: google_protobuf_empty_pb.Empty, callback: grpc.requestCallback<health_pb.HealthCheckResponse>): grpc.ClientUnaryCall;
  check(argument: google_protobuf_empty_pb.Empty, metadataOrOptions: grpc.Metadata | grpc.CallOptions | null, callback: grpc.requestCallback<health_pb.HealthCheckResponse>): grpc.ClientUnaryCall;
  check(argument: google_protobuf_empty_pb.Empty, metadata: grpc.Metadata | null, options: grpc.CallOptions | null, callback: grpc.requestCallback<health_pb.HealthCheckResponse>): grpc.ClientUnaryCall;
}
