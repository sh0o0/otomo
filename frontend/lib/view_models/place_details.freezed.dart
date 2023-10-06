// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaceDetailsState {
  PlaceDetails? get place => throw _privateConstructorUsedError;
  bool get isNotSpecified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceDetailsStateCopyWith<PlaceDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsStateCopyWith<$Res> {
  factory $PlaceDetailsStateCopyWith(
          PlaceDetailsState value, $Res Function(PlaceDetailsState) then) =
      _$PlaceDetailsStateCopyWithImpl<$Res, PlaceDetailsState>;
  @useResult
  $Res call({PlaceDetails? place, bool isNotSpecified});

  $PlaceDetailsCopyWith<$Res>? get place;
}

/// @nodoc
class _$PlaceDetailsStateCopyWithImpl<$Res, $Val extends PlaceDetailsState>
    implements $PlaceDetailsStateCopyWith<$Res> {
  _$PlaceDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = freezed,
    Object? isNotSpecified = null,
  }) {
    return _then(_value.copyWith(
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceDetails?,
      isNotSpecified: null == isNotSpecified
          ? _value.isNotSpecified
          : isNotSpecified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceDetailsCopyWith<$Res>? get place {
    if (_value.place == null) {
      return null;
    }

    return $PlaceDetailsCopyWith<$Res>(_value.place!, (value) {
      return _then(_value.copyWith(place: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaceDetailsStateImplCopyWith<$Res>
    implements $PlaceDetailsStateCopyWith<$Res> {
  factory _$$PlaceDetailsStateImplCopyWith(_$PlaceDetailsStateImpl value,
          $Res Function(_$PlaceDetailsStateImpl) then) =
      __$$PlaceDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlaceDetails? place, bool isNotSpecified});

  @override
  $PlaceDetailsCopyWith<$Res>? get place;
}

/// @nodoc
class __$$PlaceDetailsStateImplCopyWithImpl<$Res>
    extends _$PlaceDetailsStateCopyWithImpl<$Res, _$PlaceDetailsStateImpl>
    implements _$$PlaceDetailsStateImplCopyWith<$Res> {
  __$$PlaceDetailsStateImplCopyWithImpl(_$PlaceDetailsStateImpl _value,
      $Res Function(_$PlaceDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? place = freezed,
    Object? isNotSpecified = null,
  }) {
    return _then(_$PlaceDetailsStateImpl(
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as PlaceDetails?,
      isNotSpecified: null == isNotSpecified
          ? _value.isNotSpecified
          : isNotSpecified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlaceDetailsStateImpl implements _PlaceDetailsState {
  const _$PlaceDetailsStateImpl({this.place, this.isNotSpecified = false});

  @override
  final PlaceDetails? place;
  @override
  @JsonKey()
  final bool isNotSpecified;

  @override
  String toString() {
    return 'PlaceDetailsState(place: $place, isNotSpecified: $isNotSpecified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsStateImpl &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.isNotSpecified, isNotSpecified) ||
                other.isNotSpecified == isNotSpecified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, place, isNotSpecified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsStateImplCopyWith<_$PlaceDetailsStateImpl> get copyWith =>
      __$$PlaceDetailsStateImplCopyWithImpl<_$PlaceDetailsStateImpl>(
          this, _$identity);
}

abstract class _PlaceDetailsState implements PlaceDetailsState {
  const factory _PlaceDetailsState(
      {final PlaceDetails? place,
      final bool isNotSpecified}) = _$PlaceDetailsStateImpl;

  @override
  PlaceDetails? get place;
  @override
  bool get isNotSpecified;
  @override
  @JsonKey(ignore: true)
  _$$PlaceDetailsStateImplCopyWith<_$PlaceDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
