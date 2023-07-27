//
//  Generated code. Do not modify.
//  source: message_with_otomo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'User', '2': 0},
    {'1': 'Otomo', '2': 1},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEggKBFVzZXIQABIJCgVPdG9tbxAB');

@$core.Deprecated('Use messageWithOtomoDescriptor instead')
const MessageWithOtomo$json = {
  '1': 'MessageWithOtomo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'sender', '3': 3, '4': 1, '5': 14, '6': '.Role', '10': 'sender'},
    {'1': 'reciever', '3': 4, '4': 1, '5': 14, '6': '.Role', '10': 'reciever'},
    {'1': 'text', '3': 5, '4': 1, '5': 9, '10': 'text'},
    {'1': 'sent_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
  ],
};

/// Descriptor for `MessageWithOtomo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageWithOtomoDescriptor = $convert.base64Decode(
    'ChBNZXNzYWdlV2l0aE90b21vEg4KAmlkGAEgASgJUgJpZBIXCgd1c2VyX2lkGAIgASgJUgZ1c2'
    'VySWQSHQoGc2VuZGVyGAMgASgOMgUuUm9sZVIGc2VuZGVyEiEKCHJlY2lldmVyGAQgASgOMgUu'
    'Um9sZVIIcmVjaWV2ZXISEgoEdGV4dBgFIAEoCVIEdGV4dBIzCgdzZW50X2F0GAYgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIGc2VudEF0');

