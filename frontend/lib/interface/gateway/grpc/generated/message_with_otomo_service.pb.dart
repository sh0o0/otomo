//
//  Generated code. Do not modify.
//  source: message_with_otomo_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'message_with_otomo.pb.dart' as $4;

class MessageWithOtomoMessageToOtomoRequest extends $pb.GeneratedMessage {
  factory MessageWithOtomoMessageToOtomoRequest() => create();
  MessageWithOtomoMessageToOtomoRequest._() : super();
  factory MessageWithOtomoMessageToOtomoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageWithOtomoMessageToOtomoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageWithOtomoMessageToOtomoRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageWithOtomoMessageToOtomoRequest clone() => MessageWithOtomoMessageToOtomoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageWithOtomoMessageToOtomoRequest copyWith(void Function(MessageWithOtomoMessageToOtomoRequest) updates) => super.copyWith((message) => updates(message as MessageWithOtomoMessageToOtomoRequest)) as MessageWithOtomoMessageToOtomoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageWithOtomoMessageToOtomoRequest create() => MessageWithOtomoMessageToOtomoRequest._();
  MessageWithOtomoMessageToOtomoRequest createEmptyInstance() => create();
  static $pb.PbList<MessageWithOtomoMessageToOtomoRequest> createRepeated() => $pb.PbList<MessageWithOtomoMessageToOtomoRequest>();
  @$core.pragma('dart2js:noInline')
  static MessageWithOtomoMessageToOtomoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageWithOtomoMessageToOtomoRequest>(create);
  static MessageWithOtomoMessageToOtomoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);
}

class MessageWithOtomoMessageToOtomoResponse extends $pb.GeneratedMessage {
  factory MessageWithOtomoMessageToOtomoResponse() => create();
  MessageWithOtomoMessageToOtomoResponse._() : super();
  factory MessageWithOtomoMessageToOtomoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageWithOtomoMessageToOtomoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageWithOtomoMessageToOtomoResponse', createEmptyInstance: create)
    ..aOM<$4.MessageWithOtomo>(1, _omitFieldNames ? '' : 'reply', subBuilder: $4.MessageWithOtomo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageWithOtomoMessageToOtomoResponse clone() => MessageWithOtomoMessageToOtomoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageWithOtomoMessageToOtomoResponse copyWith(void Function(MessageWithOtomoMessageToOtomoResponse) updates) => super.copyWith((message) => updates(message as MessageWithOtomoMessageToOtomoResponse)) as MessageWithOtomoMessageToOtomoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageWithOtomoMessageToOtomoResponse create() => MessageWithOtomoMessageToOtomoResponse._();
  MessageWithOtomoMessageToOtomoResponse createEmptyInstance() => create();
  static $pb.PbList<MessageWithOtomoMessageToOtomoResponse> createRepeated() => $pb.PbList<MessageWithOtomoMessageToOtomoResponse>();
  @$core.pragma('dart2js:noInline')
  static MessageWithOtomoMessageToOtomoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageWithOtomoMessageToOtomoResponse>(create);
  static MessageWithOtomoMessageToOtomoResponse? _defaultInstance;

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
