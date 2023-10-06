// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Date _$DateFromJson(Map<String, dynamic> json) {
  return _Date.fromJson(json);
}

/// @nodoc
mixin _$Date {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateCopyWith<Date> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateCopyWith<$Res> {
  factory $DateCopyWith(Date value, $Res Function(Date) then) =
      _$DateCopyWithImpl<$Res, Date>;
  @useResult
  $Res call({int year, int month, int day});
}

/// @nodoc
class _$DateCopyWithImpl<$Res, $Val extends Date>
    implements $DateCopyWith<$Res> {
  _$DateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateImplCopyWith<$Res> implements $DateCopyWith<$Res> {
  factory _$$DateImplCopyWith(
          _$DateImpl value, $Res Function(_$DateImpl) then) =
      __$$DateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, int day});
}

/// @nodoc
class __$$DateImplCopyWithImpl<$Res>
    extends _$DateCopyWithImpl<$Res, _$DateImpl>
    implements _$$DateImplCopyWith<$Res> {
  __$$DateImplCopyWithImpl(_$DateImpl _value, $Res Function(_$DateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? day = null,
  }) {
    return _then(_$DateImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DateImpl extends _Date {
  const _$DateImpl({required this.year, required this.month, required this.day})
      : super._();

  factory _$DateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DateImplFromJson(json);

  @override
  final int year;
  @override
  final int month;
  @override
  final int day;

  @override
  String toString() {
    return 'Date(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateImplCopyWith<_$DateImpl> get copyWith =>
      __$$DateImplCopyWithImpl<_$DateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DateImplToJson(
      this,
    );
  }
}

abstract class _Date extends Date {
  const factory _Date(
      {required final int year,
      required final int month,
      required final int day}) = _$DateImpl;
  const _Date._() : super._();

  factory _Date.fromJson(Map<String, dynamic> json) = _$DateImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  int get day;
  @override
  @JsonKey(ignore: true)
  _$$DateImplCopyWith<_$DateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

YearMonth _$YearMonthFromJson(Map<String, dynamic> json) {
  return _YearMonth.fromJson(json);
}

/// @nodoc
mixin _$YearMonth {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YearMonthCopyWith<YearMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearMonthCopyWith<$Res> {
  factory $YearMonthCopyWith(YearMonth value, $Res Function(YearMonth) then) =
      _$YearMonthCopyWithImpl<$Res, YearMonth>;
  @useResult
  $Res call({int year, int month});
}

/// @nodoc
class _$YearMonthCopyWithImpl<$Res, $Val extends YearMonth>
    implements $YearMonthCopyWith<$Res> {
  _$YearMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YearMonthImplCopyWith<$Res>
    implements $YearMonthCopyWith<$Res> {
  factory _$$YearMonthImplCopyWith(
          _$YearMonthImpl value, $Res Function(_$YearMonthImpl) then) =
      __$$YearMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month});
}

/// @nodoc
class __$$YearMonthImplCopyWithImpl<$Res>
    extends _$YearMonthCopyWithImpl<$Res, _$YearMonthImpl>
    implements _$$YearMonthImplCopyWith<$Res> {
  __$$YearMonthImplCopyWithImpl(
      _$YearMonthImpl _value, $Res Function(_$YearMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
  }) {
    return _then(_$YearMonthImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YearMonthImpl extends _YearMonth {
  const _$YearMonthImpl({required this.year, required this.month}) : super._();

  factory _$YearMonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$YearMonthImplFromJson(json);

  @override
  final int year;
  @override
  final int month;

  @override
  String toString() {
    return 'YearMonth(year: $year, month: $month)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearMonthImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, year, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$YearMonthImplCopyWith<_$YearMonthImpl> get copyWith =>
      __$$YearMonthImplCopyWithImpl<_$YearMonthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YearMonthImplToJson(
      this,
    );
  }
}

abstract class _YearMonth extends YearMonth {
  const factory _YearMonth(
      {required final int year, required final int month}) = _$YearMonthImpl;
  const _YearMonth._() : super._();

  factory _YearMonth.fromJson(Map<String, dynamic> json) =
      _$YearMonthImpl.fromJson;

  @override
  int get year;
  @override
  int get month;
  @override
  @JsonKey(ignore: true)
  _$$YearMonthImplCopyWith<_$YearMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
