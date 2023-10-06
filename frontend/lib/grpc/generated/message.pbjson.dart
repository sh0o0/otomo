//
//  Generated code. Do not modify.
//  source: message.proto
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
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'USER', '2': 1},
    {'1': 'OTOMO', '2': 2},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEgsKB1VOS05PV04QABIICgRVU0VSEAESCQoFT1RPTU8QAg==');

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'role', '3': 3, '4': 1, '5': 14, '6': '.Role', '10': 'role'},
    {'1': 'sent_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'client_id', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'clientId'},
    {'1': 'place_extraction', '3': 6, '4': 1, '5': 11, '6': '.PlaceExtraction', '10': 'placeExtraction'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBISCgR0ZXh0GAIgASgJUgR0ZXh0EhkKBHJvbGUYAy'
    'ABKA4yBS5Sb2xlUgRyb2xlEjMKB3NlbnRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgZzZW50QXQSOQoJY2xpZW50X2lkGAUgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cm'
    'luZ1ZhbHVlUghjbGllbnRJZBI7ChBwbGFjZV9leHRyYWN0aW9uGAYgASgLMhAuUGxhY2VFeHRy'
    'YWN0aW9uUg9wbGFjZUV4dHJhY3Rpb24=');

@$core.Deprecated('Use placeExtractionDescriptor instead')
const PlaceExtraction$json = {
  '1': 'PlaceExtraction',
  '2': [
    {'1': 'places', '3': 1, '4': 3, '5': 11, '6': '.ExtractedPlace', '10': 'places'},
    {'1': 'processed_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'processedAt'},
    {'1': 'error', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'error'},
  ],
};

/// Descriptor for `PlaceExtraction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeExtractionDescriptor = $convert.base64Decode(
    'Cg9QbGFjZUV4dHJhY3Rpb24SJwoGcGxhY2VzGAEgAygLMg8uRXh0cmFjdGVkUGxhY2VSBnBsYW'
    'NlcxI9Cgxwcm9jZXNzZWRfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgtw'
    'cm9jZXNzZWRBdBIyCgVlcnJvchgDIAEoCzIcLmdvb2dsZS5wcm90b2J1Zi5TdHJpbmdWYWx1ZV'
    'IFZXJyb3I=');

@$core.Deprecated('Use extractedPlaceDescriptor instead')
const ExtractedPlace$json = {
  '1': 'ExtractedPlace',
  '2': [
    {'1': 'text', '3': 1, '4': 1, '5': 9, '10': 'text'},
    {'1': 'lat_lng', '3': 2, '4': 1, '5': 11, '6': '.LatLng', '10': 'latLng'},
  ],
};

/// Descriptor for `ExtractedPlace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extractedPlaceDescriptor = $convert.base64Decode(
    'Cg5FeHRyYWN0ZWRQbGFjZRISCgR0ZXh0GAEgASgJUgR0ZXh0EiAKB2xhdF9sbmcYAiABKAsyBy'
    '5MYXRMbmdSBmxhdExuZw==');

@$core.Deprecated('Use messageChunkDescriptor instead')
const MessageChunk$json = {
  '1': 'MessageChunk',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    {'1': 'role', '3': 3, '4': 1, '5': 14, '6': '.Role', '10': 'role'},
    {'1': 'sent_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'client_id', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'clientId'},
    {'1': 'is_last', '3': 6, '4': 1, '5': 8, '10': 'isLast'},
  ],
};

/// Descriptor for `MessageChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageChunkDescriptor = $convert.base64Decode(
    'CgxNZXNzYWdlQ2h1bmsSHQoKbWVzc2FnZV9pZBgBIAEoCVIJbWVzc2FnZUlkEhIKBHRleHQYAi'
    'ABKAlSBHRleHQSGQoEcm9sZRgDIAEoDjIFLlJvbGVSBHJvbGUSMwoHc2VudF9hdBgEIAEoCzIa'
    'Lmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSBnNlbnRBdBI5CgljbGllbnRfaWQYBSABKAsyHC'
    '5nb29nbGUucHJvdG9idWYuU3RyaW5nVmFsdWVSCGNsaWVudElkEhcKB2lzX2xhc3QYBiABKAhS'
    'BmlzTGFzdA==');

