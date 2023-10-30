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
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'struct_name', '3': 8, '4': 1, '5': 9, '10': 'structName'},
    {'1': 'places_struct', '3': 9, '4': 1, '5': 11, '6': '.PlacesStruct', '9': 0, '10': 'placesStruct'},
    {'1': 'route_struct', '3': 10, '4': 1, '5': 11, '6': '.RouteStruct', '9': 0, '10': 'routeStruct'},
    {'1': 'place_details_struct', '3': 11, '4': 1, '5': 11, '6': '.PlaceDetailsStruct', '9': 0, '10': 'placeDetailsStruct'},
  ],
  '8': [
    {'1': 'struct'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBISCgR0ZXh0GAIgASgJUgR0ZXh0EhkKBHJvbGUYAy'
    'ABKA4yBS5Sb2xlUgRyb2xlEjMKB3NlbnRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wUgZzZW50QXQSOQoJY2xpZW50X2lkGAUgASgLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cm'
    'luZ1ZhbHVlUghjbGllbnRJZBI7ChBwbGFjZV9leHRyYWN0aW9uGAYgASgLMhAuUGxhY2VFeHRy'
    'YWN0aW9uUg9wbGFjZUV4dHJhY3Rpb24SGAoHY29udGVudBgHIAEoCVIHY29udGVudBIfCgtzdH'
    'J1Y3RfbmFtZRgIIAEoCVIKc3RydWN0TmFtZRI0Cg1wbGFjZXNfc3RydWN0GAkgASgLMg0uUGxh'
    'Y2VzU3RydWN0SABSDHBsYWNlc1N0cnVjdBIxCgxyb3V0ZV9zdHJ1Y3QYCiABKAsyDC5Sb3V0ZV'
    'N0cnVjdEgAUgtyb3V0ZVN0cnVjdBJHChRwbGFjZV9kZXRhaWxzX3N0cnVjdBgLIAEoCzITLlBs'
    'YWNlRGV0YWlsc1N0cnVjdEgAUhJwbGFjZURldGFpbHNTdHJ1Y3RCCAoGc3RydWN0');

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
    {'1': 'geocoded_place', '3': 2, '4': 1, '5': 11, '6': '.GeocodedPlace', '10': 'geocodedPlace'},
  ],
};

/// Descriptor for `ExtractedPlace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extractedPlaceDescriptor = $convert.base64Decode(
    'Cg5FeHRyYWN0ZWRQbGFjZRISCgR0ZXh0GAEgASgJUgR0ZXh0EjUKDmdlb2NvZGVkX3BsYWNlGA'
    'IgASgLMg4uR2VvY29kZWRQbGFjZVINZ2VvY29kZWRQbGFjZQ==');

@$core.Deprecated('Use geocodedPlaceDescriptor instead')
const GeocodedPlace$json = {
  '1': 'GeocodedPlace',
  '2': [
    {'1': 'google_place_id', '3': 1, '4': 1, '5': 9, '10': 'googlePlaceId'},
    {'1': 'lat_lng', '3': 2, '4': 1, '5': 11, '6': '.LatLng', '10': 'latLng'},
  ],
};

/// Descriptor for `GeocodedPlace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List geocodedPlaceDescriptor = $convert.base64Decode(
    'Cg1HZW9jb2RlZFBsYWNlEiYKD2dvb2dsZV9wbGFjZV9pZBgBIAEoCVINZ29vZ2xlUGxhY2VJZB'
    'IgCgdsYXRfbG5nGAIgASgLMgcuTGF0TG5nUgZsYXRMbmc=');

@$core.Deprecated('Use messageChunkDescriptor instead')
const MessageChunk$json = {
  '1': 'MessageChunk',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {
      '1': 'text',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {'3': true},
      '10': 'text',
    },
    {'1': 'role', '3': 3, '4': 1, '5': 14, '6': '.Role', '10': 'role'},
    {'1': 'sent_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sentAt'},
    {'1': 'client_id', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.StringValue', '10': 'clientId'},
    {'1': 'is_last', '3': 6, '4': 1, '5': 8, '10': 'isLast'},
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'struct_name', '3': 8, '4': 1, '5': 9, '10': 'structName'},
    {'1': 'struct', '3': 9, '4': 1, '5': 9, '10': 'struct'},
  ],
};

/// Descriptor for `MessageChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageChunkDescriptor = $convert.base64Decode(
    'CgxNZXNzYWdlQ2h1bmsSHQoKbWVzc2FnZV9pZBgBIAEoCVIJbWVzc2FnZUlkEhYKBHRleHQYAi'
    'ABKAlCAhgBUgR0ZXh0EhkKBHJvbGUYAyABKA4yBS5Sb2xlUgRyb2xlEjMKB3NlbnRfYXQYBCAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgZzZW50QXQSOQoJY2xpZW50X2lkGAUgAS'
    'gLMhwuZ29vZ2xlLnByb3RvYnVmLlN0cmluZ1ZhbHVlUghjbGllbnRJZBIXCgdpc19sYXN0GAYg'
    'ASgIUgZpc0xhc3QSGAoHY29udGVudBgHIAEoCVIHY29udGVudBIfCgtzdHJ1Y3RfbmFtZRgIIA'
    'EoCVIKc3RydWN0TmFtZRIWCgZzdHJ1Y3QYCSABKAlSBnN0cnVjdA==');

@$core.Deprecated('Use placesStructDescriptor instead')
const PlacesStruct$json = {
  '1': 'PlacesStruct',
  '2': [
    {'1': 'prologue', '3': 1, '4': 1, '5': 9, '10': 'prologue'},
    {'1': 'epilogue', '3': 2, '4': 1, '5': 9, '10': 'epilogue'},
  ],
};

/// Descriptor for `PlacesStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placesStructDescriptor = $convert.base64Decode(
    'CgxQbGFjZXNTdHJ1Y3QSGgoIcHJvbG9ndWUYASABKAlSCHByb2xvZ3VlEhoKCGVwaWxvZ3VlGA'
    'IgASgJUghlcGlsb2d1ZQ==');

@$core.Deprecated('Use routeStructDescriptor instead')
const RouteStruct$json = {
  '1': 'RouteStruct',
  '2': [
    {'1': 'prologue', '3': 1, '4': 1, '5': 9, '10': 'prologue'},
    {'1': 'epilogue', '3': 2, '4': 1, '5': 9, '10': 'epilogue'},
  ],
};

/// Descriptor for `RouteStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeStructDescriptor = $convert.base64Decode(
    'CgtSb3V0ZVN0cnVjdBIaCghwcm9sb2d1ZRgBIAEoCVIIcHJvbG9ndWUSGgoIZXBpbG9ndWUYAi'
    'ABKAlSCGVwaWxvZ3Vl');

@$core.Deprecated('Use placeDetailsStructDescriptor instead')
const PlaceDetailsStruct$json = {
  '1': 'PlaceDetailsStruct',
  '2': [
    {'1': 'prologue', '3': 1, '4': 1, '5': 9, '10': 'prologue'},
    {'1': 'epilogue', '3': 2, '4': 1, '5': 9, '10': 'epilogue'},
  ],
};

/// Descriptor for `PlaceDetailsStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDetailsStructDescriptor = $convert.base64Decode(
    'ChJQbGFjZURldGFpbHNTdHJ1Y3QSGgoIcHJvbG9ndWUYASABKAlSCHByb2xvZ3VlEhoKCGVwaW'
    'xvZ3VlGAIgASgJUghlcGlsb2d1ZQ==');

