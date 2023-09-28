//
//  Generated code. Do not modify.
//  source: message_send_count.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'date.pb.dart' as $6;

class MessageSentCount extends $pb.GeneratedMessage {
  factory MessageSentCount() => create();
  MessageSentCount._() : super();
  factory MessageSentCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageSentCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MessageSentCount', createEmptyInstance: create)
    ..aOM<MonthlySurplusMessageSentCount>(1, _omitFieldNames ? '' : 'monthlySurplus', subBuilder: MonthlySurplusMessageSentCount.create)
    ..aOM<DailyMessageSentCount>(2, _omitFieldNames ? '' : 'daily', subBuilder: DailyMessageSentCount.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageSentCount clone() => MessageSentCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageSentCount copyWith(void Function(MessageSentCount) updates) => super.copyWith((message) => updates(message as MessageSentCount)) as MessageSentCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageSentCount create() => MessageSentCount._();
  MessageSentCount createEmptyInstance() => create();
  static $pb.PbList<MessageSentCount> createRepeated() => $pb.PbList<MessageSentCount>();
  @$core.pragma('dart2js:noInline')
  static MessageSentCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageSentCount>(create);
  static MessageSentCount? _defaultInstance;

  @$pb.TagNumber(1)
  MonthlySurplusMessageSentCount get monthlySurplus => $_getN(0);
  @$pb.TagNumber(1)
  set monthlySurplus(MonthlySurplusMessageSentCount v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonthlySurplus() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonthlySurplus() => clearField(1);
  @$pb.TagNumber(1)
  MonthlySurplusMessageSentCount ensureMonthlySurplus() => $_ensure(0);

  @$pb.TagNumber(2)
  DailyMessageSentCount get daily => $_getN(1);
  @$pb.TagNumber(2)
  set daily(DailyMessageSentCount v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDaily() => $_has(1);
  @$pb.TagNumber(2)
  void clearDaily() => clearField(2);
  @$pb.TagNumber(2)
  DailyMessageSentCount ensureDaily() => $_ensure(1);
}

class MonthlySurplusMessageSentCount extends $pb.GeneratedMessage {
  factory MonthlySurplusMessageSentCount() => create();
  MonthlySurplusMessageSentCount._() : super();
  factory MonthlySurplusMessageSentCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MonthlySurplusMessageSentCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'MonthlySurplusMessageSentCount', createEmptyInstance: create)
    ..aOM<$6.YearMonth>(1, _omitFieldNames ? '' : 'yearMonth', subBuilder: $6.YearMonth.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MonthlySurplusMessageSentCount clone() => MonthlySurplusMessageSentCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MonthlySurplusMessageSentCount copyWith(void Function(MonthlySurplusMessageSentCount) updates) => super.copyWith((message) => updates(message as MonthlySurplusMessageSentCount)) as MonthlySurplusMessageSentCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MonthlySurplusMessageSentCount create() => MonthlySurplusMessageSentCount._();
  MonthlySurplusMessageSentCount createEmptyInstance() => create();
  static $pb.PbList<MonthlySurplusMessageSentCount> createRepeated() => $pb.PbList<MonthlySurplusMessageSentCount>();
  @$core.pragma('dart2js:noInline')
  static MonthlySurplusMessageSentCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MonthlySurplusMessageSentCount>(create);
  static MonthlySurplusMessageSentCount? _defaultInstance;

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

class DailyMessageSentCount extends $pb.GeneratedMessage {
  factory DailyMessageSentCount() => create();
  DailyMessageSentCount._() : super();
  factory DailyMessageSentCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DailyMessageSentCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DailyMessageSentCount', createEmptyInstance: create)
    ..aOM<$6.Date>(1, _omitFieldNames ? '' : 'date', subBuilder: $6.Date.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DailyMessageSentCount clone() => DailyMessageSentCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DailyMessageSentCount copyWith(void Function(DailyMessageSentCount) updates) => super.copyWith((message) => updates(message as DailyMessageSentCount)) as DailyMessageSentCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DailyMessageSentCount create() => DailyMessageSentCount._();
  DailyMessageSentCount createEmptyInstance() => create();
  static $pb.PbList<DailyMessageSentCount> createRepeated() => $pb.PbList<DailyMessageSentCount>();
  @$core.pragma('dart2js:noInline')
  static DailyMessageSentCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DailyMessageSentCount>(create);
  static DailyMessageSentCount? _defaultInstance;

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

class RemainingMessageSendCount extends $pb.GeneratedMessage {
  factory RemainingMessageSendCount() => create();
  RemainingMessageSendCount._() : super();
  factory RemainingMessageSendCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemainingMessageSendCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemainingMessageSendCount', createEmptyInstance: create)
    ..aOM<RemainingMonthlySurplusMessageSendCount>(1, _omitFieldNames ? '' : 'monthlySurplus', subBuilder: RemainingMonthlySurplusMessageSendCount.create)
    ..aOM<RemainingDailyMessageSendCount>(2, _omitFieldNames ? '' : 'daily', subBuilder: RemainingDailyMessageSendCount.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemainingMessageSendCount clone() => RemainingMessageSendCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemainingMessageSendCount copyWith(void Function(RemainingMessageSendCount) updates) => super.copyWith((message) => updates(message as RemainingMessageSendCount)) as RemainingMessageSendCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemainingMessageSendCount create() => RemainingMessageSendCount._();
  RemainingMessageSendCount createEmptyInstance() => create();
  static $pb.PbList<RemainingMessageSendCount> createRepeated() => $pb.PbList<RemainingMessageSendCount>();
  @$core.pragma('dart2js:noInline')
  static RemainingMessageSendCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemainingMessageSendCount>(create);
  static RemainingMessageSendCount? _defaultInstance;

  @$pb.TagNumber(1)
  RemainingMonthlySurplusMessageSendCount get monthlySurplus => $_getN(0);
  @$pb.TagNumber(1)
  set monthlySurplus(RemainingMonthlySurplusMessageSendCount v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMonthlySurplus() => $_has(0);
  @$pb.TagNumber(1)
  void clearMonthlySurplus() => clearField(1);
  @$pb.TagNumber(1)
  RemainingMonthlySurplusMessageSendCount ensureMonthlySurplus() => $_ensure(0);

  @$pb.TagNumber(2)
  RemainingDailyMessageSendCount get daily => $_getN(1);
  @$pb.TagNumber(2)
  set daily(RemainingDailyMessageSendCount v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDaily() => $_has(1);
  @$pb.TagNumber(2)
  void clearDaily() => clearField(2);
  @$pb.TagNumber(2)
  RemainingDailyMessageSendCount ensureDaily() => $_ensure(1);
}

class RemainingMonthlySurplusMessageSendCount extends $pb.GeneratedMessage {
  factory RemainingMonthlySurplusMessageSendCount() => create();
  RemainingMonthlySurplusMessageSendCount._() : super();
  factory RemainingMonthlySurplusMessageSendCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemainingMonthlySurplusMessageSendCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemainingMonthlySurplusMessageSendCount', createEmptyInstance: create)
    ..aOM<$6.YearMonth>(1, _omitFieldNames ? '' : 'yearMonth', subBuilder: $6.YearMonth.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemainingMonthlySurplusMessageSendCount clone() => RemainingMonthlySurplusMessageSendCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemainingMonthlySurplusMessageSendCount copyWith(void Function(RemainingMonthlySurplusMessageSendCount) updates) => super.copyWith((message) => updates(message as RemainingMonthlySurplusMessageSendCount)) as RemainingMonthlySurplusMessageSendCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemainingMonthlySurplusMessageSendCount create() => RemainingMonthlySurplusMessageSendCount._();
  RemainingMonthlySurplusMessageSendCount createEmptyInstance() => create();
  static $pb.PbList<RemainingMonthlySurplusMessageSendCount> createRepeated() => $pb.PbList<RemainingMonthlySurplusMessageSendCount>();
  @$core.pragma('dart2js:noInline')
  static RemainingMonthlySurplusMessageSendCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemainingMonthlySurplusMessageSendCount>(create);
  static RemainingMonthlySurplusMessageSendCount? _defaultInstance;

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

class RemainingDailyMessageSendCount extends $pb.GeneratedMessage {
  factory RemainingDailyMessageSendCount() => create();
  RemainingDailyMessageSendCount._() : super();
  factory RemainingDailyMessageSendCount.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemainingDailyMessageSendCount.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemainingDailyMessageSendCount', createEmptyInstance: create)
    ..aOM<$6.Date>(1, _omitFieldNames ? '' : 'date', subBuilder: $6.Date.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemainingDailyMessageSendCount clone() => RemainingDailyMessageSendCount()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemainingDailyMessageSendCount copyWith(void Function(RemainingDailyMessageSendCount) updates) => super.copyWith((message) => updates(message as RemainingDailyMessageSendCount)) as RemainingDailyMessageSendCount;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemainingDailyMessageSendCount create() => RemainingDailyMessageSendCount._();
  RemainingDailyMessageSendCount createEmptyInstance() => create();
  static $pb.PbList<RemainingDailyMessageSendCount> createRepeated() => $pb.PbList<RemainingDailyMessageSendCount>();
  @$core.pragma('dart2js:noInline')
  static RemainingDailyMessageSendCount getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemainingDailyMessageSendCount>(create);
  static RemainingDailyMessageSendCount? _defaultInstance;

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
