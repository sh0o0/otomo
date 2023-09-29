// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_send_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageSentCount _$MessageSentCountFromJson(Map<String, dynamic> json) {
  return _MessageSentCount.fromJson(json);
}

/// @nodoc
mixin _$MessageSentCount {
  MonthlySurplusMessageSentCount get monthlySurplus =>
      throw _privateConstructorUsedError;
  DailyMessageSentCount get daily => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageSentCountCopyWith<MessageSentCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageSentCountCopyWith<$Res> {
  factory $MessageSentCountCopyWith(
          MessageSentCount value, $Res Function(MessageSentCount) then) =
      _$MessageSentCountCopyWithImpl<$Res, MessageSentCount>;
  @useResult
  $Res call(
      {MonthlySurplusMessageSentCount monthlySurplus,
      DailyMessageSentCount daily});

  $MonthlySurplusMessageSentCountCopyWith<$Res> get monthlySurplus;
  $DailyMessageSentCountCopyWith<$Res> get daily;
}

/// @nodoc
class _$MessageSentCountCopyWithImpl<$Res, $Val extends MessageSentCount>
    implements $MessageSentCountCopyWith<$Res> {
  _$MessageSentCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySurplus = null,
    Object? daily = null,
  }) {
    return _then(_value.copyWith(
      monthlySurplus: null == monthlySurplus
          ? _value.monthlySurplus
          : monthlySurplus // ignore: cast_nullable_to_non_nullable
              as MonthlySurplusMessageSentCount,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as DailyMessageSentCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MonthlySurplusMessageSentCountCopyWith<$Res> get monthlySurplus {
    return $MonthlySurplusMessageSentCountCopyWith<$Res>(_value.monthlySurplus,
        (value) {
      return _then(_value.copyWith(monthlySurplus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DailyMessageSentCountCopyWith<$Res> get daily {
    return $DailyMessageSentCountCopyWith<$Res>(_value.daily, (value) {
      return _then(_value.copyWith(daily: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageSentCountCopyWith<$Res>
    implements $MessageSentCountCopyWith<$Res> {
  factory _$$_MessageSentCountCopyWith(
          _$_MessageSentCount value, $Res Function(_$_MessageSentCount) then) =
      __$$_MessageSentCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MonthlySurplusMessageSentCount monthlySurplus,
      DailyMessageSentCount daily});

  @override
  $MonthlySurplusMessageSentCountCopyWith<$Res> get monthlySurplus;
  @override
  $DailyMessageSentCountCopyWith<$Res> get daily;
}

/// @nodoc
class __$$_MessageSentCountCopyWithImpl<$Res>
    extends _$MessageSentCountCopyWithImpl<$Res, _$_MessageSentCount>
    implements _$$_MessageSentCountCopyWith<$Res> {
  __$$_MessageSentCountCopyWithImpl(
      _$_MessageSentCount _value, $Res Function(_$_MessageSentCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySurplus = null,
    Object? daily = null,
  }) {
    return _then(_$_MessageSentCount(
      monthlySurplus: null == monthlySurplus
          ? _value.monthlySurplus
          : monthlySurplus // ignore: cast_nullable_to_non_nullable
              as MonthlySurplusMessageSentCount,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as DailyMessageSentCount,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MessageSentCount implements _MessageSentCount {
  const _$_MessageSentCount(
      {required this.monthlySurplus, required this.daily});

  factory _$_MessageSentCount.fromJson(Map<String, dynamic> json) =>
      _$$_MessageSentCountFromJson(json);

  @override
  final MonthlySurplusMessageSentCount monthlySurplus;
  @override
  final DailyMessageSentCount daily;

  @override
  String toString() {
    return 'MessageSentCount(monthlySurplus: $monthlySurplus, daily: $daily)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageSentCount &&
            (identical(other.monthlySurplus, monthlySurplus) ||
                other.monthlySurplus == monthlySurplus) &&
            (identical(other.daily, daily) || other.daily == daily));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, monthlySurplus, daily);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageSentCountCopyWith<_$_MessageSentCount> get copyWith =>
      __$$_MessageSentCountCopyWithImpl<_$_MessageSentCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageSentCountToJson(
      this,
    );
  }
}

abstract class _MessageSentCount implements MessageSentCount {
  const factory _MessageSentCount(
      {required final MonthlySurplusMessageSentCount monthlySurplus,
      required final DailyMessageSentCount daily}) = _$_MessageSentCount;

  factory _MessageSentCount.fromJson(Map<String, dynamic> json) =
      _$_MessageSentCount.fromJson;

  @override
  MonthlySurplusMessageSentCount get monthlySurplus;
  @override
  DailyMessageSentCount get daily;
  @override
  @JsonKey(ignore: true)
  _$$_MessageSentCountCopyWith<_$_MessageSentCount> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlySurplusMessageSentCount _$MonthlySurplusMessageSentCountFromJson(
    Map<String, dynamic> json) {
  return _MonthlySurplusMessageSentCount.fromJson(json);
}

/// @nodoc
mixin _$MonthlySurplusMessageSentCount {
  YearMonth get yearMonth => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlySurplusMessageSentCountCopyWith<MonthlySurplusMessageSentCount>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySurplusMessageSentCountCopyWith<$Res> {
  factory $MonthlySurplusMessageSentCountCopyWith(
          MonthlySurplusMessageSentCount value,
          $Res Function(MonthlySurplusMessageSentCount) then) =
      _$MonthlySurplusMessageSentCountCopyWithImpl<$Res,
          MonthlySurplusMessageSentCount>;
  @useResult
  $Res call({YearMonth yearMonth, int count});

  $YearMonthCopyWith<$Res> get yearMonth;
}

/// @nodoc
class _$MonthlySurplusMessageSentCountCopyWithImpl<$Res,
        $Val extends MonthlySurplusMessageSentCount>
    implements $MonthlySurplusMessageSentCountCopyWith<$Res> {
  _$MonthlySurplusMessageSentCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearMonth = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      yearMonth: null == yearMonth
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as YearMonth,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YearMonthCopyWith<$Res> get yearMonth {
    return $YearMonthCopyWith<$Res>(_value.yearMonth, (value) {
      return _then(_value.copyWith(yearMonth: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MonthlySurplusMessageSentCountCopyWith<$Res>
    implements $MonthlySurplusMessageSentCountCopyWith<$Res> {
  factory _$$_MonthlySurplusMessageSentCountCopyWith(
          _$_MonthlySurplusMessageSentCount value,
          $Res Function(_$_MonthlySurplusMessageSentCount) then) =
      __$$_MonthlySurplusMessageSentCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({YearMonth yearMonth, int count});

  @override
  $YearMonthCopyWith<$Res> get yearMonth;
}

/// @nodoc
class __$$_MonthlySurplusMessageSentCountCopyWithImpl<$Res>
    extends _$MonthlySurplusMessageSentCountCopyWithImpl<$Res,
        _$_MonthlySurplusMessageSentCount>
    implements _$$_MonthlySurplusMessageSentCountCopyWith<$Res> {
  __$$_MonthlySurplusMessageSentCountCopyWithImpl(
      _$_MonthlySurplusMessageSentCount _value,
      $Res Function(_$_MonthlySurplusMessageSentCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearMonth = null,
    Object? count = null,
  }) {
    return _then(_$_MonthlySurplusMessageSentCount(
      yearMonth: null == yearMonth
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as YearMonth,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_MonthlySurplusMessageSentCount
    implements _MonthlySurplusMessageSentCount {
  const _$_MonthlySurplusMessageSentCount(
      {required this.yearMonth, required this.count});

  factory _$_MonthlySurplusMessageSentCount.fromJson(
          Map<String, dynamic> json) =>
      _$$_MonthlySurplusMessageSentCountFromJson(json);

  @override
  final YearMonth yearMonth;
  @override
  final int count;

  @override
  String toString() {
    return 'MonthlySurplusMessageSentCount(yearMonth: $yearMonth, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MonthlySurplusMessageSentCount &&
            (identical(other.yearMonth, yearMonth) ||
                other.yearMonth == yearMonth) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, yearMonth, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MonthlySurplusMessageSentCountCopyWith<_$_MonthlySurplusMessageSentCount>
      get copyWith => __$$_MonthlySurplusMessageSentCountCopyWithImpl<
          _$_MonthlySurplusMessageSentCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MonthlySurplusMessageSentCountToJson(
      this,
    );
  }
}

abstract class _MonthlySurplusMessageSentCount
    implements MonthlySurplusMessageSentCount {
  const factory _MonthlySurplusMessageSentCount(
      {required final YearMonth yearMonth,
      required final int count}) = _$_MonthlySurplusMessageSentCount;

  factory _MonthlySurplusMessageSentCount.fromJson(Map<String, dynamic> json) =
      _$_MonthlySurplusMessageSentCount.fromJson;

  @override
  YearMonth get yearMonth;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_MonthlySurplusMessageSentCountCopyWith<_$_MonthlySurplusMessageSentCount>
      get copyWith => throw _privateConstructorUsedError;
}

DailyMessageSentCount _$DailyMessageSentCountFromJson(
    Map<String, dynamic> json) {
  return _DailyMessageSentCount.fromJson(json);
}

/// @nodoc
mixin _$DailyMessageSentCount {
  Date get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyMessageSentCountCopyWith<DailyMessageSentCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMessageSentCountCopyWith<$Res> {
  factory $DailyMessageSentCountCopyWith(DailyMessageSentCount value,
          $Res Function(DailyMessageSentCount) then) =
      _$DailyMessageSentCountCopyWithImpl<$Res, DailyMessageSentCount>;
  @useResult
  $Res call({Date date, int count});

  $DateCopyWith<$Res> get date;
}

/// @nodoc
class _$DailyMessageSentCountCopyWithImpl<$Res,
        $Val extends DailyMessageSentCount>
    implements $DailyMessageSentCountCopyWith<$Res> {
  _$DailyMessageSentCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateCopyWith<$Res> get date {
    return $DateCopyWith<$Res>(_value.date, (value) {
      return _then(_value.copyWith(date: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DailyMessageSentCountCopyWith<$Res>
    implements $DailyMessageSentCountCopyWith<$Res> {
  factory _$$_DailyMessageSentCountCopyWith(_$_DailyMessageSentCount value,
          $Res Function(_$_DailyMessageSentCount) then) =
      __$$_DailyMessageSentCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Date date, int count});

  @override
  $DateCopyWith<$Res> get date;
}

/// @nodoc
class __$$_DailyMessageSentCountCopyWithImpl<$Res>
    extends _$DailyMessageSentCountCopyWithImpl<$Res, _$_DailyMessageSentCount>
    implements _$$_DailyMessageSentCountCopyWith<$Res> {
  __$$_DailyMessageSentCountCopyWithImpl(_$_DailyMessageSentCount _value,
      $Res Function(_$_DailyMessageSentCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_$_DailyMessageSentCount(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_DailyMessageSentCount implements _DailyMessageSentCount {
  const _$_DailyMessageSentCount({required this.date, required this.count});

  factory _$_DailyMessageSentCount.fromJson(Map<String, dynamic> json) =>
      _$$_DailyMessageSentCountFromJson(json);

  @override
  final Date date;
  @override
  final int count;

  @override
  String toString() {
    return 'DailyMessageSentCount(date: $date, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyMessageSentCount &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyMessageSentCountCopyWith<_$_DailyMessageSentCount> get copyWith =>
      __$$_DailyMessageSentCountCopyWithImpl<_$_DailyMessageSentCount>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyMessageSentCountToJson(
      this,
    );
  }
}

abstract class _DailyMessageSentCount implements DailyMessageSentCount {
  const factory _DailyMessageSentCount(
      {required final Date date,
      required final int count}) = _$_DailyMessageSentCount;

  factory _DailyMessageSentCount.fromJson(Map<String, dynamic> json) =
      _$_DailyMessageSentCount.fromJson;

  @override
  Date get date;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_DailyMessageSentCountCopyWith<_$_DailyMessageSentCount> get copyWith =>
      throw _privateConstructorUsedError;
}

RemainingMessageSendCount _$RemainingMessageSendCountFromJson(
    Map<String, dynamic> json) {
  return _RemainingMessageSendCount.fromJson(json);
}

/// @nodoc
mixin _$RemainingMessageSendCount {
  RemainingMonthlySurplusMessageSendCount get monthlySurplus =>
      throw _privateConstructorUsedError;
  RemainingDailyMessageSendCount get daily =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemainingMessageSendCountCopyWith<RemainingMessageSendCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemainingMessageSendCountCopyWith<$Res> {
  factory $RemainingMessageSendCountCopyWith(RemainingMessageSendCount value,
          $Res Function(RemainingMessageSendCount) then) =
      _$RemainingMessageSendCountCopyWithImpl<$Res, RemainingMessageSendCount>;
  @useResult
  $Res call(
      {RemainingMonthlySurplusMessageSendCount monthlySurplus,
      RemainingDailyMessageSendCount daily});

  $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> get monthlySurplus;
  $RemainingDailyMessageSendCountCopyWith<$Res> get daily;
}

/// @nodoc
class _$RemainingMessageSendCountCopyWithImpl<$Res,
        $Val extends RemainingMessageSendCount>
    implements $RemainingMessageSendCountCopyWith<$Res> {
  _$RemainingMessageSendCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySurplus = null,
    Object? daily = null,
  }) {
    return _then(_value.copyWith(
      monthlySurplus: null == monthlySurplus
          ? _value.monthlySurplus
          : monthlySurplus // ignore: cast_nullable_to_non_nullable
              as RemainingMonthlySurplusMessageSendCount,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as RemainingDailyMessageSendCount,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> get monthlySurplus {
    return $RemainingMonthlySurplusMessageSendCountCopyWith<$Res>(
        _value.monthlySurplus, (value) {
      return _then(_value.copyWith(monthlySurplus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RemainingDailyMessageSendCountCopyWith<$Res> get daily {
    return $RemainingDailyMessageSendCountCopyWith<$Res>(_value.daily, (value) {
      return _then(_value.copyWith(daily: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RemainingMessageSendCountCopyWith<$Res>
    implements $RemainingMessageSendCountCopyWith<$Res> {
  factory _$$_RemainingMessageSendCountCopyWith(
          _$_RemainingMessageSendCount value,
          $Res Function(_$_RemainingMessageSendCount) then) =
      __$$_RemainingMessageSendCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RemainingMonthlySurplusMessageSendCount monthlySurplus,
      RemainingDailyMessageSendCount daily});

  @override
  $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> get monthlySurplus;
  @override
  $RemainingDailyMessageSendCountCopyWith<$Res> get daily;
}

/// @nodoc
class __$$_RemainingMessageSendCountCopyWithImpl<$Res>
    extends _$RemainingMessageSendCountCopyWithImpl<$Res,
        _$_RemainingMessageSendCount>
    implements _$$_RemainingMessageSendCountCopyWith<$Res> {
  __$$_RemainingMessageSendCountCopyWithImpl(
      _$_RemainingMessageSendCount _value,
      $Res Function(_$_RemainingMessageSendCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySurplus = null,
    Object? daily = null,
  }) {
    return _then(_$_RemainingMessageSendCount(
      monthlySurplus: null == monthlySurplus
          ? _value.monthlySurplus
          : monthlySurplus // ignore: cast_nullable_to_non_nullable
              as RemainingMonthlySurplusMessageSendCount,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as RemainingDailyMessageSendCount,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RemainingMessageSendCount implements _RemainingMessageSendCount {
  const _$_RemainingMessageSendCount(
      {required this.monthlySurplus, required this.daily});

  factory _$_RemainingMessageSendCount.fromJson(Map<String, dynamic> json) =>
      _$$_RemainingMessageSendCountFromJson(json);

  @override
  final RemainingMonthlySurplusMessageSendCount monthlySurplus;
  @override
  final RemainingDailyMessageSendCount daily;

  @override
  String toString() {
    return 'RemainingMessageSendCount(monthlySurplus: $monthlySurplus, daily: $daily)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemainingMessageSendCount &&
            (identical(other.monthlySurplus, monthlySurplus) ||
                other.monthlySurplus == monthlySurplus) &&
            (identical(other.daily, daily) || other.daily == daily));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, monthlySurplus, daily);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemainingMessageSendCountCopyWith<_$_RemainingMessageSendCount>
      get copyWith => __$$_RemainingMessageSendCountCopyWithImpl<
          _$_RemainingMessageSendCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemainingMessageSendCountToJson(
      this,
    );
  }
}

abstract class _RemainingMessageSendCount implements RemainingMessageSendCount {
  const factory _RemainingMessageSendCount(
      {required final RemainingMonthlySurplusMessageSendCount monthlySurplus,
      required final RemainingDailyMessageSendCount
          daily}) = _$_RemainingMessageSendCount;

  factory _RemainingMessageSendCount.fromJson(Map<String, dynamic> json) =
      _$_RemainingMessageSendCount.fromJson;

  @override
  RemainingMonthlySurplusMessageSendCount get monthlySurplus;
  @override
  RemainingDailyMessageSendCount get daily;
  @override
  @JsonKey(ignore: true)
  _$$_RemainingMessageSendCountCopyWith<_$_RemainingMessageSendCount>
      get copyWith => throw _privateConstructorUsedError;
}

RemainingMonthlySurplusMessageSendCount
    _$RemainingMonthlySurplusMessageSendCountFromJson(
        Map<String, dynamic> json) {
  return _RemainingMonthlySurplusMessageSendCount.fromJson(json);
}

/// @nodoc
mixin _$RemainingMonthlySurplusMessageSendCount {
  YearMonth get yearMonth => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemainingMonthlySurplusMessageSendCountCopyWith<
          RemainingMonthlySurplusMessageSendCount>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> {
  factory $RemainingMonthlySurplusMessageSendCountCopyWith(
          RemainingMonthlySurplusMessageSendCount value,
          $Res Function(RemainingMonthlySurplusMessageSendCount) then) =
      _$RemainingMonthlySurplusMessageSendCountCopyWithImpl<$Res,
          RemainingMonthlySurplusMessageSendCount>;
  @useResult
  $Res call({YearMonth yearMonth, int count});

  $YearMonthCopyWith<$Res> get yearMonth;
}

/// @nodoc
class _$RemainingMonthlySurplusMessageSendCountCopyWithImpl<$Res,
        $Val extends RemainingMonthlySurplusMessageSendCount>
    implements $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> {
  _$RemainingMonthlySurplusMessageSendCountCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearMonth = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      yearMonth: null == yearMonth
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as YearMonth,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $YearMonthCopyWith<$Res> get yearMonth {
    return $YearMonthCopyWith<$Res>(_value.yearMonth, (value) {
      return _then(_value.copyWith(yearMonth: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RemainingMonthlySurplusMessageSendCountCopyWith<$Res>
    implements $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> {
  factory _$$_RemainingMonthlySurplusMessageSendCountCopyWith(
          _$_RemainingMonthlySurplusMessageSendCount value,
          $Res Function(_$_RemainingMonthlySurplusMessageSendCount) then) =
      __$$_RemainingMonthlySurplusMessageSendCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({YearMonth yearMonth, int count});

  @override
  $YearMonthCopyWith<$Res> get yearMonth;
}

/// @nodoc
class __$$_RemainingMonthlySurplusMessageSendCountCopyWithImpl<$Res>
    extends _$RemainingMonthlySurplusMessageSendCountCopyWithImpl<$Res,
        _$_RemainingMonthlySurplusMessageSendCount>
    implements _$$_RemainingMonthlySurplusMessageSendCountCopyWith<$Res> {
  __$$_RemainingMonthlySurplusMessageSendCountCopyWithImpl(
      _$_RemainingMonthlySurplusMessageSendCount _value,
      $Res Function(_$_RemainingMonthlySurplusMessageSendCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearMonth = null,
    Object? count = null,
  }) {
    return _then(_$_RemainingMonthlySurplusMessageSendCount(
      yearMonth: null == yearMonth
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as YearMonth,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RemainingMonthlySurplusMessageSendCount
    implements _RemainingMonthlySurplusMessageSendCount {
  const _$_RemainingMonthlySurplusMessageSendCount(
      {required this.yearMonth, required this.count});

  factory _$_RemainingMonthlySurplusMessageSendCount.fromJson(
          Map<String, dynamic> json) =>
      _$$_RemainingMonthlySurplusMessageSendCountFromJson(json);

  @override
  final YearMonth yearMonth;
  @override
  final int count;

  @override
  String toString() {
    return 'RemainingMonthlySurplusMessageSendCount(yearMonth: $yearMonth, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemainingMonthlySurplusMessageSendCount &&
            (identical(other.yearMonth, yearMonth) ||
                other.yearMonth == yearMonth) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, yearMonth, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemainingMonthlySurplusMessageSendCountCopyWith<
          _$_RemainingMonthlySurplusMessageSendCount>
      get copyWith => __$$_RemainingMonthlySurplusMessageSendCountCopyWithImpl<
          _$_RemainingMonthlySurplusMessageSendCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemainingMonthlySurplusMessageSendCountToJson(
      this,
    );
  }
}

abstract class _RemainingMonthlySurplusMessageSendCount
    implements RemainingMonthlySurplusMessageSendCount {
  const factory _RemainingMonthlySurplusMessageSendCount(
      {required final YearMonth yearMonth,
      required final int count}) = _$_RemainingMonthlySurplusMessageSendCount;

  factory _RemainingMonthlySurplusMessageSendCount.fromJson(
          Map<String, dynamic> json) =
      _$_RemainingMonthlySurplusMessageSendCount.fromJson;

  @override
  YearMonth get yearMonth;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_RemainingMonthlySurplusMessageSendCountCopyWith<
          _$_RemainingMonthlySurplusMessageSendCount>
      get copyWith => throw _privateConstructorUsedError;
}

RemainingDailyMessageSendCount _$RemainingDailyMessageSendCountFromJson(
    Map<String, dynamic> json) {
  return _RemainingDailyMessageSendCount.fromJson(json);
}

/// @nodoc
mixin _$RemainingDailyMessageSendCount {
  Date get date => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemainingDailyMessageSendCountCopyWith<RemainingDailyMessageSendCount>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemainingDailyMessageSendCountCopyWith<$Res> {
  factory $RemainingDailyMessageSendCountCopyWith(
          RemainingDailyMessageSendCount value,
          $Res Function(RemainingDailyMessageSendCount) then) =
      _$RemainingDailyMessageSendCountCopyWithImpl<$Res,
          RemainingDailyMessageSendCount>;
  @useResult
  $Res call({Date date, int count});

  $DateCopyWith<$Res> get date;
}

/// @nodoc
class _$RemainingDailyMessageSendCountCopyWithImpl<$Res,
        $Val extends RemainingDailyMessageSendCount>
    implements $RemainingDailyMessageSendCountCopyWith<$Res> {
  _$RemainingDailyMessageSendCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateCopyWith<$Res> get date {
    return $DateCopyWith<$Res>(_value.date, (value) {
      return _then(_value.copyWith(date: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RemainingDailyMessageSendCountCopyWith<$Res>
    implements $RemainingDailyMessageSendCountCopyWith<$Res> {
  factory _$$_RemainingDailyMessageSendCountCopyWith(
          _$_RemainingDailyMessageSendCount value,
          $Res Function(_$_RemainingDailyMessageSendCount) then) =
      __$$_RemainingDailyMessageSendCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Date date, int count});

  @override
  $DateCopyWith<$Res> get date;
}

/// @nodoc
class __$$_RemainingDailyMessageSendCountCopyWithImpl<$Res>
    extends _$RemainingDailyMessageSendCountCopyWithImpl<$Res,
        _$_RemainingDailyMessageSendCount>
    implements _$$_RemainingDailyMessageSendCountCopyWith<$Res> {
  __$$_RemainingDailyMessageSendCountCopyWithImpl(
      _$_RemainingDailyMessageSendCount _value,
      $Res Function(_$_RemainingDailyMessageSendCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_$_RemainingDailyMessageSendCount(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Date,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_RemainingDailyMessageSendCount
    implements _RemainingDailyMessageSendCount {
  const _$_RemainingDailyMessageSendCount(
      {required this.date, required this.count});

  factory _$_RemainingDailyMessageSendCount.fromJson(
          Map<String, dynamic> json) =>
      _$$_RemainingDailyMessageSendCountFromJson(json);

  @override
  final Date date;
  @override
  final int count;

  @override
  String toString() {
    return 'RemainingDailyMessageSendCount(date: $date, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemainingDailyMessageSendCount &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemainingDailyMessageSendCountCopyWith<_$_RemainingDailyMessageSendCount>
      get copyWith => __$$_RemainingDailyMessageSendCountCopyWithImpl<
          _$_RemainingDailyMessageSendCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RemainingDailyMessageSendCountToJson(
      this,
    );
  }
}

abstract class _RemainingDailyMessageSendCount
    implements RemainingDailyMessageSendCount {
  const factory _RemainingDailyMessageSendCount(
      {required final Date date,
      required final int count}) = _$_RemainingDailyMessageSendCount;

  factory _RemainingDailyMessageSendCount.fromJson(Map<String, dynamic> json) =
      _$_RemainingDailyMessageSendCount.fromJson;

  @override
  Date get date;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_RemainingDailyMessageSendCountCopyWith<_$_RemainingDailyMessageSendCount>
      get copyWith => throw _privateConstructorUsedError;
}
