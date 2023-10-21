// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otomo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Otomo _$OtomoFromJson(Map<String, dynamic> json) {
  return _Otomo.fromJson(json);
}

/// @nodoc
mixin _$Otomo {
  String get userId => throw _privateConstructorUsedError;
  OtomoProfile get profile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtomoCopyWith<Otomo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtomoCopyWith<$Res> {
  factory $OtomoCopyWith(Otomo value, $Res Function(Otomo) then) =
      _$OtomoCopyWithImpl<$Res, Otomo>;
  @useResult
  $Res call({String userId, OtomoProfile profile});

  $OtomoProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$OtomoCopyWithImpl<$Res, $Val extends Otomo>
    implements $OtomoCopyWith<$Res> {
  _$OtomoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profile = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as OtomoProfile,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OtomoProfileCopyWith<$Res> get profile {
    return $OtomoProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtomoImplCopyWith<$Res> implements $OtomoCopyWith<$Res> {
  factory _$$OtomoImplCopyWith(
          _$OtomoImpl value, $Res Function(_$OtomoImpl) then) =
      __$$OtomoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, OtomoProfile profile});

  @override
  $OtomoProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$OtomoImplCopyWithImpl<$Res>
    extends _$OtomoCopyWithImpl<$Res, _$OtomoImpl>
    implements _$$OtomoImplCopyWith<$Res> {
  __$$OtomoImplCopyWithImpl(
      _$OtomoImpl _value, $Res Function(_$OtomoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profile = null,
  }) {
    return _then(_$OtomoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as OtomoProfile,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OtomoImpl extends _Otomo {
  const _$OtomoImpl({required this.userId, required this.profile}) : super._();

  factory _$OtomoImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtomoImplFromJson(json);

  @override
  final String userId;
  @override
  final OtomoProfile profile;

  @override
  String toString() {
    return 'Otomo(userId: $userId, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtomoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtomoImplCopyWith<_$OtomoImpl> get copyWith =>
      __$$OtomoImplCopyWithImpl<_$OtomoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtomoImplToJson(
      this,
    );
  }
}

abstract class _Otomo extends Otomo {
  const factory _Otomo(
      {required final String userId,
      required final OtomoProfile profile}) = _$OtomoImpl;
  const _Otomo._() : super._();

  factory _Otomo.fromJson(Map<String, dynamic> json) = _$OtomoImpl.fromJson;

  @override
  String get userId;
  @override
  OtomoProfile get profile;
  @override
  @JsonKey(ignore: true)
  _$$OtomoImplCopyWith<_$OtomoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OtomoProfile _$OtomoProfileFromJson(Map<String, dynamic> json) {
  return _OtomoProfile.fromJson(json);
}

/// @nodoc
mixin _$OtomoProfile {
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OtomoProfileCopyWith<OtomoProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtomoProfileCopyWith<$Res> {
  factory $OtomoProfileCopyWith(
          OtomoProfile value, $Res Function(OtomoProfile) then) =
      _$OtomoProfileCopyWithImpl<$Res, OtomoProfile>;
  @useResult
  $Res call({String language});
}

/// @nodoc
class _$OtomoProfileCopyWithImpl<$Res, $Val extends OtomoProfile>
    implements $OtomoProfileCopyWith<$Res> {
  _$OtomoProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OtomoProfileImplCopyWith<$Res>
    implements $OtomoProfileCopyWith<$Res> {
  factory _$$OtomoProfileImplCopyWith(
          _$OtomoProfileImpl value, $Res Function(_$OtomoProfileImpl) then) =
      __$$OtomoProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$$OtomoProfileImplCopyWithImpl<$Res>
    extends _$OtomoProfileCopyWithImpl<$Res, _$OtomoProfileImpl>
    implements _$$OtomoProfileImplCopyWith<$Res> {
  __$$OtomoProfileImplCopyWithImpl(
      _$OtomoProfileImpl _value, $Res Function(_$OtomoProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$OtomoProfileImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtomoProfileImpl extends _OtomoProfile {
  const _$OtomoProfileImpl({required this.language}) : super._();

  factory _$OtomoProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtomoProfileImplFromJson(json);

  @override
  final String language;

  @override
  String toString() {
    return 'OtomoProfile(language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtomoProfileImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtomoProfileImplCopyWith<_$OtomoProfileImpl> get copyWith =>
      __$$OtomoProfileImplCopyWithImpl<_$OtomoProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtomoProfileImplToJson(
      this,
    );
  }
}

abstract class _OtomoProfile extends OtomoProfile {
  const factory _OtomoProfile({required final String language}) =
      _$OtomoProfileImpl;
  const _OtomoProfile._() : super._();

  factory _OtomoProfile.fromJson(Map<String, dynamic> json) =
      _$OtomoProfileImpl.fromJson;

  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$OtomoProfileImplCopyWith<_$OtomoProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
