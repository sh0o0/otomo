// package: 
// file: message_send_count.proto

/* tslint:disable */
/* eslint-disable */

import * as jspb from "google-protobuf";
import * as date_pb from "./date_pb";

export class MessageSentCount extends jspb.Message { 

    hasMonthlySurplus(): boolean;
    clearMonthlySurplus(): void;
    getMonthlySurplus(): MonthlySurplusMessageSentCount | undefined;
    setMonthlySurplus(value?: MonthlySurplusMessageSentCount): MessageSentCount;

    hasDaily(): boolean;
    clearDaily(): void;
    getDaily(): DailyMessageSentCount | undefined;
    setDaily(value?: DailyMessageSentCount): MessageSentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): MessageSentCount.AsObject;
    static toObject(includeInstance: boolean, msg: MessageSentCount): MessageSentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: MessageSentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): MessageSentCount;
    static deserializeBinaryFromReader(message: MessageSentCount, reader: jspb.BinaryReader): MessageSentCount;
}

export namespace MessageSentCount {
    export type AsObject = {
        monthlySurplus?: MonthlySurplusMessageSentCount.AsObject,
        daily?: DailyMessageSentCount.AsObject,
    }
}

export class MonthlySurplusMessageSentCount extends jspb.Message { 

    hasYearMonth(): boolean;
    clearYearMonth(): void;
    getYearMonth(): date_pb.YearMonth | undefined;
    setYearMonth(value?: date_pb.YearMonth): MonthlySurplusMessageSentCount;
    getCount(): number;
    setCount(value: number): MonthlySurplusMessageSentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): MonthlySurplusMessageSentCount.AsObject;
    static toObject(includeInstance: boolean, msg: MonthlySurplusMessageSentCount): MonthlySurplusMessageSentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: MonthlySurplusMessageSentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): MonthlySurplusMessageSentCount;
    static deserializeBinaryFromReader(message: MonthlySurplusMessageSentCount, reader: jspb.BinaryReader): MonthlySurplusMessageSentCount;
}

export namespace MonthlySurplusMessageSentCount {
    export type AsObject = {
        yearMonth?: date_pb.YearMonth.AsObject,
        count: number,
    }
}

export class DailyMessageSentCount extends jspb.Message { 

    hasDate(): boolean;
    clearDate(): void;
    getDate(): date_pb.Date | undefined;
    setDate(value?: date_pb.Date): DailyMessageSentCount;
    getCount(): number;
    setCount(value: number): DailyMessageSentCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): DailyMessageSentCount.AsObject;
    static toObject(includeInstance: boolean, msg: DailyMessageSentCount): DailyMessageSentCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: DailyMessageSentCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): DailyMessageSentCount;
    static deserializeBinaryFromReader(message: DailyMessageSentCount, reader: jspb.BinaryReader): DailyMessageSentCount;
}

export namespace DailyMessageSentCount {
    export type AsObject = {
        date?: date_pb.Date.AsObject,
        count: number,
    }
}

export class RemainingMessageSendCount extends jspb.Message { 

    hasMonthlySurplus(): boolean;
    clearMonthlySurplus(): void;
    getMonthlySurplus(): RemainingMonthlySurplusMessageSendCount | undefined;
    setMonthlySurplus(value?: RemainingMonthlySurplusMessageSendCount): RemainingMessageSendCount;

    hasDaily(): boolean;
    clearDaily(): void;
    getDaily(): RemainingDailyMessageSendCount | undefined;
    setDaily(value?: RemainingDailyMessageSendCount): RemainingMessageSendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingMessageSendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingMessageSendCount): RemainingMessageSendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingMessageSendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingMessageSendCount;
    static deserializeBinaryFromReader(message: RemainingMessageSendCount, reader: jspb.BinaryReader): RemainingMessageSendCount;
}

export namespace RemainingMessageSendCount {
    export type AsObject = {
        monthlySurplus?: RemainingMonthlySurplusMessageSendCount.AsObject,
        daily?: RemainingDailyMessageSendCount.AsObject,
    }
}

export class RemainingMonthlySurplusMessageSendCount extends jspb.Message { 

    hasYearMonth(): boolean;
    clearYearMonth(): void;
    getYearMonth(): date_pb.YearMonth | undefined;
    setYearMonth(value?: date_pb.YearMonth): RemainingMonthlySurplusMessageSendCount;
    getCount(): number;
    setCount(value: number): RemainingMonthlySurplusMessageSendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingMonthlySurplusMessageSendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingMonthlySurplusMessageSendCount): RemainingMonthlySurplusMessageSendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingMonthlySurplusMessageSendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingMonthlySurplusMessageSendCount;
    static deserializeBinaryFromReader(message: RemainingMonthlySurplusMessageSendCount, reader: jspb.BinaryReader): RemainingMonthlySurplusMessageSendCount;
}

export namespace RemainingMonthlySurplusMessageSendCount {
    export type AsObject = {
        yearMonth?: date_pb.YearMonth.AsObject,
        count: number,
    }
}

export class RemainingDailyMessageSendCount extends jspb.Message { 

    hasDate(): boolean;
    clearDate(): void;
    getDate(): date_pb.Date | undefined;
    setDate(value?: date_pb.Date): RemainingDailyMessageSendCount;
    getCount(): number;
    setCount(value: number): RemainingDailyMessageSendCount;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): RemainingDailyMessageSendCount.AsObject;
    static toObject(includeInstance: boolean, msg: RemainingDailyMessageSendCount): RemainingDailyMessageSendCount.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: RemainingDailyMessageSendCount, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): RemainingDailyMessageSendCount;
    static deserializeBinaryFromReader(message: RemainingDailyMessageSendCount, reader: jspb.BinaryReader): RemainingDailyMessageSendCount;
}

export namespace RemainingDailyMessageSendCount {
    export type AsObject = {
        date?: date_pb.Date.AsObject,
        count: number,
    }
}
