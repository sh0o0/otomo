//
//  Generated code. Do not modify.
//  source: chat_service_service.proto
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
    {'1': 'text', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'text'},
  ],
};

/// Descriptor for `ChatService_SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_SendMessageRequestDescriptor = $convert.base64Decode(
    'Ch5DaGF0U2VydmljZV9TZW5kTWVzc2FnZVJlcXVlc3QSIwoEdGV4dBgBIAEoCUIP+kIEcgIQAf'
    'pCBXIDGJBOUgR0ZXh0');

@$core.Deprecated('Use chatService_SendMessageStreamResponseDescriptor instead')
const ChatService_SendMessageStreamResponse$json = {
  '1': 'ChatService_SendMessageStreamResponse',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'sent_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
  ],
};

/// Descriptor for `ChatService_SendMessageStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_SendMessageStreamResponseDescriptor = $convert.base64Decode(
    'CiVDaGF0U2VydmljZV9TZW5kTWVzc2FnZVN0cmVhbVJlc3BvbnNlEhIKBHRleHQYASABKAlSBH'
    'RleHQSMwoHc2VudF9hdBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBnNlbnRB'
    'dA==');

@$core.Deprecated('Use chatService_ListMessagesRequestDescriptor instead')
const ChatService_ListMessagesRequest$json = {
  '1': 'ChatService_ListMessagesRequest',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 13, '10': 'pageSize'},
    {'1': 'page_start_after_message_id', '3': 2, '4': 1, '5': 9, '10': 'pageStartAfterMessageId'},
    {'1': 'messages', '3': 3, '4': 3, '5': 11, '6': '.Message', '10': 'messages'},
  ],
};

/// Descriptor for `ChatService_ListMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_ListMessagesRequestDescriptor = $convert.base64Decode(
    'Ch9DaGF0U2VydmljZV9MaXN0TWVzc2FnZXNSZXF1ZXN0EhsKCXBhZ2Vfc2l6ZRgBIAEoDVIIcG'
    'FnZVNpemUSPAobcGFnZV9zdGFydF9hZnRlcl9tZXNzYWdlX2lkGAIgASgJUhdwYWdlU3RhcnRB'
    'ZnRlck1lc3NhZ2VJZBIkCghtZXNzYWdlcxgDIAMoCzIILk1lc3NhZ2VSCG1lc3NhZ2Vz');

@$core.Deprecated('Use chatService_ListMessagesResponseDescriptor instead')
const ChatService_ListMessagesResponse$json = {
  '1': 'ChatService_ListMessagesResponse',
  '2': [
    {'1': 'page_size', '3': 1, '4': 1, '5': 13, '10': 'pageSize'},
    {'1': 'messages', '3': 3, '4': 3, '5': 11, '6': '.Message', '10': 'messages'},
  ],
};

/// Descriptor for `ChatService_ListMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatService_ListMessagesResponseDescriptor = $convert.base64Decode(
    'CiBDaGF0U2VydmljZV9MaXN0TWVzc2FnZXNSZXNwb25zZRIbCglwYWdlX3NpemUYASABKA1SCH'
    'BhZ2VTaXplEiQKCG1lc3NhZ2VzGAMgAygLMgguTWVzc2FnZVIIbWVzc2FnZXM=');

