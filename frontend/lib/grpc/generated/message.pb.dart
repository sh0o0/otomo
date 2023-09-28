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

import 'date.pb.dart' as $6;
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
    ..aOM<$4.StringValue>(3, _omitFieldNames ? '' : 'error', subBuilder: $4.StringValue.create)
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

  @$pb.TagNumber(3)
  $4.StringValue get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($4.StringValue v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  $4.StringValue ensureError() => $_ensure(2);
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

class MonthlySentCount extends $pb.GeneratedMessage {
  factory MonthlySentCount() => create();
  MonthlySentCount._() : super();
  factory MonthlySentCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonthlySentCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MonthlySentCount', createEmptyInstance: create)
    ..aOM<$6.YearMonth>(1, _omitFieldNames ? '' : 'yearMonth', subBuilder: $6.YearMonth.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..pc<DailySentCount>(3, _omitFieldNames ? '' : 'dailySentCount', $pb.PbFieldType.PM, subBuilder: DailySentCount.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonthlySentCount clone() => MonthlySentCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonthlySentCount copyWith(void Function(MonthlySentCount) updates) => super.copyWith((message) => updates(message as MonthlySentCount)) as MonthlySentCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonthlySentCount create() => MonthlySentCount._();
  MonthlySentCount createEmptyInstance() => create();
  static $pb.PbList<MonthlySentCount> createRepeated() => $pb.PbList<MonthlySentCount>();
  @$core.pragma('dart2js:noInline')
  static MonthlySentCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonthlySentCount>(create);
  static MonthlySentCount? _defaultInstance;

  @$pb.TagNumber(1)
  $6.YearMonth get yearMonth => $_getN(0);
  @$pb.TagNumber(1)
  set yearMonth($6.YearMonth v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasYearMonth() => $_has(0);
  @$pb.TagNumber(1)
  void clearYearMonth() => clearField(1);
  @$pb.TagNumber(1)
  $6.YearMonth ensureYearMonth() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<DailySentCount> get dailySentCount => $_getList(2);
}

class DailySentCount extends $pb.GeneratedMessage {
  factory DailySentCount() => create();
  DailySentCount._() : super();
  factory DailySentCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DailySentCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DailySentCount', createEmptyInstance: create)
    ..aOM<$6.Date>(1, _omitFieldNames ? '' : 'date', subBuilder: $6.Date.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DailySentCount clone() => DailySentCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DailySentCount copyWith(void Function(DailySentCount) updates) => super.copyWith((message) => updates(message as DailySentCount)) as DailySentCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DailySentCount create() => DailySentCount._();
  DailySentCount createEmptyInstance() => create();
  static $pb.PbList<DailySentCount> createRepeated() => $pb.PbList<DailySentCount>();
  @$core.pragma('dart2js:noInline')
  static DailySentCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DailySentCount>(create);
  static DailySentCount? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Date get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($6.Date v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
  @$pb.TagNumber(1)
  $6.Date ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class RemainingSendCount extends $pb.GeneratedMessage {
  factory RemainingSendCount() => create();
  RemainingSendCount._() : super();
  factory RemainingSendCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemainingSendCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemainingSendCount', createEmptyInstance: create)
    ..aOM<RemainingMonthlySendCount>(1, _omitFieldNames ? '' : 'monthly', subBuilder: RemainingMonthlySendCount.create)
    ..aOM<RemainingDailySendCount>(2, _omitFieldNames ? '' : 'daily', subBuilder: RemainingDailySendCount.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemainingSendCount clone() => RemainingSendCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemainingSendCount copyWith(void Function(RemainingSendCount) updates) => super.copyWith((message) => updates(message as RemainingSendCount)) as RemainingSendCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemainingSendCount create() => RemainingSendCount._();
  RemainingSendCount createEmptyInstance() => create();
  static $pb.PbList<RemainingSendCount> createRepeated() => $pb.PbList<RemainingSendCount>();
  @$core.pragma('dart2js:noInline')
  static RemainingSendCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemainingSendCount>(create);
  static RemainingSendCount? _defaultInstance;

  @$pb.TagNumber(1)
  RemainingMonthlySendCount get monthly => $_getN(0);
  @$pb.TagNumber(1)
  set monthly(RemainingMonthlySendCount v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonthly() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonthly() => clearField(1);
  @$pb.TagNumber(1)
  RemainingMonthlySendCount ensureMonthly() => $_ensure(0);

  @$pb.TagNumber(2)
  RemainingDailySendCount get daily => $_getN(1);
  @$pb.TagNumber(2)
  set daily(RemainingDailySendCount v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDaily() => $_has(1);
  @$pb.TagNumber(2)
  void clearDaily() => clearField(2);
  @$pb.TagNumber(2)
  RemainingDailySendCount ensureDaily() => $_ensure(1);
}

class RemainingMonthlySendCount extends $pb.GeneratedMessage {
  factory RemainingMonthlySendCount() => create();
  RemainingMonthlySendCount._() : super();
  factory RemainingMonthlySendCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemainingMonthlySendCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemainingMonthlySendCount', createEmptyInstance: create)
    ..aOM<$6.YearMonth>(1, _omitFieldNames ? '' : 'yearMonth', subBuilder: $6.YearMonth.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemainingMonthlySendCount clone() => RemainingMonthlySendCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemainingMonthlySendCount copyWith(void Function(RemainingMonthlySendCount) updates) => super.copyWith((message) => updates(message as RemainingMonthlySendCount)) as RemainingMonthlySendCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemainingMonthlySendCount create() => RemainingMonthlySendCount._();
  RemainingMonthlySendCount createEmptyInstance() => create();
  static $pb.PbList<RemainingMonthlySendCount> createRepeated() => $pb.PbList<RemainingMonthlySendCount>();
  @$core.pragma('dart2js:noInline')
  static RemainingMonthlySendCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemainingMonthlySendCount>(create);
  static RemainingMonthlySendCount? _defaultInstance;

  @$pb.TagNumber(1)
  $6.YearMonth get yearMonth => $_getN(0);
  @$pb.TagNumber(1)
  set yearMonth($6.YearMonth v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasYearMonth() => $_has(0);
  @$pb.TagNumber(1)
  void clearYearMonth() => clearField(1);
  @$pb.TagNumber(1)
  $6.YearMonth ensureYearMonth() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}

class RemainingDailySendCount extends $pb.GeneratedMessage {
  factory RemainingDailySendCount() => create();
  RemainingDailySendCount._() : super();
  factory RemainingDailySendCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemainingDailySendCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemainingDailySendCount', createEmptyInstance: create)
    ..aOM<$6.Date>(1, _omitFieldNames ? '' : 'date', subBuilder: $6.Date.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemainingDailySendCount clone() => RemainingDailySendCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemainingDailySendCount copyWith(void Function(RemainingDailySendCount) updates) => super.copyWith((message) => updates(message as RemainingDailySendCount)) as RemainingDailySendCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemainingDailySendCount create() => RemainingDailySendCount._();
  RemainingDailySendCount createEmptyInstance() => create();
  static $pb.PbList<RemainingDailySendCount> createRepeated() => $pb.PbList<RemainingDailySendCount>();
  @$core.pragma('dart2js:noInline')
  static RemainingDailySendCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemainingDailySendCount>(create);
  static RemainingDailySendCount? _defaultInstance;

  @$pb.TagNumber(1)
  $6.Date get date => $_getN(0);
  @$pb.TagNumber(1)
  set date($6.Date v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);
  @$pb.TagNumber(1)
  $6.Date ensureDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
