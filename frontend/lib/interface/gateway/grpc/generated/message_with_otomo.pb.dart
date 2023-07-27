//
//  Generated code. Do not modify.
//  source: message_with_otomo.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;
import 'message_with_otomo.pbenum.dart';

export 'message_with_otomo.pbenum.dart';

class MessageWithOtomo extends $pb.GeneratedMessage {
  factory MessageWithOtomo() => create();
  MessageWithOtomo._() : super();
  factory MessageWithOtomo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageWithOtomo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageWithOtomo', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..e<Role>(3, _omitFieldNames ? '' : 'sender', $pb.PbFieldType.OE, defaultOrMaker: Role.User, valueOf: Role.valueOf, enumValues: Role.values)
    ..e<Role>(4, _omitFieldNames ? '' : 'reciever', $pb.PbFieldType.OE, defaultOrMaker: Role.User, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOS(5, _omitFieldNames ? '' : 'text')
    ..aOM<$3.Timestamp>(6, _omitFieldNames ? '' : 'sentAt', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageWithOtomo clone() => MessageWithOtomo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageWithOtomo copyWith(void Function(MessageWithOtomo) updates) => super.copyWith((message) => updates(message as MessageWithOtomo)) as MessageWithOtomo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageWithOtomo create() => MessageWithOtomo._();
  MessageWithOtomo createEmptyInstance() => create();
  static $pb.PbList<MessageWithOtomo> createRepeated() => $pb.PbList<MessageWithOtomo>();
  @$core.pragma('dart2js:noInline')
  static MessageWithOtomo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageWithOtomo>(create);
  static MessageWithOtomo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  Role get sender => $_getN(2);
  @$pb.TagNumber(3)
  set sender(Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSender() => $_has(2);
  @$pb.TagNumber(3)
  void clearSender() => clearField(3);

  @$pb.TagNumber(4)
  Role get reciever => $_getN(3);
  @$pb.TagNumber(4)
  set reciever(Role v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReciever() => $_has(3);
  @$pb.TagNumber(4)
  void clearReciever() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get text => $_getSZ(4);
  @$pb.TagNumber(5)
  set text($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasText() => $_has(4);
  @$pb.TagNumber(5)
  void clearText() => clearField(5);

  @$pb.TagNumber(6)
  $3.Timestamp get sentAt => $_getN(5);
  @$pb.TagNumber(6)
  set sentAt($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSentAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearSentAt() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureSentAt() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
