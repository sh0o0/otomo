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
    {'1': 'ROLE_UNKNOWN', '2': 0},
    {'1': 'USER', '2': 1},
    {'1': 'OTOMO', '2': 2},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEhAKDFJPTEVfVU5LTk9XThAAEggKBFVTRVIQARIJCgVPVE9NTxAC');

@$core.Deprecated('Use transportationDescriptor instead')
const Transportation$json = {
  '1': 'Transportation',
  '2': [
    {'1': 'TRANSPORTATION_UNKNOWN', '2': 0},
    {'1': 'TRAIN', '2': 1},
    {'1': 'AIRPLANE', '2': 2},
    {'1': 'CAR', '2': 3},
    {'1': 'SHIP', '2': 4},
    {'1': 'BUS', '2': 5},
    {'1': 'BICYCLE', '2': 6},
    {'1': 'MOTORCYCLE', '2': 7},
    {'1': 'WALKING', '2': 8},
    {'1': 'TAXI', '2': 9},
    {'1': 'OTHER', '2': 10},
  ],
};

/// Descriptor for `Transportation`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transportationDescriptor = $convert.base64Decode(
    'Cg5UcmFuc3BvcnRhdGlvbhIaChZUUkFOU1BPUlRBVElPTl9VTktOT1dOEAASCQoFVFJBSU4QAR'
    'IMCghBSVJQTEFORRACEgcKA0NBUhADEggKBFNISVAQBBIHCgNCVVMQBRILCgdCSUNZQ0xFEAYS'
    'DgoKTU9UT1JDWUNMRRAHEgsKB1dBTEtJTkcQCBIICgRUQVhJEAkSCQoFT1RIRVIQCg==');

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
    {'1': 'place_details_struct', '3': 9, '4': 1, '5': 11, '6': '.PlaceDetailsStruct', '9': 0, '10': 'placeDetailsStruct'},
    {'1': 'places_struct', '3': 10, '4': 1, '5': 11, '6': '.PlacesStruct', '9': 0, '10': 'placesStruct'},
    {'1': 'route_struct', '3': 11, '4': 1, '5': 11, '6': '.RouteStruct', '9': 0, '10': 'routeStruct'},
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
    'J1Y3RfbmFtZRgIIAEoCVIKc3RydWN0TmFtZRJHChRwbGFjZV9kZXRhaWxzX3N0cnVjdBgJIAEo'
    'CzITLlBsYWNlRGV0YWlsc1N0cnVjdEgAUhJwbGFjZURldGFpbHNTdHJ1Y3QSNAoNcGxhY2VzX3'
    'N0cnVjdBgKIAEoCzINLlBsYWNlc1N0cnVjdEgAUgxwbGFjZXNTdHJ1Y3QSMQoMcm91dGVfc3Ry'
    'dWN0GAsgASgLMgwuUm91dGVTdHJ1Y3RIAFILcm91dGVTdHJ1Y3RCCAoGc3RydWN0');

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

@$core.Deprecated('Use placeDetailsStructDescriptor instead')
const PlaceDetailsStruct$json = {
  '1': 'PlaceDetailsStruct',
  '2': [
    {'1': 'prologue', '3': 1, '4': 1, '5': 9, '10': 'prologue'},
    {'1': 'details', '3': 2, '4': 1, '5': 11, '6': '.PlaceDetails', '10': 'details'},
    {'1': 'epilogue', '3': 3, '4': 1, '5': 9, '10': 'epilogue'},
  ],
};

/// Descriptor for `PlaceDetailsStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDetailsStructDescriptor = $convert.base64Decode(
    'ChJQbGFjZURldGFpbHNTdHJ1Y3QSGgoIcHJvbG9ndWUYASABKAlSCHByb2xvZ3VlEicKB2RldG'
    'FpbHMYAiABKAsyDS5QbGFjZURldGFpbHNSB2RldGFpbHMSGgoIZXBpbG9ndWUYAyABKAlSCGVw'
    'aWxvZ3Vl');

@$core.Deprecated('Use placeDetailsDescriptor instead')
const PlaceDetails$json = {
  '1': 'PlaceDetails',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'geocoded_place', '3': 3, '4': 1, '5': 11, '6': '.GeocodedPlace', '10': 'geocodedPlace'},
  ],
};

/// Descriptor for `PlaceDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDetailsDescriptor = $convert.base64Decode(
    'CgxQbGFjZURldGFpbHMSEgoEbmFtZRgBIAEoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgCIAEoCV'
    'ILZGVzY3JpcHRpb24SNQoOZ2VvY29kZWRfcGxhY2UYAyABKAsyDi5HZW9jb2RlZFBsYWNlUg1n'
    'ZW9jb2RlZFBsYWNl');

@$core.Deprecated('Use placesStructDescriptor instead')
const PlacesStruct$json = {
  '1': 'PlacesStruct',
  '2': [
    {'1': 'prologue', '3': 1, '4': 1, '5': 9, '10': 'prologue'},
    {'1': 'places', '3': 2, '4': 3, '5': 11, '6': '.Place', '10': 'places'},
    {'1': 'epilogue', '3': 3, '4': 1, '5': 9, '10': 'epilogue'},
  ],
};

/// Descriptor for `PlacesStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placesStructDescriptor = $convert.base64Decode(
    'CgxQbGFjZXNTdHJ1Y3QSGgoIcHJvbG9ndWUYASABKAlSCHByb2xvZ3VlEh4KBnBsYWNlcxgCIA'
    'MoCzIGLlBsYWNlUgZwbGFjZXMSGgoIZXBpbG9ndWUYAyABKAlSCGVwaWxvZ3Vl');

@$core.Deprecated('Use placeDescriptor instead')
const Place$json = {
  '1': 'Place',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'geocoded_place', '3': 3, '4': 1, '5': 11, '6': '.GeocodedPlace', '10': 'geocodedPlace'},
  ],
};

/// Descriptor for `Place`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List placeDescriptor = $convert.base64Decode(
    'CgVQbGFjZRISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcm'
    'lwdGlvbhI1Cg5nZW9jb2RlZF9wbGFjZRgDIAEoCzIOLkdlb2NvZGVkUGxhY2VSDWdlb2NvZGVk'
    'UGxhY2U=');

@$core.Deprecated('Use routeStructDescriptor instead')
const RouteStruct$json = {
  '1': 'RouteStruct',
  '2': [
    {'1': 'prologue', '3': 1, '4': 1, '5': 9, '10': 'prologue'},
    {'1': 'waypoints', '3': 2, '4': 3, '5': 11, '6': '.Waypoint', '10': 'waypoints'},
    {'1': 'epilogue', '3': 3, '4': 1, '5': 9, '10': 'epilogue'},
  ],
};

/// Descriptor for `RouteStruct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeStructDescriptor = $convert.base64Decode(
    'CgtSb3V0ZVN0cnVjdBIaCghwcm9sb2d1ZRgBIAEoCVIIcHJvbG9ndWUSJwoJd2F5cG9pbnRzGA'
    'IgAygLMgkuV2F5cG9pbnRSCXdheXBvaW50cxIaCghlcGlsb2d1ZRgDIAEoCVIIZXBpbG9ndWU=');

@$core.Deprecated('Use waypointDescriptor instead')
const Waypoint$json = {
  '1': 'Waypoint',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'transportation', '3': 3, '4': 3, '5': 14, '6': '.Transportation', '10': 'transportation'},
    {'1': 'transportation_description', '3': 4, '4': 1, '5': 9, '10': 'transportationDescription'},
    {'1': 'geocoded_place', '3': 5, '4': 1, '5': 11, '6': '.GeocodedPlace', '10': 'geocodedPlace'},
  ],
};

/// Descriptor for `Waypoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List waypointDescriptor = $convert.base64Decode(
    'CghXYXlwb2ludBISCgRuYW1lGAEgASgJUgRuYW1lEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZX'
    'NjcmlwdGlvbhI3Cg50cmFuc3BvcnRhdGlvbhgDIAMoDjIPLlRyYW5zcG9ydGF0aW9uUg50cmFu'
    'c3BvcnRhdGlvbhI9Chp0cmFuc3BvcnRhdGlvbl9kZXNjcmlwdGlvbhgEIAEoCVIZdHJhbnNwb3'
    'J0YXRpb25EZXNjcmlwdGlvbhI1Cg5nZW9jb2RlZF9wbGFjZRgFIAEoCzIOLkdlb2NvZGVkUGxh'
    'Y2VSDWdlb2NvZGVkUGxhY2U=');

