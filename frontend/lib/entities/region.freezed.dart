// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
