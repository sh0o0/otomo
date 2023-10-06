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
  List<AnalyzedLocation> get activeAnalyzedLocations =>
      throw _privateConstructorUsedError;
  Location? get focusingLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {List<AnalyzedLocation> activeAnalyzedLocations,
      Location? focusingLocation});

  $LocationCopyWith<$Res>? get focusingLocation;
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
    Object? activeAnalyzedLocations = null,
    Object? focusingLocation = freezed,
  }) {
    return _then(_value.copyWith(
      activeAnalyzedLocations: null == activeAnalyzedLocations
          ? _value.activeAnalyzedLocations
          : activeAnalyzedLocations // ignore: cast_nullable_to_non_nullable
              as List<AnalyzedLocation>,
      focusingLocation: freezed == focusingLocation
          ? _value.focusingLocation
          : focusingLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get focusingLocation {
    if (_value.focusingLocation == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.focusingLocation!, (value) {
      return _then(_value.copyWith(focusingLocation: value) as $Val);
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
  $Res call(
      {List<AnalyzedLocation> activeAnalyzedLocations,
      Location? focusingLocation});

  @override
  $LocationCopyWith<$Res>? get focusingLocation;
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
    Object? activeAnalyzedLocations = null,
    Object? focusingLocation = freezed,
  }) {
    return _then(_$MapStateImpl(
      activeAnalyzedLocations: null == activeAnalyzedLocations
          ? _value._activeAnalyzedLocations
          : activeAnalyzedLocations // ignore: cast_nullable_to_non_nullable
              as List<AnalyzedLocation>,
      focusingLocation: freezed == focusingLocation
          ? _value.focusingLocation
          : focusingLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }
}

/// @nodoc

class _$MapStateImpl extends _MapState {
  const _$MapStateImpl(
      {required final List<AnalyzedLocation> activeAnalyzedLocations,
      this.focusingLocation})
      : _activeAnalyzedLocations = activeAnalyzedLocations,
        super._();

  final List<AnalyzedLocation> _activeAnalyzedLocations;
  @override
  List<AnalyzedLocation> get activeAnalyzedLocations {
    if (_activeAnalyzedLocations is EqualUnmodifiableListView)
      return _activeAnalyzedLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeAnalyzedLocations);
  }

  @override
  final Location? focusingLocation;

  @override
  String toString() {
    return 'MapState(activeAnalyzedLocations: $activeAnalyzedLocations, focusingLocation: $focusingLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapStateImpl &&
            const DeepCollectionEquality().equals(
                other._activeAnalyzedLocations, _activeAnalyzedLocations) &&
            (identical(other.focusingLocation, focusingLocation) ||
                other.focusingLocation == focusingLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_activeAnalyzedLocations),
      focusingLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      __$$MapStateImplCopyWithImpl<_$MapStateImpl>(this, _$identity);
}

abstract class _MapState extends MapState {
  const factory _MapState(
      {required final List<AnalyzedLocation> activeAnalyzedLocations,
      final Location? focusingLocation}) = _$MapStateImpl;
  const _MapState._() : super._();

  @override
  List<AnalyzedLocation> get activeAnalyzedLocations;
  @override
  Location? get focusingLocation;
  @override
  @JsonKey(ignore: true)
  _$$MapStateImplCopyWith<_$MapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
