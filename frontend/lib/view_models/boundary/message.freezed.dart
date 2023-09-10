// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextMessageData {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextMessageDataCopyWith<TextMessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextMessageDataCopyWith<$Res> {
  factory $TextMessageDataCopyWith(
          TextMessageData value, $Res Function(TextMessageData) then) =
      _$TextMessageDataCopyWithImpl<$Res, TextMessageData>;
  @useResult
  $Res call(
      {String id,
      String text,
      String role,
      DateTime sentAt,
      String? remoteId,
      bool active});
}

/// @nodoc
class _$TextMessageDataCopyWithImpl<$Res, $Val extends TextMessageData>
    implements $TextMessageDataCopyWith<$Res> {
  _$TextMessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
    Object? remoteId = freezed,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextMessageDataCopyWith<$Res>
    implements $TextMessageDataCopyWith<$Res> {
  factory _$$_TextMessageDataCopyWith(
          _$_TextMessageData value, $Res Function(_$_TextMessageData) then) =
      __$$_TextMessageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      String role,
      DateTime sentAt,
      String? remoteId,
      bool active});
}

/// @nodoc
class __$$_TextMessageDataCopyWithImpl<$Res>
    extends _$TextMessageDataCopyWithImpl<$Res, _$_TextMessageData>
    implements _$$_TextMessageDataCopyWith<$Res> {
  __$$_TextMessageDataCopyWithImpl(
      _$_TextMessageData _value, $Res Function(_$_TextMessageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
    Object? remoteId = freezed,
    Object? active = null,
  }) {
    return _then(_$_TextMessageData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      remoteId: freezed == remoteId
          ? _value.remoteId
          : remoteId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TextMessageData implements _TextMessageData {
  const _$_TextMessageData(
      {required this.id,
      required this.text,
      required this.role,
      required this.sentAt,
      required this.remoteId,
      this.active = false});

  @override
  final String id;
  @override
  final String text;
  @override
  final String role;
  @override
  final DateTime sentAt;
  @override
  final String? remoteId;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'TextMessageData(id: $id, text: $text, role: $role, sentAt: $sentAt, remoteId: $remoteId, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextMessageData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.active, active) || other.active == active));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, text, role, sentAt, remoteId, active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextMessageDataCopyWith<_$_TextMessageData> get copyWith =>
      __$$_TextMessageDataCopyWithImpl<_$_TextMessageData>(this, _$identity);
}

abstract class _TextMessageData implements TextMessageData {
  const factory _TextMessageData(
      {required final String id,
      required final String text,
      required final String role,
      required final DateTime sentAt,
      required final String? remoteId,
      final bool active}) = _$_TextMessageData;

  @override
  String get id;
  @override
  String get text;
  @override
  String get role;
  @override
  DateTime get sentAt;
  @override
  String? get remoteId;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_TextMessageDataCopyWith<_$_TextMessageData> get copyWith =>
      throw _privateConstructorUsedError;
}
