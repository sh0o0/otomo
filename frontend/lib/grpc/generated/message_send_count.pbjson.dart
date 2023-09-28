//
//  Generated code. Do not modify.
//  source: message_send_count.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageSentCountDescriptor instead')
const MessageSentCount$json = {
  '1': 'MessageSentCount',
  '2': [
    {'1': 'monthly_surplus', '3': 1, '4': 1, '5': 11, '6': '.MonthlySurplusMessageSentCount', '10': 'monthlySurplus'},
    {'1': 'daily', '3': 2, '4': 1, '5': 11, '6': '.DailyMessageSentCount', '10': 'daily'},
  ],
};

/// Descriptor for `MessageSentCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageSentCountDescriptor = $convert.base64Decode(
    'ChBNZXNzYWdlU2VudENvdW50EkgKD21vbnRobHlfc3VycGx1cxgBIAEoCzIfLk1vbnRobHlTdX'
    'JwbHVzTWVzc2FnZVNlbnRDb3VudFIObW9udGhseVN1cnBsdXMSLAoFZGFpbHkYAiABKAsyFi5E'
    'YWlseU1lc3NhZ2VTZW50Q291bnRSBWRhaWx5');

@$core.Deprecated('Use monthlySurplusMessageSentCountDescriptor instead')
const MonthlySurplusMessageSentCount$json = {
  '1': 'MonthlySurplusMessageSentCount',
  '2': [
    {'1': 'year_month', '3': 1, '4': 1, '5': 11, '6': '.YearMonth', '10': 'yearMonth'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `MonthlySurplusMessageSentCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List monthlySurplusMessageSentCountDescriptor = $convert.base64Decode(
    'Ch5Nb250aGx5U3VycGx1c01lc3NhZ2VTZW50Q291bnQSKQoKeWVhcl9tb250aBgBIAEoCzIKLl'
    'llYXJNb250aFIJeWVhck1vbnRoEhQKBWNvdW50GAIgASgFUgVjb3VudA==');

@$core.Deprecated('Use dailyMessageSentCountDescriptor instead')
const DailyMessageSentCount$json = {
  '1': 'DailyMessageSentCount',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 11, '6': '.Date', '10': 'date'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `DailyMessageSentCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dailyMessageSentCountDescriptor = $convert.base64Decode(
    'ChVEYWlseU1lc3NhZ2VTZW50Q291bnQSGQoEZGF0ZRgBIAEoCzIFLkRhdGVSBGRhdGUSFAoFY2'
    '91bnQYAiABKAVSBWNvdW50');

@$core.Deprecated('Use remainingMessageSendCountDescriptor instead')
const RemainingMessageSendCount$json = {
  '1': 'RemainingMessageSendCount',
  '2': [
    {'1': 'monthly_surplus', '3': 1, '4': 1, '5': 11, '6': '.RemainingMonthlySurplusMessageSendCount', '10': 'monthlySurplus'},
    {'1': 'daily', '3': 2, '4': 1, '5': 11, '6': '.RemainingDailyMessageSendCount', '10': 'daily'},
  ],
};

/// Descriptor for `RemainingMessageSendCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remainingMessageSendCountDescriptor = $convert.base64Decode(
    'ChlSZW1haW5pbmdNZXNzYWdlU2VuZENvdW50ElEKD21vbnRobHlfc3VycGx1cxgBIAEoCzIoLl'
    'JlbWFpbmluZ01vbnRobHlTdXJwbHVzTWVzc2FnZVNlbmRDb3VudFIObW9udGhseVN1cnBsdXMS'
    'NQoFZGFpbHkYAiABKAsyHy5SZW1haW5pbmdEYWlseU1lc3NhZ2VTZW5kQ291bnRSBWRhaWx5');

@$core.Deprecated('Use remainingMonthlySurplusMessageSendCountDescriptor instead')
const RemainingMonthlySurplusMessageSendCount$json = {
  '1': 'RemainingMonthlySurplusMessageSendCount',
  '2': [
    {'1': 'year_month', '3': 1, '4': 1, '5': 11, '6': '.YearMonth', '10': 'yearMonth'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `RemainingMonthlySurplusMessageSendCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remainingMonthlySurplusMessageSendCountDescriptor = $convert.base64Decode(
    'CidSZW1haW5pbmdNb250aGx5U3VycGx1c01lc3NhZ2VTZW5kQ291bnQSKQoKeWVhcl9tb250aB'
    'gBIAEoCzIKLlllYXJNb250aFIJeWVhck1vbnRoEhQKBWNvdW50GAIgASgFUgVjb3VudA==');

@$core.Deprecated('Use remainingDailyMessageSendCountDescriptor instead')
const RemainingDailyMessageSendCount$json = {
  '1': 'RemainingDailyMessageSendCount',
  '2': [
    {'1': 'date', '3': 1, '4': 1, '5': 11, '6': '.Date', '10': 'date'},
    {'1': 'count', '3': 2, '4': 1, '5': 5, '10': 'count'},
  ],
};

/// Descriptor for `RemainingDailyMessageSendCount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remainingDailyMessageSendCountDescriptor = $convert.base64Decode(
    'Ch5SZW1haW5pbmdEYWlseU1lc3NhZ2VTZW5kQ291bnQSGQoEZGF0ZRgBIAEoCzIFLkRhdGVSBG'
    'RhdGUSFAoFY291bnQYAiABKAVSBWNvdW50');

