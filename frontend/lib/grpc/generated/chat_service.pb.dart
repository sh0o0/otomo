//
//  Generated code. Do not modify.
//  source: chat_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/wrappers.pb.dart' as $4;
import 'message.pb.dart' as $5;

class ChatService_SendMessageRequest extends $pb.GeneratedMessage {
  factory ChatService_SendMessageRequest() => create();
  ChatService_SendMessageRequest._() : super();
  factory ChatService_SendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_SendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_SendMessageRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOM<$4.StringValue>(3, _omitFieldNames ? '' : 'clientId', subBuilder: $4.StringValue.create)
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
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  $4.StringValue get clientId => $_getN(2);
  @$pb.TagNumber(3)
  set clientId($4.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasClientId() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientId() => clearField(3);
  @$pb.TagNumber(3)
  $4.StringValue ensureClientId() => $_ensure(2);
}

class ChatService_SendMessageResponse extends $pb.GeneratedMessage {
  factory ChatService_SendMessageResponse() => create();
  ChatService_SendMessageResponse._() : super();
  factory ChatService_SendMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_SendMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_SendMessageResponse', createEmptyInstance: create)
    ..aOM<$5.Message>(1, _omitFieldNames ? '' : 'message', subBuilder: $5.Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_SendMessageResponse clone() => ChatService_SendMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_SendMessageResponse copyWith(void Function(ChatService_SendMessageResponse) updates) => super.copyWith((message) => updates(message as ChatService_SendMessageResponse)) as ChatService_SendMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_SendMessageResponse create() => ChatService_SendMessageResponse._();
  ChatService_SendMessageResponse createEmptyInstance() => create();
  static $pb.PbList<ChatService_SendMessageResponse> createRepeated() => $pb.PbList<ChatService_SendMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatService_SendMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_SendMessageResponse>(create);
  static ChatService_SendMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($5.Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  $5.Message ensureMessage() => $_ensure(0);
}

class ChatService_ListMessagesRequest extends $pb.GeneratedMessage {
  factory ChatService_ListMessagesRequest() => create();
  ChatService_ListMessagesRequest._() : super();
  factory ChatService_ListMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_ListMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_ListMessagesRequest', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'pageStartAfterMessageId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_ListMessagesRequest clone() => ChatService_ListMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_ListMessagesRequest copyWith(void Function(ChatService_ListMessagesRequest) updates) => super.copyWith((message) => updates(message as ChatService_ListMessagesRequest)) as ChatService_ListMessagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_ListMessagesRequest create() => ChatService_ListMessagesRequest._();
  ChatService_ListMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<ChatService_ListMessagesRequest> createRepeated() => $pb.PbList<ChatService_ListMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatService_ListMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_ListMessagesRequest>(create);
  static ChatService_ListMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get pageStartAfterMessageId => $_getSZ(1);
  @$pb.TagNumber(2)
  set pageStartAfterMessageId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageStartAfterMessageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageStartAfterMessageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);
}

class ChatService_ListMessagesResponse extends $pb.GeneratedMessage {
  factory ChatService_ListMessagesResponse() => create();
  ChatService_ListMessagesResponse._() : super();
  factory ChatService_ListMessagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_ListMessagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_ListMessagesResponse', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.OU3)
    ..aOB(2, _omitFieldNames ? '' : 'hasMore')
    ..pc<$5.Message>(3, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: $5.Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_ListMessagesResponse clone() => ChatService_ListMessagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_ListMessagesResponse copyWith(void Function(ChatService_ListMessagesResponse) updates) => super.copyWith((message) => updates(message as ChatService_ListMessagesResponse)) as ChatService_ListMessagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_ListMessagesResponse create() => ChatService_ListMessagesResponse._();
  ChatService_ListMessagesResponse createEmptyInstance() => create();
  static $pb.PbList<ChatService_ListMessagesResponse> createRepeated() => $pb.PbList<ChatService_ListMessagesResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatService_ListMessagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_ListMessagesResponse>(create);
  static ChatService_ListMessagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get hasMore => $_getBF(1);
  @$pb.TagNumber(2)
  set hasMore($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHasMore() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasMore() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$5.Message> get messages => $_getList(2);
}

class ChatService_AskToMessageRequest extends $pb.GeneratedMessage {
  factory ChatService_AskToMessageRequest() => create();
  ChatService_AskToMessageRequest._() : super();
  factory ChatService_AskToMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_AskToMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_AskToMessageRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_AskToMessageRequest clone() => ChatService_AskToMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_AskToMessageRequest copyWith(void Function(ChatService_AskToMessageRequest) updates) => super.copyWith((message) => updates(message as ChatService_AskToMessageRequest)) as ChatService_AskToMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_AskToMessageRequest create() => ChatService_AskToMessageRequest._();
  ChatService_AskToMessageRequest createEmptyInstance() => create();
  static $pb.PbList<ChatService_AskToMessageRequest> createRepeated() => $pb.PbList<ChatService_AskToMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatService_AskToMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_AskToMessageRequest>(create);
  static ChatService_AskToMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class ChatService_AskToMessageResponse extends $pb.GeneratedMessage {
  factory ChatService_AskToMessageResponse() => create();
  ChatService_AskToMessageResponse._() : super();
  factory ChatService_AskToMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_AskToMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_AskToMessageResponse', createEmptyInstance: create)
    ..aOM<$5.Message>(1, _omitFieldNames ? '' : 'message', subBuilder: $5.Message.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_AskToMessageResponse clone() => ChatService_AskToMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_AskToMessageResponse copyWith(void Function(ChatService_AskToMessageResponse) updates) => super.copyWith((message) => updates(message as ChatService_AskToMessageResponse)) as ChatService_AskToMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_AskToMessageResponse create() => ChatService_AskToMessageResponse._();
  ChatService_AskToMessageResponse createEmptyInstance() => create();
  static $pb.PbList<ChatService_AskToMessageResponse> createRepeated() => $pb.PbList<ChatService_AskToMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatService_AskToMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_AskToMessageResponse>(create);
  static ChatService_AskToMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.Message get message => $_getN(0);
  @$pb.TagNumber(1)
  set message($5.Message v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
  @$pb.TagNumber(1)
  $5.Message ensureMessage() => $_ensure(0);
}

class ChatService_MessagingStreamRequest extends $pb.GeneratedMessage {
  factory ChatService_MessagingStreamRequest() => create();
  ChatService_MessagingStreamRequest._() : super();
  factory ChatService_MessagingStreamRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_MessagingStreamRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_MessagingStreamRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_MessagingStreamRequest clone() => ChatService_MessagingStreamRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_MessagingStreamRequest copyWith(void Function(ChatService_MessagingStreamRequest) updates) => super.copyWith((message) => updates(message as ChatService_MessagingStreamRequest)) as ChatService_MessagingStreamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_MessagingStreamRequest create() => ChatService_MessagingStreamRequest._();
  ChatService_MessagingStreamRequest createEmptyInstance() => create();
  static $pb.PbList<ChatService_MessagingStreamRequest> createRepeated() => $pb.PbList<ChatService_MessagingStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatService_MessagingStreamRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_MessagingStreamRequest>(create);
  static ChatService_MessagingStreamRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class ChatService_MessagingStreamResponse extends $pb.GeneratedMessage {
  factory ChatService_MessagingStreamResponse() => create();
  ChatService_MessagingStreamResponse._() : super();
  factory ChatService_MessagingStreamResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatService_MessagingStreamResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatService_MessagingStreamResponse', createEmptyInstance: create)
    ..aOM<$5.MessageChunk>(1, _omitFieldNames ? '' : 'chunk', subBuilder: $5.MessageChunk.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatService_MessagingStreamResponse clone() => ChatService_MessagingStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatService_MessagingStreamResponse copyWith(void Function(ChatService_MessagingStreamResponse) updates) => super.copyWith((message) => updates(message as ChatService_MessagingStreamResponse)) as ChatService_MessagingStreamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatService_MessagingStreamResponse create() => ChatService_MessagingStreamResponse._();
  ChatService_MessagingStreamResponse createEmptyInstance() => create();
  static $pb.PbList<ChatService_MessagingStreamResponse> createRepeated() => $pb.PbList<ChatService_MessagingStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatService_MessagingStreamResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatService_MessagingStreamResponse>(create);
  static ChatService_MessagingStreamResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $5.MessageChunk get chunk => $_getN(0);
  @$pb.TagNumber(1)
  set chunk($5.MessageChunk v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunk() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunk() => clearField(1);
  @$pb.TagNumber(1)
  $5.MessageChunk ensureChunk() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
