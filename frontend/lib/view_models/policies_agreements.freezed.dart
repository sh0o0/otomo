// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'policies_agreements.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PoliciesAgreementsState {
  Date? get birthday => throw _privateConstructorUsedError;
  bool get isAgreed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoliciesAgreementsStateCopyWith<PoliciesAgreementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoliciesAgreementsStateCopyWith<$Res> {
  factory $PoliciesAgreementsStateCopyWith(PoliciesAgreementsState value,
          $Res Function(PoliciesAgreementsState) then) =
      _$PoliciesAgreementsStateCopyWithImpl<$Res, PoliciesAgreementsState>;
  @useResult
  $Res call({Date? birthday, bool isAgreed});

  $DateCopyWith<$Res>? get birthday;
}

/// @nodoc
class _$PoliciesAgreementsStateCopyWithImpl<$Res,
        $Val extends PoliciesAgreementsState>
    implements $PoliciesAgreementsStateCopyWith<$Res> {
  _$PoliciesAgreementsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? isAgreed = null,
  }) {
    return _then(_value.copyWith(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as Date?,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DateCopyWith<$Res>? get birthday {
    if (_value.birthday == null) {
      return null;
    }

    return $DateCopyWith<$Res>(_value.birthday!, (value) {
      return _then(_value.copyWith(birthday: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PoliciesAgreementsStateImplCopyWith<$Res>
    implements $PoliciesAgreementsStateCopyWith<$Res> {
  factory _$$PoliciesAgreementsStateImplCopyWith(
          _$PoliciesAgreementsStateImpl value,
          $Res Function(_$PoliciesAgreementsStateImpl) then) =
      __$$PoliciesAgreementsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Date? birthday, bool isAgreed});

  @override
  $DateCopyWith<$Res>? get birthday;
}

/// @nodoc
class __$$PoliciesAgreementsStateImplCopyWithImpl<$Res>
    extends _$PoliciesAgreementsStateCopyWithImpl<$Res,
        _$PoliciesAgreementsStateImpl>
    implements _$$PoliciesAgreementsStateImplCopyWith<$Res> {
  __$$PoliciesAgreementsStateImplCopyWithImpl(
      _$PoliciesAgreementsStateImpl _value,
      $Res Function(_$PoliciesAgreementsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? isAgreed = null,
  }) {
    return _then(_$PoliciesAgreementsStateImpl(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as Date?,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PoliciesAgreementsStateImpl extends _PoliciesAgreementsState {
  const _$PoliciesAgreementsStateImpl({this.birthday, this.isAgreed = false})
      : super._();

  @override
  final Date? birthday;
  @override
  @JsonKey()
  final bool isAgreed;

  @override
  String toString() {
    return 'PoliciesAgreementsState(birthday: $birthday, isAgreed: $isAgreed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoliciesAgreementsStateImpl &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.isAgreed, isAgreed) ||
                other.isAgreed == isAgreed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, birthday, isAgreed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoliciesAgreementsStateImplCopyWith<_$PoliciesAgreementsStateImpl>
      get copyWith => __$$PoliciesAgreementsStateImplCopyWithImpl<
          _$PoliciesAgreementsStateImpl>(this, _$identity);
}

abstract class _PoliciesAgreementsState extends PoliciesAgreementsState {
  const factory _PoliciesAgreementsState(
      {final Date? birthday,
      final bool isAgreed}) = _$PoliciesAgreementsStateImpl;
  const _PoliciesAgreementsState._() : super._();

  @override
  Date? get birthday;
  @override
  bool get isAgreed;
  @override
  @JsonKey(ignore: true)
  _$$PoliciesAgreementsStateImplCopyWith<_$PoliciesAgreementsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
