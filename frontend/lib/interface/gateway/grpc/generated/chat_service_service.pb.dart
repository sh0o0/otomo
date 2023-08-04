//
//  Generated code. Do not modify.
//  source: chat_service_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;

class ChatService_SendMessageRequest extends $pb.GeneratedMessage {
  factory ChatService_SendMessageRequest() => create();
  ChatService_SendMessageRequest._() : super();
  factory ChatService_SendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_SendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_SendMessageRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_SendMessageRequest clone() => ChatService_SendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_SendMessageRequest copyWith(void Function(ChatService_SendMessageRequest) updates) => super.copyWith((message) => updates(message as ChatService_SendMessageRequest)) as ChatService_SendMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_SendMessageRequest create() => ChatService_SendMessageRequest._();
  ChatService_SendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<ChatService_SendMessageRequest> createRepeated() => $pb.PbList<ChatService_SendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatService_SendMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_SendMessageRequest>(create);
  static ChatService_SendMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);
}

class ChatService_SendMessageStreamResponse extends $pb.GeneratedMessage {
  factory ChatService_SendMessageStreamResponse() => create();
  ChatService_SendMessageStreamResponse._() : super();
  factory ChatService_SendMessageStreamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_SendMessageStreamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_SendMessageStreamResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'sentAt', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_SendMessageStreamResponse clone() => ChatService_SendMessageStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_SendMessageStreamResponse copyWith(void Function(ChatService_SendMessageStreamResponse) updates) => super.copyWith((message) => updates(message as ChatService_SendMessageStreamResponse)) as ChatService_SendMessageStreamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_SendMessageStreamResponse create() => ChatService_SendMessageStreamResponse._();
  ChatService_SendMessageStreamResponse createEmptyInstance() => create();
  static $pb.PbList<ChatService_SendMessageStreamResponse> createRepeated() => $pb.PbList<ChatService_SendMessageStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatService_SendMessageStreamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_SendMessageStreamResponse>(create);
  static ChatService_SendMessageStreamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $3.Timestamp get sentAt => $_getN(1);
  @$pb.TagNumber(2)
  set sentAt($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasSentAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearSentAt() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureSentAt() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
