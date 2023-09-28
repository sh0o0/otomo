// package: 
// file: chat_service.proto

/* tslint:disable */
/* eslint-disable */

import * as jspb from "google-protobuf";
import * as google_protobuf_wrappers_pb from "google-protobuf/google/protobuf/wrappers_pb";
import * as message_pb from "./message_pb";

export class ChatService_SendMessageRequest extends jspb.Message { 
    getUserId(): string;
    setUserId(value: string): ChatService_SendMessageRequest;
    getText(): string;
    setText(value: string): ChatService_SendMessageRequest;

    hasClientId(): boolean;
    clearClientId(): void;
    getClientId(): google_protobuf_wrappers_pb.StringValue | undefined;
    setClientId(value?: google_protobuf_wrappers_pb.StringValue): ChatService_SendMessageRequest;

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
    setMessage(value?: message_pb.Message): ChatService_SendMessageResponse;

    hasRemainingSendCount(): boolean;
    clearRemainingSendCount(): void;
    getRemainingSendCount(): message_pb.RemainingSendCount | undefined;
    setRemainingSendCount(value?: message_pb.RemainingSendCount): ChatService_SendMessageResponse;

    hasMonthlySentCount(): boolean;
    clearMonthlySentCount(): void;
    getMonthlySentCount(): message_pb.MonthlySentCount | undefined;
    setMonthlySentCount(value?: message_pb.MonthlySentCount): ChatService_SendMessageResponse;

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
        remainingSendCount?: message_pb.RemainingSendCount.AsObject,
        monthlySentCount?: message_pb.MonthlySentCount.AsObject,
    }
}

export class ChatService_ListMessagesRequest extends jspb.Message { 
    getPageSize(): number;
    setPageSize(value: number): ChatService_ListMessagesRequest;
    getPageStartAfterMessageId(): string;
    setPageStartAfterMessageId(value: string): ChatService_ListMessagesRequest;
    getUserId(): string;
    setUserId(value: string): ChatService_ListMessagesRequest;

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
    setPageSize(value: number): ChatService_ListMessagesResponse;
    getHasMore(): boolean;
    setHasMore(value: boolean): ChatService_ListMessagesResponse;
    clearMessagesList(): void;
    getMessagesList(): Array<message_pb.Message>;
    setMessagesList(value: Array<message_pb.Message>): ChatService_ListMessagesResponse;
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
        hasMore: boolean,
        messagesList: Array<message_pb.Message.AsObject>,
    }
}

export class ChatService_AskToMessageRequest extends jspb.Message { 
    getUserId(): string;
    setUserId(value: string): ChatService_AskToMessageRequest;

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
    setMessage(value?: message_pb.Message): ChatService_AskToMessageResponse;

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

export class ChatService_MessagingStreamRequest extends jspb.Message { 
    getUserId(): string;
    setUserId(value: string): ChatService_MessagingStreamRequest;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): ChatService_MessagingStreamRequest.AsObject;
    static toObject(includeInstance: boolean, msg: ChatService_MessagingStreamRequest): ChatService_MessagingStreamRequest.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: ChatService_MessagingStreamRequest, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): ChatService_MessagingStreamRequest;
    static deserializeBinaryFromReader(message: ChatService_MessagingStreamRequest, reader: jspb.BinaryReader): ChatService_MessagingStreamRequest;
}

export namespace ChatService_MessagingStreamRequest {
    export type AsObject = {
        userId: string,
    }
}

export class ChatService_MessagingStreamResponse extends jspb.Message { 

    hasChunk(): boolean;
    clearChunk(): void;
    getChunk(): message_pb.MessageChunk | undefined;
    setChunk(value?: message_pb.MessageChunk): ChatService_MessagingStreamResponse;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): ChatService_MessagingStreamResponse.AsObject;
    static toObject(includeInstance: boolean, msg: ChatService_MessagingStreamResponse): ChatService_MessagingStreamResponse.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: ChatService_MessagingStreamResponse, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): ChatService_MessagingStreamResponse;
    static deserializeBinaryFromReader(message: ChatService_MessagingStreamResponse, reader: jspb.BinaryReader): ChatService_MessagingStreamResponse;
}

export namespace ChatService_MessagingStreamResponse {
    export type AsObject = {
        chunk?: message_pb.MessageChunk.AsObject,
    }
}

export class ChatService_GetRemainingSendCountRequest extends jspb.Message { 
    getUserId(): string;
    setUserId(value: string): ChatService_GetRemainingSendCountRequest;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): ChatService_GetRemainingSendCountRequest.AsObject;
    static toObject(includeInstance: boolean, msg: ChatService_GetRemainingSendCountRequest): ChatService_GetRemainingSendCountRequest.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: ChatService_GetRemainingSendCountRequest, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): ChatService_GetRemainingSendCountRequest;
    static deserializeBinaryFromReader(message: ChatService_GetRemainingSendCountRequest, reader: jspb.BinaryReader): ChatService_GetRemainingSendCountRequest;
}

export namespace ChatService_GetRemainingSendCountRequest {
    export type AsObject = {
        userId: string,
    }
}

export class ChatService_GetRemainingSendCountResponse extends jspb.Message { 

    hasRemainingSendCount(): boolean;
    clearRemainingSendCount(): void;
    getRemainingSendCount(): message_pb.RemainingSendCount | undefined;
    setRemainingSendCount(value?: message_pb.RemainingSendCount): ChatService_GetRemainingSendCountResponse;

    hasMonthlySentCount(): boolean;
    clearMonthlySentCount(): void;
    getMonthlySentCount(): message_pb.MonthlySentCount | undefined;
    setMonthlySentCount(value?: message_pb.MonthlySentCount): ChatService_GetRemainingSendCountResponse;

    serializeBinary(): Uint8Array;
    toObject(includeInstance?: boolean): ChatService_GetRemainingSendCountResponse.AsObject;
    static toObject(includeInstance: boolean, msg: ChatService_GetRemainingSendCountResponse): ChatService_GetRemainingSendCountResponse.AsObject;
    static extensions: {[key: number]: jspb.ExtensionFieldInfo<jspb.Message>};
    static extensionsBinary: {[key: number]: jspb.ExtensionFieldBinaryInfo<jspb.Message>};
    static serializeBinaryToWriter(message: ChatService_GetRemainingSendCountResponse, writer: jspb.BinaryWriter): void;
    static deserializeBinary(bytes: Uint8Array): ChatService_GetRemainingSendCountResponse;
    static deserializeBinaryFromReader(message: ChatService_GetRemainingSendCountResponse, reader: jspb.BinaryReader): ChatService_GetRemainingSendCountResponse;
}

export namespace ChatService_GetRemainingSendCountResponse {
    export type AsObject = {
        remainingSendCount?: message_pb.RemainingSendCount.AsObject,
        monthlySentCount?: message_pb.MonthlySentCount.AsObject,
    }
}
