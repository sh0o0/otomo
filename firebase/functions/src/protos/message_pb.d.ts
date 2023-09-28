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

export class MonthlySentCount extends jspb.Message { 

    hasYearMonth(): boolean;
    clearYearMonth(): void;
    getYearMonth(): date_pb.YearMonth | undefined;
    setYearMonth(value?: date_pb.YearMonth): MonthlySentCount;
    getCount(): number;
    setCount(value: number): MonthlySentCount;
    clearDailySentCountList(): void;
    getDailySentCountList(): Array<DailySentCount>;
    setDailySentCountList(value: Array<DailySentCount>): MonthlySentCount;
    addDailySentCount(value?: DailySentCount, index?: number): DailySentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): MonthlySentCount.AsObject;
    static toObject(includeInstance: boolean, msg: MonthlySentCount): MonthlySentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: MonthlySentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): MonthlySentCount;
    static deserializeBinaryFromReader(message: MonthlySentCount, reader: jspb.BinaryReader): MonthlySentCount;
}

export namespace MonthlySentCount {
    export type AsObject = {
        yearMonth?: date_pb.YearMonth.AsObject,
        count: number,
        dailySentCountList: Array<DailySentCount.AsObject>,
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

    hasMonthly(): boolean;
    clearMonthly(): void;
    getMonthly(): RemainingMonthlySendCount | undefined;
    setMonthly(value?: RemainingMonthlySendCount): RemainingSendCount;

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
        monthly?: RemainingMonthlySendCount.AsObject,
        daily?: RemainingDailySendCount.AsObject,
    }
}

export class RemainingMonthlySendCount extends jspb.Message { 

    hasYearMonth(): boolean;
    clearYearMonth(): void;
    getYearMonth(): date_pb.YearMonth | undefined;
    setYearMonth(value?: date_pb.YearMonth): RemainingMonthlySendCount;
    getCount(): number;
    setCount(value: number): RemainingMonthlySendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingMonthlySendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingMonthlySendCount): RemainingMonthlySendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingMonthlySendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingMonthlySendCount;
    static deserializeBinaryFromReader(message: RemainingMonthlySendCount, reader: jspb.BinaryReader): RemainingMonthlySendCount;
}

export namespace RemainingMonthlySendCount {
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
