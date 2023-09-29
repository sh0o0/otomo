//
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatService_SendMessageRequestDescriptor instead')
const ChatService_SendMessageRequest$json = {
  '1': 'ChatService_SendMessageRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'text'},
    {'1': 'client_id', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'clientId'},
  ],
};

/// Descriptor for `ChatService_SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_SendMessageRequestDescriptor = $convert.base64Decode(
    'Ch5DaGF0U2VydmljZV9TZW5kTWVzc2FnZVJlcXVlc3QSIAoHdXNlcl9pZBgBIAEoCUIH+kIEcg'
    'IQAVIGdXNlcklkEiMKBHRleHQYAiABKAlCD/pCBHICEAH6QgVyAxiQTlIEdGV4dBI5CgljbGll'
    'bnRfaWQYAyABKAsyHC5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCGNsaWVudElk');

@$core.Deprecated('Use chatService_SendMessageResponseDescriptor instead')
const ChatService_SendMessageResponse$json = {
  '1': 'ChatService_SendMessageResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.Message', '10': 'message'},
    {'1': 'remaining_send_count', '3': 2, '4': 1, '5': 11, '6': '.RemainingMessageSendCount', '10': 'remainingSendCount'},
    {'1': 'sent_count', '3': 3, '4': 1, '5': 11, '6': '.MessageSentCount', '10': 'sentCount'},
  ],
};

/// Descriptor for `ChatService_SendMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_SendMessageResponseDescriptor = $convert.base64Decode(
    'Ch9DaGF0U2VydmljZV9TZW5kTWVzc2FnZVJlc3BvbnNlEiIKB21lc3NhZ2UYASABKAsyCC5NZX'
    'NzYWdlUgdtZXNzYWdlEkwKFHJlbWFpbmluZ19zZW5kX2NvdW50GAIgASgLMhouUmVtYWluaW5n'
    'TWVzc2FnZVNlbmRDb3VudFIScmVtYWluaW5nU2VuZENvdW50EjAKCnNlbnRfY291bnQYAyABKA'
    'syES5NZXNzYWdlU2VudENvdW50UglzZW50Q291bnQ=');

@$core.Deprecated('Use chatService_ListMessagesRequestDescriptor instead')
const ChatService_ListMessagesRequest$json = {
  '1': 'ChatService_ListMessagesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 13, '10': 'pageSize'},
    {'1': 'page_start_after_message_id', '3': 2, '4': 1, '5': 9, '10': 'pageStartAfterMessageId'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `ChatService_ListMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_ListMessagesRequestDescriptor = $convert.base64Decode(
    'Ch9DaGF0U2VydmljZV9MaXN0TWVzc2FnZXNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoDVIIcG'
    'FnZVNpemUSPAobcGFnZV9zdGFydF9hZnRlcl9tZXNzYWdlX2lkGAIgASgJUhdwYWdlU3RhcnRB'
    'ZnRlck1lc3NhZ2VJZBIgCgd1c2VyX2lkGAMgASgJQgf6QgRyAhABUgZ1c2VySWQ=');

@$core.Deprecated('Use chatService_ListMessagesResponseDescriptor instead')
const ChatService_ListMessagesResponse$json = {
  '1': 'ChatService_ListMessagesResponse',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 13, '10': 'pageSize'},
    {'1': 'has_more', '3': 2, '4': 1, '5': 8, '10': 'hasMore'},
    {'1': 'messages', '3': 3, '4': 3, '5': 11, '6': '.Message', '10': 'messages'},
  ],
};

/// Descriptor for `ChatService_ListMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_ListMessagesResponseDescriptor = $convert.base64Decode(
    'CiBDaGF0U2VydmljZV9MaXN0TWVzc2FnZXNSZXNwb25zZRIbCglwYWdlX3NpemUYASABKA1SCH'
    'BhZ2VTaXplEhkKCGhhc19tb3JlGAIgASgIUgdoYXNNb3JlEiQKCG1lc3NhZ2VzGAMgAygLMggu'
    'TWVzc2FnZVIIbWVzc2FnZXM=');

@$core.Deprecated('Use chatService_AskToMessageRequestDescriptor instead')
const ChatService_AskToMessageRequest$json = {
  '1': 'ChatService_AskToMessageRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `ChatService_AskToMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_AskToMessageRequestDescriptor = $convert.base64Decode(
    'Ch9DaGF0U2VydmljZV9Bc2tUb01lc3NhZ2VSZXF1ZXN0EiAKB3VzZXJfaWQYASABKAlCB/pCBH'
    'ICEAFSBnVzZXJJZA==');

@$core.Deprecated('Use chatService_AskToMessageResponseDescriptor instead')
const ChatService_AskToMessageResponse$json = {
  '1': 'ChatService_AskToMessageResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.Message', '10': 'message'},
  ],
};

/// Descriptor for `ChatService_AskToMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_AskToMessageResponseDescriptor = $convert.base64Decode(
    'CiBDaGF0U2VydmljZV9Bc2tUb01lc3NhZ2VSZXNwb25zZRIiCgdtZXNzYWdlGAEgASgLMgguTW'
    'Vzc2FnZVIHbWVzc2FnZQ==');

@$core.Deprecated('Use chatService_MessagingStreamRequestDescriptor instead')
const ChatService_MessagingStreamRequest$json = {
  '1': 'ChatService_MessagingStreamRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `ChatService_MessagingStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_MessagingStreamRequestDescriptor = $convert.base64Decode(
    'CiJDaGF0U2VydmljZV9NZXNzYWdpbmdTdHJlYW1SZXF1ZXN0EiAKB3VzZXJfaWQYASABKAlCB/'
    'pCBHICEAFSBnVzZXJJZA==');

@$core.Deprecated('Use chatService_MessagingStreamResponseDescriptor instead')
const ChatService_MessagingStreamResponse$json = {
  '1': 'ChatService_MessagingStreamResponse',
  '2': [
    {'1': 'chunk', '3': 1, '4': 1, '5': 11, '6': '.MessageChunk', '10': 'chunk'},
  ],
};

/// Descriptor for `ChatService_MessagingStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_MessagingStreamResponseDescriptor = $convert.base64Decode(
    'CiNDaGF0U2VydmljZV9NZXNzYWdpbmdTdHJlYW1SZXNwb25zZRIjCgVjaHVuaxgBIAEoCzINLk'
    '1lc3NhZ2VDaHVua1IFY2h1bms=');

@$core.Deprecated('Use chatService_GetRemainingSendCountRequestDescriptor instead')
const ChatService_GetRemainingSendCountRequest$json = {
  '1': 'ChatService_GetRemainingSendCountRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
  ],
};

/// Descriptor for `ChatService_GetRemainingSendCountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_GetRemainingSendCountRequestDescriptor = $convert.base64Decode(
    'CihDaGF0U2VydmljZV9HZXRSZW1haW5pbmdTZW5kQ291bnRSZXF1ZXN0EiAKB3VzZXJfaWQYAS'
    'ABKAlCB/pCBHICEAFSBnVzZXJJZA==');

@$core.Deprecated('Use chatService_GetRemainingSendCountResponseDescriptor instead')
const ChatService_GetRemainingSendCountResponse$json = {
  '1': 'ChatService_GetRemainingSendCountResponse',
  '2': [
    {'1': 'remaining_send_count', '3': 1, '4': 1, '5': 11, '6': '.RemainingMessageSendCount', '10': 'remainingSendCount'},
    {'1': 'sent_count', '3': 2, '4': 1, '5': 11, '6': '.MessageSentCount', '10': 'sentCount'},
  ],
};

/// Descriptor for `ChatService_GetRemainingSendCountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_GetRemainingSendCountResponseDescriptor = $convert.base64Decode(
    'CilDaGF0U2VydmljZV9HZXRSZW1haW5pbmdTZW5kQ291bnRSZXNwb25zZRJMChRyZW1haW5pbm'
    'dfc2VuZF9jb3VudBgBIAEoCzIaLlJlbWFpbmluZ01lc3NhZ2VTZW5kQ291bnRSEnJlbWFpbmlu'
    'Z1NlbmRDb3VudBIwCgpzZW50X2NvdW50GAIgASgLMhEuTWVzc2FnZVNlbnRDb3VudFIJc2VudE'
    'NvdW50');

