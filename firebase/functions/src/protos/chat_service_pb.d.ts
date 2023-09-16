// package: 
// file: chat_service.proto

import * as jspb from "google-protobuf";
import * as google_protobuf_wrappers_pb from "google-protobuf/google/protobuf/wrappers_pb";
import * as message_pb from "./message_pb";

export class ChatService_SendMessageRequest extends jspb.Message {
  getUserId(): string;
  setUserId(value: string): void;

  getText(): string;
  setText(value: string): void;

  hasClientId(): boolean;
  clearClientId(): void;
  getClientId(): google_protobuf_wrappers_pb.StringValue | undefined;
  setClientId(value?: google_protobuf_wrappers_pb.StringValue): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ChatService_SendMessageRequest.AsObject;
  static toObject(includeInstance: boolean, msg: ChatService_SendMessageRequest): ChatService_SendMessageRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: ChatService_SendMessageRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ChatService_SendMessageRequest;
  static deserializeBinaryFromReader(message: ChatService_SendMessageRequest, reader: jspb.BinaryReader): ChatService_SendMessageRequest;
}

export namespace ChatService_SendMessageRequest {
  export type AsObject = {
    userId: string,
    text: string,
    clientId?: google_protobuf_wrappers_pb.StringValue.AsObject,
  }
}

export class ChatService_SendMessageResponse extends jspb.Message {
  hasMessage(): boolean;
  clearMessage(): void;
  getMessage(): message_pb.Message | undefined;
  setMessage(value?: message_pb.Message): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ChatService_SendMessageResponse.AsObject;
  static toObject(includeInstance: boolean, msg: ChatService_SendMessageResponse): ChatService_SendMessageResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: ChatService_SendMessageResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ChatService_SendMessageResponse;
  static deserializeBinaryFromReader(message: ChatService_SendMessageResponse, reader: jspb.BinaryReader): ChatService_SendMessageResponse;
}

export namespace ChatService_SendMessageResponse {
  export type AsObject = {
    message?: message_pb.Message.AsObject,
  }
}

export class ChatService_ListMessagesRequest extends jspb.Message {
  getPageSize(): number;
  setPageSize(value: number): void;

  getPageStartAfterMessageId(): string;
  setPageStartAfterMessageId(value: string): void;

  getUserId(): string;
  setUserId(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ChatService_ListMessagesRequest.AsObject;
  static toObject(includeInstance: boolean, msg: ChatService_ListMessagesRequest): ChatService_ListMessagesRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: ChatService_ListMessagesRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ChatService_ListMessagesRequest;
  static deserializeBinaryFromReader(message: ChatService_ListMessagesRequest, reader: jspb.BinaryReader): ChatService_ListMessagesRequest;
}

export namespace ChatService_ListMessagesRequest {
  export type AsObject = {
    pageSize: number,
    pageStartAfterMessageId: string,
    userId: string,
  }
}

export class ChatService_ListMessagesResponse extends jspb.Message {
  getPageSize(): number;
  setPageSize(value: number): void;

  clearMessagesList(): void;
  getMessagesList(): Array<message_pb.Message>;
  setMessagesList(value: Array<message_pb.Message>): void;
  addMessages(value?: message_pb.Message, index?: number): message_pb.Message;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ChatService_ListMessagesResponse.AsObject;
  static toObject(includeInstance: boolean, msg: ChatService_ListMessagesResponse): ChatService_ListMessagesResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: ChatService_ListMessagesResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ChatService_ListMessagesResponse;
  static deserializeBinaryFromReader(message: ChatService_ListMessagesResponse, reader: jspb.BinaryReader): ChatService_ListMessagesResponse;
}

export namespace ChatService_ListMessagesResponse {
  export type AsObject = {
    pageSize: number,
    messagesList: Array<message_pb.Message.AsObject>,
  }
}

export class ChatService_AskToMessageRequest extends jspb.Message {
  getUserId(): string;
  setUserId(value: string): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ChatService_AskToMessageRequest.AsObject;
  static toObject(includeInstance: boolean, msg: ChatService_AskToMessageRequest): ChatService_AskToMessageRequest.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: ChatService_AskToMessageRequest, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ChatService_AskToMessageRequest;
  static deserializeBinaryFromReader(message: ChatService_AskToMessageRequest, reader: jspb.BinaryReader): ChatService_AskToMessageRequest;
}

export namespace ChatService_AskToMessageRequest {
  export type AsObject = {
    userId: string,
  }
}

export class ChatService_AskToMessageResponse extends jspb.Message {
  hasMessage(): boolean;
  clearMessage(): void;
  getMessage(): message_pb.Message | undefined;
  setMessage(value?: message_pb.Message): void;

  serializeBinary(): Uint8Array;
  toObject(includeInstance?: boolean): ChatService_AskToMessageResponse.AsObject;
  static toObject(includeInstance: boolean, msg: ChatService_AskToMessageResponse): ChatService_AskToMessageResponse.AsObject;
  static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
  static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
  static serializeBinaryToWriter(message: ChatService_AskToMessageResponse, writer: jspb.BinaryWriter): void;
  static deserializeBinary(bytes: Uint8Array): ChatService_AskToMessageResponse;
  static deserializeBinaryFromReader(message: ChatService_AskToMessageResponse, reader: jspb.BinaryReader): ChatService_AskToMessageResponse;
}

export namespace ChatService_AskToMessageResponse {
  export type AsObject = {
    message?: message_pb.Message.AsObject,
  }
}

