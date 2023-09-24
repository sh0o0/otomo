// package: 
// file: message.proto

/* tslint:disable */
/* eslint-disable */

import * as jspb from "google-protobuf";
import * as google_protobuf_timestamp_pb from "google-protobuf/google/protobuf/timestamp_pb";
import * as google_protobuf_wrappers_pb from "google-protobuf/google/protobuf/wrappers_pb";
import * as location_pb from "./location_pb";

export class Message extends jspb.Message { 
    getId(): string;
    setId(value: string): Message;
    getText(): string;
    setText(value: string): Message;
    getRole(): Role;
    setRole(value: Role): Message;

    hasSentAt(): boolean;
    clearSentAt(): void;
    getSentAt(): google_protobuf_timestamp_pb.Timestamp | undefined;
    setSentAt(value?: google_protobuf_timestamp_pb.Timestamp): Message;

    hasClientId(): boolean;
    clearClientId(): void;
    getClientId(): google_protobuf_wrappers_pb.StringValue | undefined;
    setClientId(value?: google_protobuf_wrappers_pb.StringValue): Message;

    hasLocationAnalysis(): boolean;
    clearLocationAnalysis(): void;
    getLocationAnalysis(): LocationAnalysis | undefined;
    setLocationAnalysis(value?: LocationAnalysis): Message;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): Message.AsObject;
    static toObject(includeInstance: boolean, msg: Message): Message.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: Message, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): Message;
    static deserializeBinaryFromReader(message: Message, reader: jspb.BinaryReader): Message;
}

export namespace Message {
    export type AsObject = {
        id: string,
        text: string,
        role: Role,
        sentAt?: google_protobuf_timestamp_pb.Timestamp.AsObject,
        clientId?: google_protobuf_wrappers_pb.StringValue.AsObject,
        locationAnalysis?: LocationAnalysis.AsObject,
    }
}

export class MessageChunk extends jspb.Message { 
    getMessageId(): string;
    setMessageId(value: string): MessageChunk;
    getText(): string;
    setText(value: string): MessageChunk;
    getRole(): Role;
    setRole(value: Role): MessageChunk;

    hasSentAt(): boolean;
    clearSentAt(): void;
    getSentAt(): google_protobuf_timestamp_pb.Timestamp | undefined;
    setSentAt(value?: google_protobuf_timestamp_pb.Timestamp): MessageChunk;

    hasClientId(): boolean;
    clearClientId(): void;
    getClientId(): google_protobuf_wrappers_pb.StringValue | undefined;
    setClientId(value?: google_protobuf_wrappers_pb.StringValue): MessageChunk;
    getIsLast(): boolean;
    setIsLast(value: boolean): MessageChunk;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): MessageChunk.AsObject;
    static toObject(includeInstance: boolean, msg: MessageChunk): MessageChunk.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: MessageChunk, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): MessageChunk;
    static deserializeBinaryFromReader(message: MessageChunk, reader: jspb.BinaryReader): MessageChunk;
}

export namespace MessageChunk {
    export type AsObject = {
        messageId: string,
        text: string,
        role: Role,
        sentAt?: google_protobuf_timestamp_pb.Timestamp.AsObject,
        clientId?: google_protobuf_wrappers_pb.StringValue.AsObject,
        isLast: boolean,
    }
}

export class LocationAnalysis extends jspb.Message { 
    clearLocationsList(): void;
    getLocationsList(): Array<AnalyzedLocation>;
    setLocationsList(value: Array<AnalyzedLocation>): LocationAnalysis;
    addLocations(value?: AnalyzedLocation, index?: number): AnalyzedLocation;

    hasAnalyzedAt(): boolean;
    clearAnalyzedAt(): void;
    getAnalyzedAt(): google_protobuf_timestamp_pb.Timestamp | undefined;
    setAnalyzedAt(value?: google_protobuf_timestamp_pb.Timestamp): LocationAnalysis;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): LocationAnalysis.AsObject;
    static toObject(includeInstance: boolean, msg: LocationAnalysis): LocationAnalysis.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: LocationAnalysis, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): LocationAnalysis;
    static deserializeBinaryFromReader(message: LocationAnalysis, reader: jspb.BinaryReader): LocationAnalysis;
}

export namespace LocationAnalysis {
    export type AsObject = {
        locationsList: Array<AnalyzedLocation.AsObject>,
        analyzedAt?: google_protobuf_timestamp_pb.Timestamp.AsObject,
    }
}

export class AnalyzedLocation extends jspb.Message { 
    getText(): string;
    setText(value: string): AnalyzedLocation;

    hasLocation(): boolean;
    clearLocation(): void;
    getLocation(): location_pb.Location | undefined;
    setLocation(value?: location_pb.Location): AnalyzedLocation;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): AnalyzedLocation.AsObject;
    static toObject(includeInstance: boolean, msg: AnalyzedLocation): AnalyzedLocation.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: AnalyzedLocation, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): AnalyzedLocation;
    static deserializeBinaryFromReader(message: AnalyzedLocation, reader: jspb.BinaryReader): AnalyzedLocation;
}

export namespace AnalyzedLocation {
    export type AsObject = {
        text: string,
        location?: location_pb.Location.AsObject,
    }
}

export enum Role {
    UNKNOWN = 0,
    USER = 1,
    OTOMO = 2,
}
