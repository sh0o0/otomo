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

PoliciesAgreements _$PoliciesAgreementsFromJson(Map<String, dynamic> json) {
  return _PoliciesAgreements.fromJson(json);
}

/// @nodoc
mixin _$PoliciesAgreements {
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'agreed_2023-10-11_at')
  DateTime? get agreed20231011At => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PoliciesAgreementsCopyWith<PoliciesAgreements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoliciesAgreementsCopyWith<$Res> {
  factory $PoliciesAgreementsCopyWith(
          PoliciesAgreements value, $Res Function(PoliciesAgreements) then) =
      _$PoliciesAgreementsCopyWithImpl<$Res, PoliciesAgreements>;
  @useResult
  $Res call(
      {String userId,
      @JsonKey(name: 'agreed_2023-10-11_at') DateTime? agreed20231011At});
}

/// @nodoc
class _$PoliciesAgreementsCopyWithImpl<$Res, $Val extends PoliciesAgreements>
    implements $PoliciesAgreementsCopyWith<$Res> {
  _$PoliciesAgreementsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? agreed20231011At = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      agreed20231011At: freezed == agreed20231011At
          ? _value.agreed20231011At
          : agreed20231011At // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoliciesAgreementsImplCopyWith<$Res>
    implements $PoliciesAgreementsCopyWith<$Res> {
  factory _$$PoliciesAgreementsImplCopyWith(_$PoliciesAgreementsImpl value,
          $Res Function(_$PoliciesAgreementsImpl) then) =
      __$$PoliciesAgreementsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      @JsonKey(name: 'agreed_2023-10-11_at') DateTime? agreed20231011At});
}

/// @nodoc
class __$$PoliciesAgreementsImplCopyWithImpl<$Res>
    extends _$PoliciesAgreementsCopyWithImpl<$Res, _$PoliciesAgreementsImpl>
    implements _$$PoliciesAgreementsImplCopyWith<$Res> {
  __$$PoliciesAgreementsImplCopyWithImpl(_$PoliciesAgreementsImpl _value,
      $Res Function(_$PoliciesAgreementsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? agreed20231011At = freezed,
  }) {
    return _then(_$PoliciesAgreementsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      agreed20231011At: freezed == agreed20231011At
          ? _value.agreed20231011At
          : agreed20231011At // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoliciesAgreementsImpl extends _PoliciesAgreements {
  const _$PoliciesAgreementsImpl(
      {required this.userId,
      @JsonKey(name: 'agreed_2023-10-11_at') required this.agreed20231011At})
      : super._();

  factory _$PoliciesAgreementsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoliciesAgreementsImplFromJson(json);

  @override
  final String userId;
  @override
  @JsonKey(name: 'agreed_2023-10-11_at')
  final DateTime? agreed20231011At;

  @override
  String toString() {
    return 'PoliciesAgreements(userId: $userId, agreed20231011At: $agreed20231011At)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoliciesAgreementsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.agreed20231011At, agreed20231011At) ||
                other.agreed20231011At == agreed20231011At));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, agreed20231011At);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PoliciesAgreementsImplCopyWith<_$PoliciesAgreementsImpl> get copyWith =>
      __$$PoliciesAgreementsImplCopyWithImpl<_$PoliciesAgreementsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoliciesAgreementsImplToJson(
      this,
    );
  }
}

abstract class _PoliciesAgreements extends PoliciesAgreements {
  const factory _PoliciesAgreements(
      {required final String userId,
      @JsonKey(name: 'agreed_2023-10-11_at')
      required final DateTime? agreed20231011At}) = _$PoliciesAgreementsImpl;
  const _PoliciesAgreements._() : super._();

  factory _PoliciesAgreements.fromJson(Map<String, dynamic> json) =
      _$PoliciesAgreementsImpl.fromJson;

  @override
  String get userId;
  @override
  @JsonKey(name: 'agreed_2023-10-11_at')
  DateTime? get agreed20231011At;
  @override
  @JsonKey(ignore: true)
  _$$PoliciesAgreementsImplCopyWith<_$PoliciesAgreementsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
