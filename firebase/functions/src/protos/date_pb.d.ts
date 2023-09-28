// package: 
// file: date.proto

/* tslint:disable */
/* eslint-disable */

import * as jspb from "google-protobuf";

export class Date extends jspb.Message { 
    getYear(): number;
    setYear(value: number): Date;
    getMonth(): number;
    setMonth(value: number): Date;
    getDay(): number;
    setDay(value: number): Date;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): Date.AsObject;
    static toObject(includeInstance: boolean, msg: Date): Date.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: Date, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): Date;
    static deserializeBinaryFromReader(message: Date, reader: jspb.BinaryReader): Date;
}

export namespace Date {
    export type AsObject = {
        year: number,
        month: number,
        day: number,
    }
}

export class YearMonth extends jspb.Message { 
    getYear(): number;
    setYear(value: number): YearMonth;
    getMonth(): number;
    setMonth(value: number): YearMonth;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): YearMonth.AsObject;
    static toObject(includeInstance: boolean, msg: YearMonth): YearMonth.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: YearMonth, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): YearMonth;
    static deserializeBinaryFromReader(message: YearMonth, reader: jspb.BinaryReader): YearMonth;
}

export namespace YearMonth {
    export type AsObject = {
        year: number,
        month: number,
    }
}
