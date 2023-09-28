// package: 
// file: message.proto

/* tslint:disable */
/* eslint-disable */

import * as jspb from "google-protobuf";
import * as google_protobuf_timestamp_pb from "google-protobuf/google/protobuf/timestamp_pb";
import * as google_protobuf_wrappers_pb from "google-protobuf/google/protobuf/wrappers_pb";
import * as date_pb from "./date_pb";
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

    hasError(): boolean;
    clearError(): void;
    getError(): google_protobuf_wrappers_pb.StringValue | undefined;
    setError(value?: google_protobuf_wrappers_pb.StringValue): LocationAnalysis;

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
        error?: google_protobuf_wrappers_pb.StringValue.AsObject,
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

export class SentCount extends jspb.Message { 

    hasMonthlySurplus(): boolean;
    clearMonthlySurplus(): void;
    getMonthlySurplus(): MonthlySurplusSentCount | undefined;
    setMonthlySurplus(value?: MonthlySurplusSentCount): SentCount;

    hasDaily(): boolean;
    clearDaily(): void;
    getDaily(): DailySentCount | undefined;
    setDaily(value?: DailySentCount): SentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): SentCount.AsObject;
    static toObject(includeInstance: boolean, msg: SentCount): SentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: SentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): SentCount;
    static deserializeBinaryFromReader(message: SentCount, reader: jspb.BinaryReader): SentCount;
}

export namespace SentCount {
    export type AsObject = {
        monthlySurplus?: MonthlySurplusSentCount.AsObject,
        daily?: DailySentCount.AsObject,
    }
}

export class MonthlySurplusSentCount extends jspb.Message { 

    hasYearMonth(): boolean;
    clearYearMonth(): void;
    getYearMonth(): date_pb.YearMonth | undefined;
    setYearMonth(value?: date_pb.YearMonth): MonthlySurplusSentCount;
    getCount(): number;
    setCount(value: number): MonthlySurplusSentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): MonthlySurplusSentCount.AsObject;
    static toObject(includeInstance: boolean, msg: MonthlySurplusSentCount): MonthlySurplusSentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: MonthlySurplusSentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): MonthlySurplusSentCount;
    static deserializeBinaryFromReader(message: MonthlySurplusSentCount, reader: jspb.BinaryReader): MonthlySurplusSentCount;
}

export namespace MonthlySurplusSentCount {
    export type AsObject = {
        yearMonth?: date_pb.YearMonth.AsObject,
        count: number,
    }
}

export class DailySentCount extends jspb.Message { 

    hasDate(): boolean;
    clearDate(): void;
    getDate(): date_pb.Date | undefined;
    setDate(value?: date_pb.Date): DailySentCount;
    getCount(): number;
    setCount(value: number): DailySentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): DailySentCount.AsObject;
    static toObject(includeInstance: boolean, msg: DailySentCount): DailySentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: DailySentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): DailySentCount;
    static deserializeBinaryFromReader(message: DailySentCount, reader: jspb.BinaryReader): DailySentCount;
}

export namespace DailySentCount {
    export type AsObject = {
        date?: date_pb.Date.AsObject,
        count: number,
    }
}

export class RemainingSendCount extends jspb.Message { 

    hasMonthlySurplus(): boolean;
    clearMonthlySurplus(): void;
    getMonthlySurplus(): RemainingMonthlySurplusSendCount | undefined;
    setMonthlySurplus(value?: RemainingMonthlySurplusSendCount): RemainingSendCount;

    hasDaily(): boolean;
    clearDaily(): void;
    getDaily(): RemainingDailySendCount | undefined;
    setDaily(value?: RemainingDailySendCount): RemainingSendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingSendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingSendCount): RemainingSendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingSendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingSendCount;
    static deserializeBinaryFromReader(message: RemainingSendCount, reader: jspb.BinaryReader): RemainingSendCount;
}

export namespace RemainingSendCount {
    export type AsObject = {
        monthlySurplus?: RemainingMonthlySurplusSendCount.AsObject,
        daily?: RemainingDailySendCount.AsObject,
    }
}

export class RemainingMonthlySurplusSendCount extends jspb.Message { 

    hasYearMonth(): boolean;
    clearYearMonth(): void;
    getYearMonth(): date_pb.YearMonth | undefined;
    setYearMonth(value?: date_pb.YearMonth): RemainingMonthlySurplusSendCount;
    getCount(): number;
    setCount(value: number): RemainingMonthlySurplusSendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingMonthlySurplusSendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingMonthlySurplusSendCount): RemainingMonthlySurplusSendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingMonthlySurplusSendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingMonthlySurplusSendCount;
    static deserializeBinaryFromReader(message: RemainingMonthlySurplusSendCount, reader: jspb.BinaryReader): RemainingMonthlySurplusSendCount;
}

export namespace RemainingMonthlySurplusSendCount {
    export type AsObject = {
        yearMonth?: date_pb.YearMonth.AsObject,
        count: number,
    }
}

export class RemainingDailySendCount extends jspb.Message { 

    hasDate(): boolean;
    clearDate(): void;
    getDate(): date_pb.Date | undefined;
    setDate(value?: date_pb.Date): RemainingDailySendCount;
    getCount(): number;
    setCount(value: number): RemainingDailySendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingDailySendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingDailySendCount): RemainingDailySendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingDailySendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingDailySendCount;
    static deserializeBinaryFromReader(message: RemainingDailySendCount, reader: jspb.BinaryReader): RemainingDailySendCount;
}

export namespace RemainingDailySendCount {
    export type AsObject = {
        date?: date_pb.Date.AsObject,
        count: number,
    }
}

export enum Role {
    UNKNOWN = 0,
    USER = 1,
    OTOMO = 2,
}
