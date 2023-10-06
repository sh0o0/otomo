// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  List<ExtractedPlace> get activePlaces => throw _privateConstructorUsedError;
  ExtractedPlace? get focusingPlace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call({List<ExtractedPlace> activePlaces, ExtractedPlace? focusingPlace});

  $ExtractedPlaceCopyWith<$Res>? get focusingPlace;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePlaces = null,
    Object? focusingPlace = freezed,
  }) {
    return _then(_value.copyWith(
      activePlaces: null == activePlaces
          ? _value.activePlaces
          : activePlaces // ignore: cast_nullable_to_non_nullable
              as List<ExtractedPlace>,
      focusingPlace: freezed == focusingPlace
          ? _value.focusingPlace
          : focusingPlace // ignore: cast_nullable_to_non_nullable
              as ExtractedPlace?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtractedPlaceCopyWith<$Res>? get focusingPlace {
    if (_value.focusingPlace == null) {
      return null;
    }

    return $ExtractedPlaceCopyWith<$Res>(_value.focusingPlace!, (value) {
      return _then(_value.copyWith(focusingPlace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MapStateImplCopyWith<$Res>
    implements $MapStateCopyWith<$Res> {
  factory _$$MapStateImplCopyWith(
          _$MapStateImpl value, $Res Function(_$MapStateImpl) then) =
      __$$MapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ExtractedPlace> activePlaces, ExtractedPlace? focusingPlace});

  @override
  $ExtractedPlaceCopyWith<$Res>? get focusingPlace;
}

/// @nodoc
class __$$MapStateImplCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapStateImpl>
    implements _$$MapStateImplCopyWith<$Res> {
  __$$MapStateImplCopyWithImpl(
      _$MapStateImpl _value, $Res Function(_$MapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePlaces = null,
    Object? focusingPlace = freezed,
  }) {
    return _then(_$MapStateImpl(
      activePlaces: null == activePlaces
          ? _value._activePlaces
          : activePlaces // ignore: cast_nullable_to_non_nullable
              as List<ExtractedPlace>,
      focusingPlace: freezed == focusingPlace
          ? _value.focusingPlace
          : focusingPlace // ignore: cast_nullable_to_non_nullable
              as ExtractedPlace?,
    ));
  }
}

/// @nodoc

class _$MapStateImpl extends _MapState {
  const _$MapStateImpl(
      {required final List<ExtractedPlace> activePlaces, this.focusingPlace})
      : _activePlaces = activePlaces,
        super._();

  final List<ExtractedPlace> _activePlaces;
  @override
  List<ExtractedPlace> get activePlaces {
    if (_activePlaces is EqualUnmodifiableListView) return _activePlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePlaces);
  }

  @override
  final ExtractedPlace? focusingPlace;

  @override
  String toString() {
    return 'MapState(activePlaces: $activePlaces, focusingPlace: $focusingPlace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            const DeepCollectionEquality()
                .equals(other._activePlaces, _activePlaces) &&
            (identical(other.focusingPlace, focusingPlace) ||
                other.focusingPlace == focusingPlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_activePlaces), focusingPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState extends MapState {
  const factory _MapState(
      {required final List<ExtractedPlace> activePlaces,
      final ExtractedPlace? focusingPlace}) = _$MapStateImpl;
  const _MapState._() : super._();

  @override
  List<ExtractedPlace> get activePlaces;
  @override
  ExtractedPlace? get focusingPlace;
  @override
  @JsonKey(ignore: true)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
