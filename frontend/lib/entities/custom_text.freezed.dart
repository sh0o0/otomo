// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomText {
  String get text => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;
  AppLatLng? get latLng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomTextCopyWith<CustomText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTextCopyWith<$Res> {
  factory $CustomTextCopyWith(
          CustomText value, $Res Function(CustomText) then) =
      _$CustomTextCopyWithImpl<$Res, CustomText>;
  @useResult
  $Res call({String text, Map<String, dynamic> data, AppLatLng? latLng});

  $AppLatLngCopyWith<$Res>? get latLng;
}

/// @nodoc
class _$CustomTextCopyWithImpl<$Res, $Val extends CustomText>
    implements $CustomTextCopyWith<$Res> {
  _$CustomTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? data = null,
    Object? latLng = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as AppLatLng?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLatLngCopyWith<$Res>? get latLng {
    if (_value.latLng == null) {
      return null;
    }

    return $AppLatLngCopyWith<$Res>(_value.latLng!, (value) {
      return _then(_value.copyWith(latLng: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomTextCopyWith<$Res>
    implements $CustomTextCopyWith<$Res> {
  factory _$$_CustomTextCopyWith(
          _$_CustomText value, $Res Function(_$_CustomText) then) =
      __$$_CustomTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, Map<String, dynamic> data, AppLatLng? latLng});

  @override
  $AppLatLngCopyWith<$Res>? get latLng;
}

/// @nodoc
class __$$_CustomTextCopyWithImpl<$Res>
    extends _$CustomTextCopyWithImpl<$Res, _$_CustomText>
    implements _$$_CustomTextCopyWith<$Res> {
  __$$_CustomTextCopyWithImpl(
      _$_CustomText _value, $Res Function(_$_CustomText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? data = null,
    Object? latLng = freezed,
  }) {
    return _then(_$_CustomText(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      latLng: freezed == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as AppLatLng?,
    ));
  }
}

/// @nodoc

class _$_CustomText implements _CustomText {
  const _$_CustomText(
      {required this.text,
      required final Map<String, dynamic> data,
      this.latLng})
      : _data = data;

  @override
  final String text;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final AppLatLng? latLng;

  @override
  String toString() {
    return 'CustomText(text: $text, data: $data, latLng: $latLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomText &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, text, const DeepCollectionEquality().hash(_data), latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomTextCopyWith<_$_CustomText> get copyWith =>
      __$$_CustomTextCopyWithImpl<_$_CustomText>(this, _$identity);
}

abstract class _CustomText implements CustomText {
  const factory _CustomText(
      {required final String text,
      required final Map<String, dynamic> data,
      final AppLatLng? latLng}) = _$_CustomText;

  @override
  String get text;
  @override
  Map<String, dynamic> get data;
  @override
  AppLatLng? get latLng;
  @override
  @JsonKey(ignore: true)
  _$$_CustomTextCopyWith<_$_CustomText> get copyWith =>
      throw _privateConstructorUsedError;
}
