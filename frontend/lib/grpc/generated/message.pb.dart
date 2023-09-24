//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $3;
import 'google/protobuf/wrappers.pb.dart' as $4;
import 'location.pb.dart' as $5;
import 'message.pbenum.dart';

export 'message.pbenum.dart';

class Message extends $pb.GeneratedMessage {
  factory Message() => create();
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..e<Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.UNKNOWN, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'sentAt', subBuilder: $3.Timestamp.create)
    ..aOM<$4.StringValue>(5, _omitFieldNames ? '' : 'clientId', subBuilder: $4.StringValue.create)
    ..aOM<LocationAnalysis>(6, _omitFieldNames ? '' : 'locationAnalysis', subBuilder: LocationAnalysis.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get sentAt => $_getN(3);
  @$pb.TagNumber(4)
  set sentAt($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentAt() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureSentAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.StringValue get clientId => $_getN(4);
  @$pb.TagNumber(5)
  set clientId($4.StringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasClientId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClientId() => clearField(5);
  @$pb.TagNumber(5)
  $4.StringValue ensureClientId() => $_ensure(4);

  @$pb.TagNumber(6)
  LocationAnalysis get locationAnalysis => $_getN(5);
  @$pb.TagNumber(6)
  set locationAnalysis(LocationAnalysis v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLocationAnalysis() => $_has(5);
  @$pb.TagNumber(6)
  void clearLocationAnalysis() => clearField(6);
  @$pb.TagNumber(6)
  LocationAnalysis ensureLocationAnalysis() => $_ensure(5);
}

class MessageChunk extends $pb.GeneratedMessage {
  factory MessageChunk() => create();
  MessageChunk._() : super();
  factory MessageChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageChunk', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..e<Role>(3, _omitFieldNames ? '' : 'role', $pb.PbFieldType.OE, defaultOrMaker: Role.UNKNOWN, valueOf: Role.valueOf, enumValues: Role.values)
    ..aOM<$3.Timestamp>(4, _omitFieldNames ? '' : 'sentAt', subBuilder: $3.Timestamp.create)
    ..aOM<$4.StringValue>(5, _omitFieldNames ? '' : 'clientId', subBuilder: $4.StringValue.create)
    ..aOB(6, _omitFieldNames ? '' : 'isLast')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageChunk clone() => MessageChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageChunk copyWith(void Function(MessageChunk) updates) => super.copyWith((message) => updates(message as MessageChunk)) as MessageChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageChunk create() => MessageChunk._();
  MessageChunk createEmptyInstance() => create();
  static $pb.PbList<MessageChunk> createRepeated() => $pb.PbList<MessageChunk>();
  @$core.pragma('dart2js:noInline')
  static MessageChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageChunk>(create);
  static MessageChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  @$pb.TagNumber(3)
  Role get role => $_getN(2);
  @$pb.TagNumber(3)
  set role(Role v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRole() => $_has(2);
  @$pb.TagNumber(3)
  void clearRole() => clearField(3);

  @$pb.TagNumber(4)
  $3.Timestamp get sentAt => $_getN(3);
  @$pb.TagNumber(4)
  set sentAt($3.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSentAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearSentAt() => clearField(4);
  @$pb.TagNumber(4)
  $3.Timestamp ensureSentAt() => $_ensure(3);

  @$pb.TagNumber(5)
  $4.StringValue get clientId => $_getN(4);
  @$pb.TagNumber(5)
  set clientId($4.StringValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasClientId() => $_has(4);
  @$pb.TagNumber(5)
  void clearClientId() => clearField(5);
  @$pb.TagNumber(5)
  $4.StringValue ensureClientId() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.bool get isLast => $_getBF(5);
  @$pb.TagNumber(6)
  set isLast($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsLast() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsLast() => clearField(6);
}

class LocationAnalysis extends $pb.GeneratedMessage {
  factory LocationAnalysis() => create();
  LocationAnalysis._() : super();
  factory LocationAnalysis.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocationAnalysis.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocationAnalysis', createEmptyInstance: create)
    ..pc<AnalyzedLocation>(1, _omitFieldNames ? '' : 'locations', $pb.PbFieldType.PM, subBuilder: AnalyzedLocation.create)
    ..aOM<$3.Timestamp>(2, _omitFieldNames ? '' : 'analyzedAt', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocationAnalysis clone() => LocationAnalysis()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocationAnalysis copyWith(void Function(LocationAnalysis) updates) => super.copyWith((message) => updates(message as LocationAnalysis)) as LocationAnalysis;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocationAnalysis create() => LocationAnalysis._();
  LocationAnalysis createEmptyInstance() => create();
  static $pb.PbList<LocationAnalysis> createRepeated() => $pb.PbList<LocationAnalysis>();
  @$core.pragma('dart2js:noInline')
  static LocationAnalysis getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocationAnalysis>(create);
  static LocationAnalysis? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AnalyzedLocation> get locations => $_getList(0);

  @$pb.TagNumber(2)
  $3.Timestamp get analyzedAt => $_getN(1);
  @$pb.TagNumber(2)
  set analyzedAt($3.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAnalyzedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAnalyzedAt() => clearField(2);
  @$pb.TagNumber(2)
  $3.Timestamp ensureAnalyzedAt() => $_ensure(1);
}

class AnalyzedLocation extends $pb.GeneratedMessage {
  factory AnalyzedLocation() => create();
  AnalyzedLocation._() : super();
  factory AnalyzedLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AnalyzedLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AnalyzedLocation', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'text')
    ..aOM<$5.Location>(2, _omitFieldNames ? '' : 'location', subBuilder: $5.Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AnalyzedLocation clone() => AnalyzedLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AnalyzedLocation copyWith(void Function(AnalyzedLocation) updates) => super.copyWith((message) => updates(message as AnalyzedLocation)) as AnalyzedLocation;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AnalyzedLocation create() => AnalyzedLocation._();
  AnalyzedLocation createEmptyInstance() => create();
  static $pb.PbList<AnalyzedLocation> createRepeated() => $pb.PbList<AnalyzedLocation>();
  @$core.pragma('dart2js:noInline')
  static AnalyzedLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AnalyzedLocation>(create);
  static AnalyzedLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get text => $_getSZ(0);
  @$pb.TagNumber(1)
  set text($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasText() => $_has(0);
  @$pb.TagNumber(1)
  void clearText() => clearField(1);

  @$pb.TagNumber(2)
  $5.Location get location => $_getN(1);
  @$pb.TagNumber(2)
  set location($5.Location v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocation() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocation() => clearField(2);
  @$pb.TagNumber(2)
  $5.Location ensureLocation() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
