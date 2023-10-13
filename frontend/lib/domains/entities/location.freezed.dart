// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

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
abstract class _$$AppLatLngImplCopyWith<$Res>
    implements $AppLatLngCopyWith<$Res> {
  factory _$$AppLatLngImplCopyWith(
          _$AppLatLngImpl value, $Res Function(_$AppLatLngImpl) then) =
      __$$AppLatLngImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$AppLatLngImplCopyWithImpl<$Res>
    extends _$AppLatLngCopyWithImpl<$Res, _$AppLatLngImpl>
    implements _$$AppLatLngImplCopyWith<$Res> {
  __$$AppLatLngImplCopyWithImpl(
      _$AppLatLngImpl _value, $Res Function(_$AppLatLngImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$AppLatLngImpl(
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
class _$AppLatLngImpl extends _AppLatLng {
  const _$AppLatLngImpl({required this.latitude, required this.longitude})
      : super._();

  factory _$AppLatLngImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppLatLngImplFromJson(json);

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
            other is _$AppLatLngImpl &&
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
  _$$AppLatLngImplCopyWith<_$AppLatLngImpl> get copyWith =>
      __$$AppLatLngImplCopyWithImpl<_$AppLatLngImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppLatLngImplToJson(
      this,
    );
  }
}

abstract class _AppLatLng extends AppLatLng {
  const factory _AppLatLng(
      {required final double latitude,
      required final double longitude}) = _$AppLatLngImpl;
  const _AppLatLng._() : super._();

  factory _AppLatLng.fromJson(Map<String, dynamic> json) =
      _$AppLatLngImpl.fromJson;

  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$AppLatLngImplCopyWith<_$AppLatLngImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Position {
  AppLatLng get latLng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res, Position>;
  @useResult
  $Res call({AppLatLng latLng});

  $AppLatLngCopyWith<$Res> get latLng;
}

/// @nodoc
class _$PositionCopyWithImpl<$Res, $Val extends Position>
    implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = null,
  }) {
    return _then(_value.copyWith(
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLatLngCopyWith<$Res> get latLng {
    return $AppLatLngCopyWith<$Res>(_value.latLng, (value) {
      return _then(_value.copyWith(latLng: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PositionImplCopyWith<$Res>
    implements $PositionCopyWith<$Res> {
  factory _$$PositionImplCopyWith(
          _$PositionImpl value, $Res Function(_$PositionImpl) then) =
      __$$PositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppLatLng latLng});

  @override
  $AppLatLngCopyWith<$Res> get latLng;
}

/// @nodoc
class __$$PositionImplCopyWithImpl<$Res>
    extends _$PositionCopyWithImpl<$Res, _$PositionImpl>
    implements _$$PositionImplCopyWith<$Res> {
  __$$PositionImplCopyWithImpl(
      _$PositionImpl _value, $Res Function(_$PositionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latLng = null,
  }) {
    return _then(_$PositionImpl(
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
    ));
  }
}

/// @nodoc

class _$PositionImpl implements _Position {
  const _$PositionImpl({required this.latLng});

  @override
  final AppLatLng latLng;

  @override
  String toString() {
    return 'Position(latLng: $latLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionImpl &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      __$$PositionImplCopyWithImpl<_$PositionImpl>(this, _$identity);
}

abstract class _Position implements Position {
  const factory _Position({required final AppLatLng latLng}) = _$PositionImpl;

  @override
  AppLatLng get latLng;
  @override
  @JsonKey(ignore: true)
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Region {
  AppLatLng get northeast => throw _privateConstructorUsedError;
  AppLatLng get southwest => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call({AppLatLng northeast, AppLatLng southwest});

  $AppLatLngCopyWith<$Res> get northeast;
  $AppLatLngCopyWith<$Res> get southwest;
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = null,
    Object? southwest = null,
  }) {
    return _then(_value.copyWith(
      northeast: null == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
      southwest: null == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLatLngCopyWith<$Res> get northeast {
    return $AppLatLngCopyWith<$Res>(_value.northeast, (value) {
      return _then(_value.copyWith(northeast: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLatLngCopyWith<$Res> get southwest {
    return $AppLatLngCopyWith<$Res>(_value.southwest, (value) {
      return _then(_value.copyWith(southwest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
          _$RegionImpl value, $Res Function(_$RegionImpl) then) =
      __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AppLatLng northeast, AppLatLng southwest});

  @override
  $AppLatLngCopyWith<$Res> get northeast;
  @override
  $AppLatLngCopyWith<$Res> get southwest;
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
      _$RegionImpl _value, $Res Function(_$RegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = null,
    Object? southwest = null,
  }) {
    return _then(_$RegionImpl(
      northeast: null == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
      southwest: null == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
    ));
  }
}

/// @nodoc

class _$RegionImpl extends _Region {
  const _$RegionImpl({required this.northeast, required this.southwest})
      : super._();

  @override
  final AppLatLng northeast;
  @override
  final AppLatLng southwest;

  @override
  String toString() {
    return 'Region(northeast: $northeast, southwest: $southwest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.northeast, northeast) ||
                other.northeast == northeast) &&
            (identical(other.southwest, southwest) ||
                other.southwest == southwest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, northeast, southwest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);
}

abstract class _Region extends Region {
  const factory _Region(
      {required final AppLatLng northeast,
      required final AppLatLng southwest}) = _$RegionImpl;
  const _Region._() : super._();

  @override
  AppLatLng get northeast;
  @override
  AppLatLng get southwest;
  @override
  @JsonKey(ignore: true)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
