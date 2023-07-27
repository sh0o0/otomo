//
//  Generated code. Do not modify.
//  source: chat_with_otomo_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'message_with_otomo.pb.dart' as $4;

class ChatWithOtomoMessageToOtomoRequest extends $pb.GeneratedMessage {
  factory ChatWithOtomoMessageToOtomoRequest() => create();
  ChatWithOtomoMessageToOtomoRequest._() : super();
  factory ChatWithOtomoMessageToOtomoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatWithOtomoMessageToOtomoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatWithOtomoMessageToOtomoRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatWithOtomoMessageToOtomoRequest clone() => ChatWithOtomoMessageToOtomoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatWithOtomoMessageToOtomoRequest copyWith(void Function(ChatWithOtomoMessageToOtomoRequest) updates) => super.copyWith((message) => updates(message as ChatWithOtomoMessageToOtomoRequest)) as ChatWithOtomoMessageToOtomoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatWithOtomoMessageToOtomoRequest create() => ChatWithOtomoMessageToOtomoRequest._();
  ChatWithOtomoMessageToOtomoRequest createEmptyInstance() => create();
  static $pb.PbList<ChatWithOtomoMessageToOtomoRequest> createRepeated() => $pb.PbList<ChatWithOtomoMessageToOtomoRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatWithOtomoMessageToOtomoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatWithOtomoMessageToOtomoRequest>(create);
  static ChatWithOtomoMessageToOtomoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);
}

class ChatWithOtomoMessageToOtomoResponse extends $pb.GeneratedMessage {
  factory ChatWithOtomoMessageToOtomoResponse() => create();
  ChatWithOtomoMessageToOtomoResponse._() : super();
  factory ChatWithOtomoMessageToOtomoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatWithOtomoMessageToOtomoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatWithOtomoMessageToOtomoResponse', createEmptyInstance: create)
    ..aOM<$4.MessageWithOtomo>(1, _omitFieldNames ? '' : 'reply', subBuilder: $4.MessageWithOtomo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatWithOtomoMessageToOtomoResponse clone() => ChatWithOtomoMessageToOtomoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatWithOtomoMessageToOtomoResponse copyWith(void Function(ChatWithOtomoMessageToOtomoResponse) updates) => super.copyWith((message) => updates(message as ChatWithOtomoMessageToOtomoResponse)) as ChatWithOtomoMessageToOtomoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatWithOtomoMessageToOtomoResponse create() => ChatWithOtomoMessageToOtomoResponse._();
  ChatWithOtomoMessageToOtomoResponse createEmptyInstance() => create();
  static $pb.PbList<ChatWithOtomoMessageToOtomoResponse> createRepeated() => $pb.PbList<ChatWithOtomoMessageToOtomoResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatWithOtomoMessageToOtomoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatWithOtomoMessageToOtomoResponse>(create);
  static ChatWithOtomoMessageToOtomoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.MessageWithOtomo get reply => $_getN(0);
  @$pb.TagNumber(1)
  set reply($4.MessageWithOtomo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasReply() => $_has(0);
  @$pb.TagNumber(1)
  void clearReply() => clearField(1);
  @$pb.TagNumber(1)
  $4.MessageWithOtomo ensureReply() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
