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

    hasPlaceExtraction(): boolean;
    clearPlaceExtraction(): void;
    getPlaceExtraction(): PlaceExtraction | undefined;
    setPlaceExtraction(value?: PlaceExtraction): Message;
    getContent(): string;
    setContent(value: string): Message;
    getStructName(): string;
    setStructName(value: string): Message;

    hasPlacesStruct(): boolean;
    clearPlacesStruct(): void;
    getPlacesStruct(): PlacesStruct | undefined;
    setPlacesStruct(value?: PlacesStruct): Message;

    hasRouteStruct(): boolean;
    clearRouteStruct(): void;
    getRouteStruct(): RouteStruct | undefined;
    setRouteStruct(value?: RouteStruct): Message;

    hasPlaceDetailsStruct(): boolean;
    clearPlaceDetailsStruct(): void;
    getPlaceDetailsStruct(): PlaceDetailsStruct | undefined;
    setPlaceDetailsStruct(value?: PlaceDetailsStruct): Message;

    getStructCase(): Message.StructCase;

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
        placeExtraction?: PlaceExtraction.AsObject,
        content: string,
        structName: string,
        placesStruct?: PlacesStruct.AsObject,
        routeStruct?: RouteStruct.AsObject,
        placeDetailsStruct?: PlaceDetailsStruct.AsObject,
    }

    export enum StructCase {
        STRUCT_NOT_SET = 0,
        PLACES_STRUCT = 9,
        ROUTE_STRUCT = 10,
        PLACE_DETAILS_STRUCT = 11,
    }

}

export class PlaceExtraction extends jspb.Message { 
    clearPlacesList(): void;
    getPlacesList(): Array<ExtractedPlace>;
    setPlacesList(value: Array<ExtractedPlace>): PlaceExtraction;
    addPlaces(value?: ExtractedPlace, index?: number): ExtractedPlace;

    hasProcessedAt(): boolean;
    clearProcessedAt(): void;
    getProcessedAt(): google_protobuf_timestamp_pb.Timestamp | undefined;
    setProcessedAt(value?: google_protobuf_timestamp_pb.Timestamp): PlaceExtraction;

    hasError(): boolean;
    clearError(): void;
    getError(): google_protobuf_wrappers_pb.StringValue | undefined;
    setError(value?: google_protobuf_wrappers_pb.StringValue): PlaceExtraction;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): PlaceExtraction.AsObject;
    static toObject(includeInstance: boolean, msg: PlaceExtraction): PlaceExtraction.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: PlaceExtraction, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): PlaceExtraction;
    static deserializeBinaryFromReader(message: PlaceExtraction, reader: jspb.BinaryReader): PlaceExtraction;
}

export namespace PlaceExtraction {
    export type AsObject = {
        placesList: Array<ExtractedPlace.AsObject>,
        processedAt?: google_protobuf_timestamp_pb.Timestamp.AsObject,
        error?: google_protobuf_wrappers_pb.StringValue.AsObject,
    }
}

export class ExtractedPlace extends jspb.Message { 
    getText(): string;
    setText(value: string): ExtractedPlace;

    hasGeocodedPlace(): boolean;
    clearGeocodedPlace(): void;
    getGeocodedPlace(): GeocodedPlace | undefined;
    setGeocodedPlace(value?: GeocodedPlace): ExtractedPlace;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): ExtractedPlace.AsObject;
    static toObject(includeInstance: boolean, msg: ExtractedPlace): ExtractedPlace.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: ExtractedPlace, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): ExtractedPlace;
    static deserializeBinaryFromReader(message: ExtractedPlace, reader: jspb.BinaryReader): ExtractedPlace;
}

export namespace ExtractedPlace {
    export type AsObject = {
        text: string,
        geocodedPlace?: GeocodedPlace.AsObject,
    }
}

export class GeocodedPlace extends jspb.Message { 
    getGooglePlaceId(): string;
    setGooglePlaceId(value: string): GeocodedPlace;

    hasLatLng(): boolean;
    clearLatLng(): void;
    getLatLng(): location_pb.LatLng | undefined;
    setLatLng(value?: location_pb.LatLng): GeocodedPlace;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): GeocodedPlace.AsObject;
    static toObject(includeInstance: boolean, msg: GeocodedPlace): GeocodedPlace.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: GeocodedPlace, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): GeocodedPlace;
    static deserializeBinaryFromReader(message: GeocodedPlace, reader: jspb.BinaryReader): GeocodedPlace;
}

export namespace GeocodedPlace {
    export type AsObject = {
        googlePlaceId: string,
        latLng?: location_pb.LatLng.AsObject,
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
    getContent(): string;
    setContent(value: string): MessageChunk;
    getStructName(): string;
    setStructName(value: string): MessageChunk;
    getStruct(): string;
    setStruct(value: string): MessageChunk;

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
        content: string,
        structName: string,
        struct: string,
    }
}

export class PlacesStruct extends jspb.Message { 
    getPrologue(): string;
    setPrologue(value: string): PlacesStruct;
    getEpilogue(): string;
    setEpilogue(value: string): PlacesStruct;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): PlacesStruct.AsObject;
    static toObject(includeInstance: boolean, msg: PlacesStruct): PlacesStruct.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: PlacesStruct, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): PlacesStruct;
    static deserializeBinaryFromReader(message: PlacesStruct, reader: jspb.BinaryReader): PlacesStruct;
}

export namespace PlacesStruct {
    export type AsObject = {
        prologue: string,
        epilogue: string,
    }
}

export class RouteStruct extends jspb.Message { 
    getPrologue(): string;
    setPrologue(value: string): RouteStruct;
    getEpilogue(): string;
    setEpilogue(value: string): RouteStruct;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RouteStruct.AsObject;
    static toObject(includeInstance: boolean, msg: RouteStruct): RouteStruct.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RouteStruct, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RouteStruct;
    static deserializeBinaryFromReader(message: RouteStruct, reader: jspb.BinaryReader): RouteStruct;
}

export namespace RouteStruct {
    export type AsObject = {
        prologue: string,
        epilogue: string,
    }
}

export class PlaceDetailsStruct extends jspb.Message { 
    getPrologue(): string;
    setPrologue(value: string): PlaceDetailsStruct;
    getEpilogue(): string;
    setEpilogue(value: string): PlaceDetailsStruct;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): PlaceDetailsStruct.AsObject;
    static toObject(includeInstance: boolean, msg: PlaceDetailsStruct): PlaceDetailsStruct.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: PlaceDetailsStruct, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): PlaceDetailsStruct;
    static deserializeBinaryFromReader(message: PlaceDetailsStruct, reader: jspb.BinaryReader): PlaceDetailsStruct;
}

export namespace PlaceDetailsStruct {
    export type AsObject = {
        prologue: string,
        epilogue: string,
    }
}

export enum Role {
    UNKNOWN = 0,
    USER = 1,
    OTOMO = 2,
}
