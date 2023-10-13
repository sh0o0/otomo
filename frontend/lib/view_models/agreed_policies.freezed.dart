// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agreed_policies.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PoliciesAgreementState {
  PoliciesAgreements? get agreements => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoliciesAgreementStateCopyWith<PoliciesAgreementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoliciesAgreementStateCopyWith<$Res> {
  factory $PoliciesAgreementStateCopyWith(PoliciesAgreementState value,
          $Res Function(PoliciesAgreementState) then) =
      _$PoliciesAgreementStateCopyWithImpl<$Res, PoliciesAgreementState>;
  @useResult
  $Res call({PoliciesAgreements? agreements});

  $PoliciesAgreementsCopyWith<$Res>? get agreements;
}

/// @nodoc
class _$PoliciesAgreementStateCopyWithImpl<$Res,
        $Val extends PoliciesAgreementState>
    implements $PoliciesAgreementStateCopyWith<$Res> {
  _$PoliciesAgreementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agreements = freezed,
  }) {
    return _then(_value.copyWith(
      agreements: freezed == agreements
          ? _value.agreements
          : agreements // ignore: cast_nullable_to_non_nullable
              as PoliciesAgreements?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PoliciesAgreementsCopyWith<$Res>? get agreements {
    if (_value.agreements == null) {
      return null;
    }

    return $PoliciesAgreementsCopyWith<$Res>(_value.agreements!, (value) {
      return _then(_value.copyWith(agreements: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PoliciesAgreementStateImplCopyWith<$Res>
    implements $PoliciesAgreementStateCopyWith<$Res> {
  factory _$$PoliciesAgreementStateImplCopyWith(
          _$PoliciesAgreementStateImpl value,
          $Res Function(_$PoliciesAgreementStateImpl) then) =
      __$$PoliciesAgreementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PoliciesAgreements? agreements});

  @override
  $PoliciesAgreementsCopyWith<$Res>? get agreements;
}

/// @nodoc
class __$$PoliciesAgreementStateImplCopyWithImpl<$Res>
    extends _$PoliciesAgreementStateCopyWithImpl<$Res,
        _$PoliciesAgreementStateImpl>
    implements _$$PoliciesAgreementStateImplCopyWith<$Res> {
  __$$PoliciesAgreementStateImplCopyWithImpl(
      _$PoliciesAgreementStateImpl _value,
      $Res Function(_$PoliciesAgreementStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? agreements = freezed,
  }) {
    return _then(_$PoliciesAgreementStateImpl(
      agreements: freezed == agreements
          ? _value.agreements
          : agreements // ignore: cast_nullable_to_non_nullable
              as PoliciesAgreements?,
    ));
  }
}

/// @nodoc

class _$PoliciesAgreementStateImpl extends _PoliciesAgreementState {
  const _$PoliciesAgreementStateImpl({this.agreements = null}) : super._();

  @override
  @JsonKey()
  final PoliciesAgreements? agreements;

  @override
  String toString() {
    return 'PoliciesAgreementState(agreements: $agreements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoliciesAgreementStateImpl &&
            (identical(other.agreements, agreements) ||
                other.agreements == agreements));
  }

  @override
  int get hashCode => Object.hash(runtimeType, agreements);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoliciesAgreementStateImplCopyWith<_$PoliciesAgreementStateImpl>
      get copyWith => __$$PoliciesAgreementStateImplCopyWithImpl<
          _$PoliciesAgreementStateImpl>(this, _$identity);
}

abstract class _PoliciesAgreementState extends PoliciesAgreementState {
  const factory _PoliciesAgreementState(
      {final PoliciesAgreements? agreements}) = _$PoliciesAgreementStateImpl;
  const _PoliciesAgreementState._() : super._();

  @override
  PoliciesAgreements? get agreements;
  @override
  @JsonKey(ignore: true)
  _$$PoliciesAgreementStateImplCopyWith<_$PoliciesAgreementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
