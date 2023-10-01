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
  BasicPlaceDetails? get basic => throw _privateConstructorUsedError;
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
  $Res call({BasicPlaceDetails? basic, bool isNotSpecified});

  $BasicPlaceDetailsCopyWith<$Res>? get basic;
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
    Object? basic = freezed,
    Object? isNotSpecified = null,
  }) {
    return _then(_value.copyWith(
      basic: freezed == basic
          ? _value.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetails?,
      isNotSpecified: null == isNotSpecified
          ? _value.isNotSpecified
          : isNotSpecified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicPlaceDetailsCopyWith<$Res>? get basic {
    if (_value.basic == null) {
      return null;
    }

    return $BasicPlaceDetailsCopyWith<$Res>(_value.basic!, (value) {
      return _then(_value.copyWith(basic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlaceDetailsStateCopyWith<$Res>
    implements $PlaceDetailsStateCopyWith<$Res> {
  factory _$$_PlaceDetailsStateCopyWith(_$_PlaceDetailsState value,
          $Res Function(_$_PlaceDetailsState) then) =
      __$$_PlaceDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BasicPlaceDetails? basic, bool isNotSpecified});

  @override
  $BasicPlaceDetailsCopyWith<$Res>? get basic;
}

/// @nodoc
class __$$_PlaceDetailsStateCopyWithImpl<$Res>
    extends _$PlaceDetailsStateCopyWithImpl<$Res, _$_PlaceDetailsState>
    implements _$$_PlaceDetailsStateCopyWith<$Res> {
  __$$_PlaceDetailsStateCopyWithImpl(
      _$_PlaceDetailsState _value, $Res Function(_$_PlaceDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basic = freezed,
    Object? isNotSpecified = null,
  }) {
    return _then(_$_PlaceDetailsState(
      basic: freezed == basic
          ? _value.basic
          : basic // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetails?,
      isNotSpecified: null == isNotSpecified
          ? _value.isNotSpecified
          : isNotSpecified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PlaceDetailsState implements _PlaceDetailsState {
  const _$_PlaceDetailsState({this.basic, this.isNotSpecified = false});

  @override
  final BasicPlaceDetails? basic;
  @override
  @JsonKey()
  final bool isNotSpecified;

  @override
  String toString() {
    return 'PlaceDetailsState(basic: $basic, isNotSpecified: $isNotSpecified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDetailsState &&
            (identical(other.basic, basic) || other.basic == basic) &&
            (identical(other.isNotSpecified, isNotSpecified) ||
                other.isNotSpecified == isNotSpecified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, basic, isNotSpecified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDetailsStateCopyWith<_$_PlaceDetailsState> get copyWith =>
      __$$_PlaceDetailsStateCopyWithImpl<_$_PlaceDetailsState>(
          this, _$identity);
}

abstract class _PlaceDetailsState implements PlaceDetailsState {
  const factory _PlaceDetailsState(
      {final BasicPlaceDetails? basic,
      final bool isNotSpecified}) = _$_PlaceDetailsState;

  @override
  BasicPlaceDetails? get basic;
  @override
  bool get isNotSpecified;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDetailsStateCopyWith<_$_PlaceDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
