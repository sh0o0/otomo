// package: 
// file: health.proto

/* tslint:disable */
/* eslint-disable */

import * as grpc from "grpc";
import * as health_pb from "./health_pb";
import * as google_protobuf_empty_pb from "google-protobuf/google/protobuf/empty_pb";

interface IHealthServiceService extends grpc.ServiceDefinition<grpc.UntypedServiceImplementation> {
    check: IHealthServiceService_ICheck;
}

interface IHealthServiceService_ICheck extends grpc.MethodDefinition<google_protobuf_empty_pb.Empty, health_pb.HealthCheckResponse> {
    path: "/HealthService/Check";
    requestStream: false;
    responseStream: false;
    requestSerialize: grpc.serialize<google_protobuf_empty_pb.Empty>;
    requestDeserialize: grpc.deserialize<google_protobuf_empty_pb.Empty>;
    responseSerialize: grpc.serialize<health_pb.HealthCheckResponse>;
    responseDeserialize: grpc.deserialize<health_pb.HealthCheckResponse>;
}

export const HealthServiceService: IHealthServiceService;

export interface IHealthServiceServer {
    check: grpc.handleUnaryCall<google_protobuf_empty_pb.Empty, health_pb.HealthCheckResponse>;
}

export interface IHealthServiceClient {
    check(request: google_protobuf_empty_pb.Empty, callback: (error: grpc.ServiceError | null, response: health_pb.HealthCheckResponse) => void): grpc.ClientUnaryCall;
    check(request: google_protobuf_empty_pb.Empty, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: health_pb.HealthCheckResponse) => void): grpc.ClientUnaryCall;
    check(request: google_protobuf_empty_pb.Empty, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: health_pb.HealthCheckResponse) => void): grpc.ClientUnaryCall;
}

export class HealthServiceClient extends grpc.Client implements IHealthServiceClient {
    constructor(address: string, credentials: grpc.ChannelCredentials, options?: object);
    public check(request: google_protobuf_empty_pb.Empty, callback: (error: grpc.ServiceError | null, response: health_pb.HealthCheckResponse) => void): grpc.ClientUnaryCall;
    public check(request: google_protobuf_empty_pb.Empty, metadata: grpc.Metadata, callback: (error: grpc.ServiceError | null, response: health_pb.HealthCheckResponse) => void): grpc.ClientUnaryCall;
    public check(request: google_protobuf_empty_pb.Empty, metadata: grpc.Metadata, options: Partial<grpc.CallOptions>, callback: (error: grpc.ServiceError | null, response: health_pb.HealthCheckResponse) => void): grpc.ClientUnaryCall;
}
