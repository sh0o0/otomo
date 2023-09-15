// package: 
// file: message.proto

import * as jspb from "google-protobuf";
import * as google_protobuf_timestamp_pb from "google-protobuf/google/protobuf/timestamp_pb";
import * as google_protobuf_wrappers_pb from "google-protobuf/google/protobuf/wrappers_pb";

export class Message extends jspb.Message {
  getId(): string;
  setId(value: string): void;

  getText(): string;
  setText(value: string): void;

  getRole(): RoleMap[keyof RoleMap];
  setRole(value: RoleMap[keyof RoleMap]): void;

  hasSentAt(): boolean;
  clearSentAt(): void;
  getSentAt(): google_protobuf_timestamp_pb.Timestamp | undefined;
  setSentAt(value?: google_protobuf_timestamp_pb.Timestamp): void;

  hasClientId(): boolean;
  clearClientId(): void;
  getClientId(): google_protobuf_wrappers_pb.StringValue | undefined;
  setClientId(value?: google_protobuf_wrappers_pb.StringValue): void;

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
    role: RoleMap[keyof RoleMap],
    sentAt?: google_protobuf_timestamp_pb.Timestamp.AsObject,
    clientId?: google_protobuf_wrappers_pb.StringValue.AsObject,
  }
}

export interface RoleMap {
  UNKNOWN: 0;
  USER: 1;
  OTOMO: 2;
}

export const Role: RoleMap;

