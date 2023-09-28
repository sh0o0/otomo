// package: 
// file: location.proto

/* tslint:disable */
/* eslint-disable */

import * as jspb from "google-protobuf";

export class Location extends jspb.Message { 
    getGooglePlaceId(): string;
    setGooglePlaceId(value: string): Location;
    getAddress(): string;
    setAddress(value: string): Location;
    clearTypesList(): void;
    getTypesList(): Array<string>;
    setTypesList(value: Array<string>): Location;
    addTypes(value: string, index?: number): string;

    hasGeometry(): boolean;
    clearGeometry(): void;
    getGeometry(): Geometry | undefined;
    setGeometry(value?: Geometry): Location;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): Location.AsObject;
    static toObject(includeInstance: boolean, msg: Location): Location.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: Location, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): Location;
    static deserializeBinaryFromReader(message: Location, reader: jspb.BinaryReader): Location;
}

export namespace Location {
    export type AsObject = {
        googlePlaceId: string,
        address: string,
        typesList: Array<string>,
        geometry?: Geometry.AsObject,
    }
}

export class Geometry extends jspb.Message { 

    hasLatLng(): boolean;
    clearLatLng(): void;
    getLatLng(): LatLng | undefined;
    setLatLng(value?: LatLng): Geometry;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): Geometry.AsObject;
    static toObject(includeInstance: boolean, msg: Geometry): Geometry.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: Geometry, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): Geometry;
    static deserializeBinaryFromReader(message: Geometry, reader: jspb.BinaryReader): Geometry;
}

export namespace Geometry {
    export type AsObject = {
        latLng?: LatLng.AsObject,
    }
}

export class LatLng extends jspb.Message { 
    getLatitude(): number;
    setLatitude(value: number): LatLng;
    getLongitude(): number;
    setLongitude(value: number): LatLng;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): LatLng.AsObject;
    static toObject(includeInstance: boolean, msg: LatLng): LatLng.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: LatLng, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): LatLng;
    static deserializeBinaryFromReader(message: LatLng, reader: jspb.BinaryReader): LatLng;
}

export namespace LatLng {
    export type AsObject = {
        latitude: number,
        longitude: number,
    }
}
