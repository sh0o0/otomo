// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'latlng.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppLatLng _$AppLatLngFromJson(Map<String, dynamic> json) {
  return _AppLatLng.fromJson(json);
}

/// @nodoc
mixin _$AppLatLng {
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppLatLngCopyWith<AppLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLatLngCopyWith<$Res> {
  factory $AppLatLngCopyWith(AppLatLng value, $Res Function(AppLatLng) then) =
      _$AppLatLngCopyWithImpl<$Res, AppLatLng>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$AppLatLngCopyWithImpl<$Res, $Val extends AppLatLng>
    implements $AppLatLngCopyWith<$Res> {
  _$AppLatLngCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppLatLngCopyWith<$Res> implements $AppLatLngCopyWith<$Res> {
  factory _$$_AppLatLngCopyWith(
          _$_AppLatLng value, $Res Function(_$_AppLatLng) then) =
      __$$_AppLatLngCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$_AppLatLngCopyWithImpl<$Res>
    extends _$AppLatLngCopyWithImpl<$Res, _$_AppLatLng>
    implements _$$_AppLatLngCopyWith<$Res> {
  __$$_AppLatLngCopyWithImpl(
      _$_AppLatLng _value, $Res Function(_$_AppLatLng) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_AppLatLng(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppLatLng extends _AppLatLng {
  const _$_AppLatLng({required this.latitude, required this.longitude})
      : super._();

  factory _$_AppLatLng.fromJson(Map<String, dynamic> json) =>
      _$$_AppLatLngFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'AppLatLng(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppLatLng &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppLatLngCopyWith<_$_AppLatLng> get copyWith =>
      __$$_AppLatLngCopyWithImpl<_$_AppLatLng>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppLatLngToJson(
      this,
    );
  }
}

abstract class _AppLatLng extends AppLatLng {
  const factory _AppLatLng(
      {required final double latitude,
      required final double longitude}) = _$_AppLatLng;
  const _AppLatLng._() : super._();

  factory _AppLatLng.fromJson(Map<String, dynamic> json) =
      _$_AppLatLng.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_AppLatLngCopyWith<_$_AppLatLng> get copyWith =>
      throw _privateConstructorUsedError;
}
