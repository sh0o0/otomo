/**
 * Generated by the protoc-gen-ts.  DO NOT EDIT!
 * compiler version: 4.23.4
 * source: chat_service.proto
 * git: https://github.com/thesayyn/protoc-gen-ts */
import * as dependency_1 from "./google/protobuf/wrappers";
import * as dependency_2 from "./message";
import * as pb_1 from "google-protobuf";
import * as grpc_1 from "@grpc/grpc-js";
export class ChatService_SendMessageRequest extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        user_id?: string;
        text?: string;
        client_id?: dependency_1.google.protobuf.StringValue;
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("user_id" in data && data.user_id != undefined) {
                this.user_id = data.user_id;
            }
            if ("text" in data && data.text != undefined) {
                this.text = data.text;
            }
            if ("client_id" in data && data.client_id != undefined) {
                this.client_id = data.client_id;
            }
        }
    }
    get user_id() {
        return pb_1.Message.getFieldWithDefault(this, 1, "") as string;
    }
    set user_id(value: string) {
        pb_1.Message.setField(this, 1, value);
    }
    get text() {
        return pb_1.Message.getFieldWithDefault(this, 2, "") as string;
    }
    set text(value: string) {
        pb_1.Message.setField(this, 2, value);
    }
    get client_id() {
        return pb_1.Message.getWrapperField(this, dependency_1.google.protobuf.StringValue, 3) as dependency_1.google.protobuf.StringValue;
    }
    set client_id(value: dependency_1.google.protobuf.StringValue) {
        pb_1.Message.setWrapperField(this, 3, value);
    }
    get has_client_id() {
        return pb_1.Message.getField(this, 3) != null;
    }
    static fromObject(data: {
        user_id?: string;
        text?: string;
        client_id?: ReturnType<typeof dependency_1.google.protobuf.StringValue.prototype.toObject>;
    }): ChatService_SendMessageRequest {
        const message = new ChatService_SendMessageRequest({});
        if (data.user_id != null) {
            message.user_id = data.user_id;
        }
        if (data.text != null) {
            message.text = data.text;
        }
        if (data.client_id != null) {
            message.client_id = dependency_1.google.protobuf.StringValue.fromObject(data.client_id);
        }
        return message;
    }
    toObject() {
        const data: {
            user_id?: string;
            text?: string;
            client_id?: ReturnType<typeof dependency_1.google.protobuf.StringValue.prototype.toObject>;
        } = {};
        if (this.user_id != null) {
            data.user_id = this.user_id;
        }
        if (this.text != null) {
            data.text = this.text;
        }
        if (this.client_id != null) {
            data.client_id = this.client_id.toObject();
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.user_id.length)
            writer.writeString(1, this.user_id);
        if (this.text.length)
            writer.writeString(2, this.text);
        if (this.has_client_id)
            writer.writeMessage(3, this.client_id, () => this.client_id.serialize(writer));
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): ChatService_SendMessageRequest {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new ChatService_SendMessageRequest();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    message.user_id = reader.readString();
                    break;
                case 2:
                    message.text = reader.readString();
                    break;
                case 3:
                    reader.readMessage(message.client_id, () => message.client_id = dependency_1.google.protobuf.StringValue.deserialize(reader));
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): ChatService_SendMessageRequest {
        return ChatService_SendMessageRequest.deserialize(bytes);
    }
}
export class ChatService_SendMessageResponse extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        message?: dependency_2.Message;
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("message" in data && data.message != undefined) {
                this.message = data.message;
            }
        }
    }
    get message() {
        return pb_1.Message.getWrapperField(this, dependency_2.Message, 1) as dependency_2.Message;
    }
    set message(value: dependency_2.Message) {
        pb_1.Message.setWrapperField(this, 1, value);
    }
    get has_message() {
        return pb_1.Message.getField(this, 1) != null;
    }
    static fromObject(data: {
        message?: ReturnType<typeof dependency_2.Message.prototype.toObject>;
    }): ChatService_SendMessageResponse {
        const message = new ChatService_SendMessageResponse({});
        if (data.message != null) {
            message.message = dependency_2.Message.fromObject(data.message);
        }
        return message;
    }
    toObject() {
        const data: {
            message?: ReturnType<typeof dependency_2.Message.prototype.toObject>;
        } = {};
        if (this.message != null) {
            data.message = this.message.toObject();
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.has_message)
            writer.writeMessage(1, this.message, () => this.message.serialize(writer));
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): ChatService_SendMessageResponse {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new ChatService_SendMessageResponse();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    reader.readMessage(message.message, () => message.message = dependency_2.Message.deserialize(reader));
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): ChatService_SendMessageResponse {
        return ChatService_SendMessageResponse.deserialize(bytes);
    }
}
export class ChatService_ListMessagesRequest extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        page_size?: number;
        page_start_after_message_id?: string;
        user_id?: string;
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("page_size" in data && data.page_size != undefined) {
                this.page_size = data.page_size;
            }
            if ("page_start_after_message_id" in data && data.page_start_after_message_id != undefined) {
                this.page_start_after_message_id = data.page_start_after_message_id;
            }
            if ("user_id" in data && data.user_id != undefined) {
                this.user_id = data.user_id;
            }
        }
    }
    get page_size() {
        return pb_1.Message.getFieldWithDefault(this, 1, 0) as number;
    }
    set page_size(value: number) {
        pb_1.Message.setField(this, 1, value);
    }
    get page_start_after_message_id() {
        return pb_1.Message.getFieldWithDefault(this, 2, "") as string;
    }
    set page_start_after_message_id(value: string) {
        pb_1.Message.setField(this, 2, value);
    }
    get user_id() {
        return pb_1.Message.getFieldWithDefault(this, 3, "") as string;
    }
    set user_id(value: string) {
        pb_1.Message.setField(this, 3, value);
    }
    static fromObject(data: {
        page_size?: number;
        page_start_after_message_id?: string;
        user_id?: string;
    }): ChatService_ListMessagesRequest {
        const message = new ChatService_ListMessagesRequest({});
        if (data.page_size != null) {
            message.page_size = data.page_size;
        }
        if (data.page_start_after_message_id != null) {
            message.page_start_after_message_id = data.page_start_after_message_id;
        }
        if (data.user_id != null) {
            message.user_id = data.user_id;
        }
        return message;
    }
    toObject() {
        const data: {
            page_size?: number;
            page_start_after_message_id?: string;
            user_id?: string;
        } = {};
        if (this.page_size != null) {
            data.page_size = this.page_size;
        }
        if (this.page_start_after_message_id != null) {
            data.page_start_after_message_id = this.page_start_after_message_id;
        }
        if (this.user_id != null) {
            data.user_id = this.user_id;
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.page_size != 0)
            writer.writeUint32(1, this.page_size);
        if (this.page_start_after_message_id.length)
            writer.writeString(2, this.page_start_after_message_id);
        if (this.user_id.length)
            writer.writeString(3, this.user_id);
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): ChatService_ListMessagesRequest {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new ChatService_ListMessagesRequest();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    message.page_size = reader.readUint32();
                    break;
                case 2:
                    message.page_start_after_message_id = reader.readString();
                    break;
                case 3:
                    message.user_id = reader.readString();
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): ChatService_ListMessagesRequest {
        return ChatService_ListMessagesRequest.deserialize(bytes);
    }
}
export class ChatService_ListMessagesResponse extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        page_size?: number;
        messages?: dependency_2.Message[];
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [3], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("page_size" in data && data.page_size != undefined) {
                this.page_size = data.page_size;
            }
            if ("messages" in data && data.messages != undefined) {
                this.messages = data.messages;
            }
        }
    }
    get page_size() {
        return pb_1.Message.getFieldWithDefault(this, 1, 0) as number;
    }
    set page_size(value: number) {
        pb_1.Message.setField(this, 1, value);
    }
    get messages() {
        return pb_1.Message.getRepeatedWrapperField(this, dependency_2.Message, 3) as dependency_2.Message[];
    }
    set messages(value: dependency_2.Message[]) {
        pb_1.Message.setRepeatedWrapperField(this, 3, value);
    }
    static fromObject(data: {
        page_size?: number;
        messages?: ReturnType<typeof dependency_2.Message.prototype.toObject>[];
    }): ChatService_ListMessagesResponse {
        const message = new ChatService_ListMessagesResponse({});
        if (data.page_size != null) {
            message.page_size = data.page_size;
        }
        if (data.messages != null) {
            message.messages = data.messages.map(item => dependency_2.Message.fromObject(item));
        }
        return message;
    }
    toObject() {
        const data: {
            page_size?: number;
            messages?: ReturnType<typeof dependency_2.Message.prototype.toObject>[];
        } = {};
        if (this.page_size != null) {
            data.page_size = this.page_size;
        }
        if (this.messages != null) {
            data.messages = this.messages.map((item: dependency_2.Message) => item.toObject());
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.page_size != 0)
            writer.writeUint32(1, this.page_size);
        if (this.messages.length)
            writer.writeRepeatedMessage(3, this.messages, (item: dependency_2.Message) => item.serialize(writer));
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): ChatService_ListMessagesResponse {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new ChatService_ListMessagesResponse();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    message.page_size = reader.readUint32();
                    break;
                case 3:
                    reader.readMessage(message.messages, () => pb_1.Message.addToRepeatedWrapperField(message, 3, dependency_2.Message.deserialize(reader), dependency_2.Message));
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): ChatService_ListMessagesResponse {
        return ChatService_ListMessagesResponse.deserialize(bytes);
    }
}
export class ChatService_AskToMessageRequest extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        user_id?: string;
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("user_id" in data && data.user_id != undefined) {
                this.user_id = data.user_id;
            }
        }
    }
    get user_id() {
        return pb_1.Message.getFieldWithDefault(this, 1, "") as string;
    }
    set user_id(value: string) {
        pb_1.Message.setField(this, 1, value);
    }
    static fromObject(data: {
        user_id?: string;
    }): ChatService_AskToMessageRequest {
        const message = new ChatService_AskToMessageRequest({});
        if (data.user_id != null) {
            message.user_id = data.user_id;
        }
        return message;
    }
    toObject() {
        const data: {
            user_id?: string;
        } = {};
        if (this.user_id != null) {
            data.user_id = this.user_id;
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.user_id.length)
            writer.writeString(1, this.user_id);
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): ChatService_AskToMessageRequest {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new ChatService_AskToMessageRequest();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    message.user_id = reader.readString();
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): ChatService_AskToMessageRequest {
        return ChatService_AskToMessageRequest.deserialize(bytes);
    }
}
export class ChatService_AskToMessageResponse extends pb_1.Message {
    #one_of_decls: number[][] = [];
    constructor(data?: any[] | {
        message?: dependency_2.Message;
    }) {
        super();
        pb_1.Message.initialize(this, Array.isArray(data) ? data : [], 0, -1, [], this.#one_of_decls);
        if (!Array.isArray(data) && typeof data == "object") {
            if ("message" in data && data.message != undefined) {
                this.message = data.message;
            }
        }
    }
    get message() {
        return pb_1.Message.getWrapperField(this, dependency_2.Message, 1) as dependency_2.Message;
    }
    set message(value: dependency_2.Message) {
        pb_1.Message.setWrapperField(this, 1, value);
    }
    get has_message() {
        return pb_1.Message.getField(this, 1) != null;
    }
    static fromObject(data: {
        message?: ReturnType<typeof dependency_2.Message.prototype.toObject>;
    }): ChatService_AskToMessageResponse {
        const message = new ChatService_AskToMessageResponse({});
        if (data.message != null) {
            message.message = dependency_2.Message.fromObject(data.message);
        }
        return message;
    }
    toObject() {
        const data: {
            message?: ReturnType<typeof dependency_2.Message.prototype.toObject>;
        } = {};
        if (this.message != null) {
            data.message = this.message.toObject();
        }
        return data;
    }
    serialize(): Uint8Array;
    serialize(w: pb_1.BinaryWriter): void;
    serialize(w?: pb_1.BinaryWriter): Uint8Array | void {
        const writer = w || new pb_1.BinaryWriter();
        if (this.has_message)
            writer.writeMessage(1, this.message, () => this.message.serialize(writer));
        if (!w)
            return writer.getResultBuffer();
    }
    static deserialize(bytes: Uint8Array | pb_1.BinaryReader): ChatService_AskToMessageResponse {
        const reader = bytes instanceof pb_1.BinaryReader ? bytes : new pb_1.BinaryReader(bytes), message = new ChatService_AskToMessageResponse();
        while (reader.nextField()) {
            if (reader.isEndGroup())
                break;
            switch (reader.getFieldNumber()) {
                case 1:
                    reader.readMessage(message.message, () => message.message = dependency_2.Message.deserialize(reader));
                    break;
                default: reader.skipField();
            }
        }
        return message;
    }
    serializeBinary(): Uint8Array {
        return this.serialize();
    }
    static deserializeBinary(bytes: Uint8Array): ChatService_AskToMessageResponse {
        return ChatService_AskToMessageResponse.deserialize(bytes);
    }
}
interface GrpcUnaryServiceInterface<P, R> {
    (message: P, metadata: grpc_1.Metadata, options: grpc_1.CallOptions, callback: grpc_1.requestCallback<R>): grpc_1.ClientUnaryCall;
    (message: P, metadata: grpc_1.Metadata, callback: grpc_1.requestCallback<R>): grpc_1.ClientUnaryCall;
    (message: P, options: grpc_1.CallOptions, callback: grpc_1.requestCallback<R>): grpc_1.ClientUnaryCall;
    (message: P, callback: grpc_1.requestCallback<R>): grpc_1.ClientUnaryCall;
}
interface GrpcStreamServiceInterface<P, R> {
    (message: P, metadata: grpc_1.Metadata, options?: grpc_1.CallOptions): grpc_1.ClientReadableStream<R>;
    (message: P, options?: grpc_1.CallOptions): grpc_1.ClientReadableStream<R>;
}
interface GrpWritableServiceInterface<P, R> {
    (metadata: grpc_1.Metadata, options: grpc_1.CallOptions, callback: grpc_1.requestCallback<R>): grpc_1.ClientWritableStream<P>;
    (metadata: grpc_1.Metadata, callback: grpc_1.requestCallback<R>): grpc_1.ClientWritableStream<P>;
    (options: grpc_1.CallOptions, callback: grpc_1.requestCallback<R>): grpc_1.ClientWritableStream<P>;
    (callback: grpc_1.requestCallback<R>): grpc_1.ClientWritableStream<P>;
}
interface GrpcChunkServiceInterface<P, R> {
    (metadata: grpc_1.Metadata, options?: grpc_1.CallOptions): grpc_1.ClientDuplexStream<P, R>;
    (options?: grpc_1.CallOptions): grpc_1.ClientDuplexStream<P, R>;
}
interface GrpcPromiseServiceInterface<P, R> {
    (message: P, metadata: grpc_1.Metadata, options?: grpc_1.CallOptions): Promise<R>;
    (message: P, options?: grpc_1.CallOptions): Promise<R>;
}
export abstract class UnimplementedChatServiceService {
    static definition = {
        SendMessage: {
            path: "/ChatService/SendMessage",
            requestStream: false,
            responseStream: false,
            requestSerialize: (message: ChatService_SendMessageRequest) => Buffer.from(message.serialize()),
            requestDeserialize: (bytes: Buffer) => ChatService_SendMessageRequest.deserialize(new Uint8Array(bytes)),
            responseSerialize: (message: ChatService_SendMessageResponse) => Buffer.from(message.serialize()),
            responseDeserialize: (bytes: Buffer) => ChatService_SendMessageResponse.deserialize(new Uint8Array(bytes))
        },
        ListMessages: {
            path: "/ChatService/ListMessages",
            requestStream: false,
            responseStream: false,
            requestSerialize: (message: ChatService_ListMessagesRequest) => Buffer.from(message.serialize()),
            requestDeserialize: (bytes: Buffer) => ChatService_ListMessagesRequest.deserialize(new Uint8Array(bytes)),
            responseSerialize: (message: ChatService_ListMessagesResponse) => Buffer.from(message.serialize()),
            responseDeserialize: (bytes: Buffer) => ChatService_ListMessagesResponse.deserialize(new Uint8Array(bytes))
        },
        AskToMessage: {
            path: "/ChatService/AskToMessage",
            requestStream: false,
            responseStream: false,
            requestSerialize: (message: ChatService_AskToMessageRequest) => Buffer.from(message.serialize()),
            requestDeserialize: (bytes: Buffer) => ChatService_AskToMessageRequest.deserialize(new Uint8Array(bytes)),
            responseSerialize: (message: ChatService_AskToMessageResponse) => Buffer.from(message.serialize()),
            responseDeserialize: (bytes: Buffer) => ChatService_AskToMessageResponse.deserialize(new Uint8Array(bytes))
        }
    };
    [method: string]: grpc_1.UntypedHandleCall;
    abstract SendMessage(call: grpc_1.ServerUnaryCall<ChatService_SendMessageRequest, ChatService_SendMessageResponse>, callback: grpc_1.sendUnaryData<ChatService_SendMessageResponse>): void;
    abstract ListMessages(call: grpc_1.ServerUnaryCall<ChatService_ListMessagesRequest, ChatService_ListMessagesResponse>, callback: grpc_1.sendUnaryData<ChatService_ListMessagesResponse>): void;
    abstract AskToMessage(call: grpc_1.ServerUnaryCall<ChatService_AskToMessageRequest, ChatService_AskToMessageResponse>, callback: grpc_1.sendUnaryData<ChatService_AskToMessageResponse>): void;
}
export class ChatServiceClient extends grpc_1.makeGenericClientConstructor(UnimplementedChatServiceService.definition, "ChatService", {}) {
    constructor(address: string, credentials: grpc_1.ChannelCredentials, options?: Partial<grpc_1.ChannelOptions>) {
        super(address, credentials, options);
    }
    SendMessage: GrpcUnaryServiceInterface<ChatService_SendMessageRequest, ChatService_SendMessageResponse> = (message: ChatService_SendMessageRequest, metadata: grpc_1.Metadata | grpc_1.CallOptions | grpc_1.requestCallback<ChatService_SendMessageResponse>, options?: grpc_1.CallOptions | grpc_1.requestCallback<ChatService_SendMessageResponse>, callback?: grpc_1.requestCallback<ChatService_SendMessageResponse>): grpc_1.ClientUnaryCall => {
        return super.SendMessage(message, metadata, options, callback);
    };
    ListMessages: GrpcUnaryServiceInterface<ChatService_ListMessagesRequest, ChatService_ListMessagesResponse> = (message: ChatService_ListMessagesRequest, metadata: grpc_1.Metadata | grpc_1.CallOptions | grpc_1.requestCallback<ChatService_ListMessagesResponse>, options?: grpc_1.CallOptions | grpc_1.requestCallback<ChatService_ListMessagesResponse>, callback?: grpc_1.requestCallback<ChatService_ListMessagesResponse>): grpc_1.ClientUnaryCall => {
        return super.ListMessages(message, metadata, options, callback);
    };
    AskToMessage: GrpcUnaryServiceInterface<ChatService_AskToMessageRequest, ChatService_AskToMessageResponse> = (message: ChatService_AskToMessageRequest, metadata: grpc_1.Metadata | grpc_1.CallOptions | grpc_1.requestCallback<ChatService_AskToMessageResponse>, options?: grpc_1.CallOptions | grpc_1.requestCallback<ChatService_AskToMessageResponse>, callback?: grpc_1.requestCallback<ChatService_AskToMessageResponse>): grpc_1.ClientUnaryCall => {
        return super.AskToMessage(message, metadata, options, callback);
    };
}
