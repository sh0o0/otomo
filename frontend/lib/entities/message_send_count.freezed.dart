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
abstract class _$$MessageSentCountImplCopyWith<$Res>
    implements $MessageSentCountCopyWith<$Res> {
  factory _$$MessageSentCountImplCopyWith(_$MessageSentCountImpl value,
          $Res Function(_$MessageSentCountImpl) then) =
      __$$MessageSentCountImplCopyWithImpl<$Res>;
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
class __$$MessageSentCountImplCopyWithImpl<$Res>
    extends _$MessageSentCountCopyWithImpl<$Res, _$MessageSentCountImpl>
    implements _$$MessageSentCountImplCopyWith<$Res> {
  __$$MessageSentCountImplCopyWithImpl(_$MessageSentCountImpl _value,
      $Res Function(_$MessageSentCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySurplus = null,
    Object? daily = null,
  }) {
    return _then(_$MessageSentCountImpl(
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
@JsonSerializable()
class _$MessageSentCountImpl implements _MessageSentCount {
  const _$MessageSentCountImpl(
      {required this.monthlySurplus, required this.daily});

  factory _$MessageSentCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageSentCountImplFromJson(json);

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
            other is _$MessageSentCountImpl &&
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
  _$$MessageSentCountImplCopyWith<_$MessageSentCountImpl> get copyWith =>
      __$$MessageSentCountImplCopyWithImpl<_$MessageSentCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageSentCountImplToJson(
      this,
    );
  }
}

abstract class _MessageSentCount implements MessageSentCount {
  const factory _MessageSentCount(
      {required final MonthlySurplusMessageSentCount monthlySurplus,
      required final DailyMessageSentCount daily}) = _$MessageSentCountImpl;

  factory _MessageSentCount.fromJson(Map<String, dynamic> json) =
      _$MessageSentCountImpl.fromJson;

  @override
  MonthlySurplusMessageSentCount get monthlySurplus;
  @override
  DailyMessageSentCount get daily;
  @override
  @JsonKey(ignore: true)
  _$$MessageSentCountImplCopyWith<_$MessageSentCountImpl> get copyWith =>
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
abstract class _$$MonthlySurplusMessageSentCountImplCopyWith<$Res>
    implements $MonthlySurplusMessageSentCountCopyWith<$Res> {
  factory _$$MonthlySurplusMessageSentCountImplCopyWith(
          _$MonthlySurplusMessageSentCountImpl value,
          $Res Function(_$MonthlySurplusMessageSentCountImpl) then) =
      __$$MonthlySurplusMessageSentCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({YearMonth yearMonth, int count});

  @override
  $YearMonthCopyWith<$Res> get yearMonth;
}

/// @nodoc
class __$$MonthlySurplusMessageSentCountImplCopyWithImpl<$Res>
    extends _$MonthlySurplusMessageSentCountCopyWithImpl<$Res,
        _$MonthlySurplusMessageSentCountImpl>
    implements _$$MonthlySurplusMessageSentCountImplCopyWith<$Res> {
  __$$MonthlySurplusMessageSentCountImplCopyWithImpl(
      _$MonthlySurplusMessageSentCountImpl _value,
      $Res Function(_$MonthlySurplusMessageSentCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearMonth = null,
    Object? count = null,
  }) {
    return _then(_$MonthlySurplusMessageSentCountImpl(
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
@JsonSerializable()
class _$MonthlySurplusMessageSentCountImpl
    implements _MonthlySurplusMessageSentCount {
  const _$MonthlySurplusMessageSentCountImpl(
      {required this.yearMonth, required this.count});

  factory _$MonthlySurplusMessageSentCountImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MonthlySurplusMessageSentCountImplFromJson(json);

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
            other is _$MonthlySurplusMessageSentCountImpl &&
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
  _$$MonthlySurplusMessageSentCountImplCopyWith<
          _$MonthlySurplusMessageSentCountImpl>
      get copyWith => __$$MonthlySurplusMessageSentCountImplCopyWithImpl<
          _$MonthlySurplusMessageSentCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySurplusMessageSentCountImplToJson(
      this,
    );
  }
}

abstract class _MonthlySurplusMessageSentCount
    implements MonthlySurplusMessageSentCount {
  const factory _MonthlySurplusMessageSentCount(
      {required final YearMonth yearMonth,
      required final int count}) = _$MonthlySurplusMessageSentCountImpl;

  factory _MonthlySurplusMessageSentCount.fromJson(Map<String, dynamic> json) =
      _$MonthlySurplusMessageSentCountImpl.fromJson;

  @override
  YearMonth get yearMonth;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$MonthlySurplusMessageSentCountImplCopyWith<
          _$MonthlySurplusMessageSentCountImpl>
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
abstract class _$$DailyMessageSentCountImplCopyWith<$Res>
    implements $DailyMessageSentCountCopyWith<$Res> {
  factory _$$DailyMessageSentCountImplCopyWith(
          _$DailyMessageSentCountImpl value,
          $Res Function(_$DailyMessageSentCountImpl) then) =
      __$$DailyMessageSentCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Date date, int count});

  @override
  $DateCopyWith<$Res> get date;
}

/// @nodoc
class __$$DailyMessageSentCountImplCopyWithImpl<$Res>
    extends _$DailyMessageSentCountCopyWithImpl<$Res,
        _$DailyMessageSentCountImpl>
    implements _$$DailyMessageSentCountImplCopyWith<$Res> {
  __$$DailyMessageSentCountImplCopyWithImpl(_$DailyMessageSentCountImpl _value,
      $Res Function(_$DailyMessageSentCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_$DailyMessageSentCountImpl(
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
@JsonSerializable()
class _$DailyMessageSentCountImpl implements _DailyMessageSentCount {
  const _$DailyMessageSentCountImpl({required this.date, required this.count});

  factory _$DailyMessageSentCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMessageSentCountImplFromJson(json);

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
            other is _$DailyMessageSentCountImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMessageSentCountImplCopyWith<_$DailyMessageSentCountImpl>
      get copyWith => __$$DailyMessageSentCountImplCopyWithImpl<
          _$DailyMessageSentCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMessageSentCountImplToJson(
      this,
    );
  }
}

abstract class _DailyMessageSentCount implements DailyMessageSentCount {
  const factory _DailyMessageSentCount(
      {required final Date date,
      required final int count}) = _$DailyMessageSentCountImpl;

  factory _DailyMessageSentCount.fromJson(Map<String, dynamic> json) =
      _$DailyMessageSentCountImpl.fromJson;

  @override
  Date get date;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$DailyMessageSentCountImplCopyWith<_$DailyMessageSentCountImpl>
      get copyWith => throw _privateConstructorUsedError;
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
abstract class _$$RemainingMessageSendCountImplCopyWith<$Res>
    implements $RemainingMessageSendCountCopyWith<$Res> {
  factory _$$RemainingMessageSendCountImplCopyWith(
          _$RemainingMessageSendCountImpl value,
          $Res Function(_$RemainingMessageSendCountImpl) then) =
      __$$RemainingMessageSendCountImplCopyWithImpl<$Res>;
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
class __$$RemainingMessageSendCountImplCopyWithImpl<$Res>
    extends _$RemainingMessageSendCountCopyWithImpl<$Res,
        _$RemainingMessageSendCountImpl>
    implements _$$RemainingMessageSendCountImplCopyWith<$Res> {
  __$$RemainingMessageSendCountImplCopyWithImpl(
      _$RemainingMessageSendCountImpl _value,
      $Res Function(_$RemainingMessageSendCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySurplus = null,
    Object? daily = null,
  }) {
    return _then(_$RemainingMessageSendCountImpl(
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
@JsonSerializable()
class _$RemainingMessageSendCountImpl implements _RemainingMessageSendCount {
  const _$RemainingMessageSendCountImpl(
      {required this.monthlySurplus, required this.daily});

  factory _$RemainingMessageSendCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemainingMessageSendCountImplFromJson(json);

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
            other is _$RemainingMessageSendCountImpl &&
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
  _$$RemainingMessageSendCountImplCopyWith<_$RemainingMessageSendCountImpl>
      get copyWith => __$$RemainingMessageSendCountImplCopyWithImpl<
          _$RemainingMessageSendCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemainingMessageSendCountImplToJson(
      this,
    );
  }
}

abstract class _RemainingMessageSendCount implements RemainingMessageSendCount {
  const factory _RemainingMessageSendCount(
      {required final RemainingMonthlySurplusMessageSendCount monthlySurplus,
      required final RemainingDailyMessageSendCount
          daily}) = _$RemainingMessageSendCountImpl;

  factory _RemainingMessageSendCount.fromJson(Map<String, dynamic> json) =
      _$RemainingMessageSendCountImpl.fromJson;

  @override
  RemainingMonthlySurplusMessageSendCount get monthlySurplus;
  @override
  RemainingDailyMessageSendCount get daily;
  @override
  @JsonKey(ignore: true)
  _$$RemainingMessageSendCountImplCopyWith<_$RemainingMessageSendCountImpl>
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
abstract class _$$RemainingMonthlySurplusMessageSendCountImplCopyWith<$Res>
    implements $RemainingMonthlySurplusMessageSendCountCopyWith<$Res> {
  factory _$$RemainingMonthlySurplusMessageSendCountImplCopyWith(
          _$RemainingMonthlySurplusMessageSendCountImpl value,
          $Res Function(_$RemainingMonthlySurplusMessageSendCountImpl) then) =
      __$$RemainingMonthlySurplusMessageSendCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({YearMonth yearMonth, int count});

  @override
  $YearMonthCopyWith<$Res> get yearMonth;
}

/// @nodoc
class __$$RemainingMonthlySurplusMessageSendCountImplCopyWithImpl<$Res>
    extends _$RemainingMonthlySurplusMessageSendCountCopyWithImpl<$Res,
        _$RemainingMonthlySurplusMessageSendCountImpl>
    implements _$$RemainingMonthlySurplusMessageSendCountImplCopyWith<$Res> {
  __$$RemainingMonthlySurplusMessageSendCountImplCopyWithImpl(
      _$RemainingMonthlySurplusMessageSendCountImpl _value,
      $Res Function(_$RemainingMonthlySurplusMessageSendCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? yearMonth = null,
    Object? count = null,
  }) {
    return _then(_$RemainingMonthlySurplusMessageSendCountImpl(
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
@JsonSerializable()
class _$RemainingMonthlySurplusMessageSendCountImpl
    implements _RemainingMonthlySurplusMessageSendCount {
  const _$RemainingMonthlySurplusMessageSendCountImpl(
      {required this.yearMonth, required this.count});

  factory _$RemainingMonthlySurplusMessageSendCountImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RemainingMonthlySurplusMessageSendCountImplFromJson(json);

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
            other is _$RemainingMonthlySurplusMessageSendCountImpl &&
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
  _$$RemainingMonthlySurplusMessageSendCountImplCopyWith<
          _$RemainingMonthlySurplusMessageSendCountImpl>
      get copyWith =>
          __$$RemainingMonthlySurplusMessageSendCountImplCopyWithImpl<
              _$RemainingMonthlySurplusMessageSendCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemainingMonthlySurplusMessageSendCountImplToJson(
      this,
    );
  }
}

abstract class _RemainingMonthlySurplusMessageSendCount
    implements RemainingMonthlySurplusMessageSendCount {
  const factory _RemainingMonthlySurplusMessageSendCount(
          {required final YearMonth yearMonth, required final int count}) =
      _$RemainingMonthlySurplusMessageSendCountImpl;

  factory _RemainingMonthlySurplusMessageSendCount.fromJson(
          Map<String, dynamic> json) =
      _$RemainingMonthlySurplusMessageSendCountImpl.fromJson;

  @override
  YearMonth get yearMonth;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$RemainingMonthlySurplusMessageSendCountImplCopyWith<
          _$RemainingMonthlySurplusMessageSendCountImpl>
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
abstract class _$$RemainingDailyMessageSendCountImplCopyWith<$Res>
    implements $RemainingDailyMessageSendCountCopyWith<$Res> {
  factory _$$RemainingDailyMessageSendCountImplCopyWith(
          _$RemainingDailyMessageSendCountImpl value,
          $Res Function(_$RemainingDailyMessageSendCountImpl) then) =
      __$$RemainingDailyMessageSendCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Date date, int count});

  @override
  $DateCopyWith<$Res> get date;
}

/// @nodoc
class __$$RemainingDailyMessageSendCountImplCopyWithImpl<$Res>
    extends _$RemainingDailyMessageSendCountCopyWithImpl<$Res,
        _$RemainingDailyMessageSendCountImpl>
    implements _$$RemainingDailyMessageSendCountImplCopyWith<$Res> {
  __$$RemainingDailyMessageSendCountImplCopyWithImpl(
      _$RemainingDailyMessageSendCountImpl _value,
      $Res Function(_$RemainingDailyMessageSendCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? count = null,
  }) {
    return _then(_$RemainingDailyMessageSendCountImpl(
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
@JsonSerializable()
class _$RemainingDailyMessageSendCountImpl
    implements _RemainingDailyMessageSendCount {
  const _$RemainingDailyMessageSendCountImpl(
      {required this.date, required this.count});

  factory _$RemainingDailyMessageSendCountImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RemainingDailyMessageSendCountImplFromJson(json);

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
            other is _$RemainingDailyMessageSendCountImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemainingDailyMessageSendCountImplCopyWith<
          _$RemainingDailyMessageSendCountImpl>
      get copyWith => __$$RemainingDailyMessageSendCountImplCopyWithImpl<
          _$RemainingDailyMessageSendCountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemainingDailyMessageSendCountImplToJson(
      this,
    );
  }
}

abstract class _RemainingDailyMessageSendCount
    implements RemainingDailyMessageSendCount {
  const factory _RemainingDailyMessageSendCount(
      {required final Date date,
      required final int count}) = _$RemainingDailyMessageSendCountImpl;

  factory _RemainingDailyMessageSendCount.fromJson(Map<String, dynamic> json) =
      _$RemainingDailyMessageSendCountImpl.fromJson;

  @override
  Date get date;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$RemainingDailyMessageSendCountImplCopyWith<
          _$RemainingDailyMessageSendCountImpl>
      get copyWith => throw _privateConstructorUsedError;
}
