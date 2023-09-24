//
//  Generated code. Do not modify.
//  source: location.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use locationDescriptor instead')
const Location$json = {
  '1': 'Location',
  '2': [
    {'1': 'google_place_id', '3': 1, '4': 1, '5': 9, '10': 'googlePlaceId'},
    {'1': 'long_name', '3': 2, '4': 1, '5': 9, '10': 'longName'},
    {'1': 'short_name', '3': 3, '4': 1, '5': 9, '10': 'shortName'},
    {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    {'1': 'types', '3': 5, '4': 3, '5': 9, '10': 'types'},
    {'1': 'geometry', '3': 6, '4': 1, '5': 11, '6': '.Geometry', '10': 'geometry'},
  ],
};

/// Descriptor for `Location`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List locationDescriptor = $convert.base64Decode(
    'CghMb2NhdGlvbhImCg9nb29nbGVfcGxhY2VfaWQYASABKAlSDWdvb2dsZVBsYWNlSWQSGwoJbG'
    '9uZ19uYW1lGAIgASgJUghsb25nTmFtZRIdCgpzaG9ydF9uYW1lGAMgASgJUglzaG9ydE5hbWUS'
    'GAoHYWRkcmVzcxgEIAEoCVIHYWRkcmVzcxIUCgV0eXBlcxgFIAMoCVIFdHlwZXMSJQoIZ2VvbW'
    'V0cnkYBiABKAsyCS5HZW9tZXRyeVIIZ2VvbWV0cnk=');

@$core.Deprecated('Use geometryDescriptor instead')
const Geometry$json = {
  '1': 'Geometry',
  '2': [
    {'1': 'lat_lng', '3': 1, '4': 1, '5': 11, '6': '.LatLng', '10': 'latLng'},
  ],
};

/// Descriptor for `Geometry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List geometryDescriptor = $convert.base64Decode(
    'CghHZW9tZXRyeRIgCgdsYXRfbG5nGAEgASgLMgcuTGF0TG5nUgZsYXRMbmc=');

@$core.Deprecated('Use latLngDescriptor instead')
const LatLng$json = {
  '1': 'LatLng',
  '2': [
    {'1': 'latitude', '3': 1, '4': 1, '5': 1, '10': 'latitude'},
    {'1': 'longitude', '3': 2, '4': 1, '5': 1, '10': 'longitude'},
  ],
};

/// Descriptor for `LatLng`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List latLngDescriptor = $convert.base64Decode(
    'CgZMYXRMbmcSGgoIbGF0aXR1ZGUYASABKAFSCGxhdGl0dWRlEhwKCWxvbmdpdHVkZRgCIAEoAV'
    'IJbG9uZ2l0dWRl');

