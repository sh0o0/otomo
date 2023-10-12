// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_to_use.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StartToUseState {
  Date? get birthday => throw _privateConstructorUsedError;
  bool get isAgreed => throw _privateConstructorUsedError;
  bool get savedAgreement => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartToUseStateCopyWith<StartToUseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartToUseStateCopyWith<$Res> {
  factory $StartToUseStateCopyWith(
          StartToUseState value, $Res Function(StartToUseState) then) =
      _$StartToUseStateCopyWithImpl<$Res, StartToUseState>;
  @useResult
  $Res call({Date? birthday, bool isAgreed, bool savedAgreement});

  $DateCopyWith<$Res>? get birthday;
}

/// @nodoc
class _$StartToUseStateCopyWithImpl<$Res, $Val extends StartToUseState>
    implements $StartToUseStateCopyWith<$Res> {
  _$StartToUseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? isAgreed = null,
    Object? savedAgreement = null,
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
      savedAgreement: null == savedAgreement
          ? _value.savedAgreement
          : savedAgreement // ignore: cast_nullable_to_non_nullable
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
abstract class _$$StartToUseStateImplCopyWith<$Res>
    implements $StartToUseStateCopyWith<$Res> {
  factory _$$StartToUseStateImplCopyWith(_$StartToUseStateImpl value,
          $Res Function(_$StartToUseStateImpl) then) =
      __$$StartToUseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Date? birthday, bool isAgreed, bool savedAgreement});

  @override
  $DateCopyWith<$Res>? get birthday;
}

/// @nodoc
class __$$StartToUseStateImplCopyWithImpl<$Res>
    extends _$StartToUseStateCopyWithImpl<$Res, _$StartToUseStateImpl>
    implements _$$StartToUseStateImplCopyWith<$Res> {
  __$$StartToUseStateImplCopyWithImpl(
      _$StartToUseStateImpl _value, $Res Function(_$StartToUseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? birthday = freezed,
    Object? isAgreed = null,
    Object? savedAgreement = null,
  }) {
    return _then(_$StartToUseStateImpl(
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as Date?,
      isAgreed: null == isAgreed
          ? _value.isAgreed
          : isAgreed // ignore: cast_nullable_to_non_nullable
              as bool,
      savedAgreement: null == savedAgreement
          ? _value.savedAgreement
          : savedAgreement // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$StartToUseStateImpl extends _StartToUseState {
  const _$StartToUseStateImpl(
      {this.birthday, this.isAgreed = false, this.savedAgreement = false})
      : super._();

  @override
  final Date? birthday;
  @override
  @JsonKey()
  final bool isAgreed;
  @override
  @JsonKey()
  final bool savedAgreement;

  @override
  String toString() {
    return 'StartToUseState(birthday: $birthday, isAgreed: $isAgreed, savedAgreement: $savedAgreement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartToUseStateImpl &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.isAgreed, isAgreed) ||
                other.isAgreed == isAgreed) &&
            (identical(other.savedAgreement, savedAgreement) ||
                other.savedAgreement == savedAgreement));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, birthday, isAgreed, savedAgreement);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartToUseStateImplCopyWith<_$StartToUseStateImpl> get copyWith =>
      __$$StartToUseStateImplCopyWithImpl<_$StartToUseStateImpl>(
          this, _$identity);
}

abstract class _StartToUseState extends StartToUseState {
  const factory _StartToUseState(
      {final Date? birthday,
      final bool isAgreed,
      final bool savedAgreement}) = _$StartToUseStateImpl;
  const _StartToUseState._() : super._();

  @override
  Date? get birthday;
  @override
  bool get isAgreed;
  @override
  bool get savedAgreement;
  @override
  @JsonKey(ignore: true)
  _$$StartToUseStateImplCopyWith<_$StartToUseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
