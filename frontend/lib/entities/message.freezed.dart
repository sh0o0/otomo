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

TextMessage _$TextMessageFromJson(Map<String, dynamic> json) {
  return _TextMessage.fromJson(json);
}

/// @nodoc
mixin _$TextMessage {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get sentAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TextMessageCopyWith<TextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextMessageCopyWith<$Res> {
  factory $TextMessageCopyWith(
          TextMessage value, $Res Function(TextMessage) then) =
      _$TextMessageCopyWithImpl<$Res, TextMessage>;
  @useResult
  $Res call(
      {String id,
      String text,
      Role role,
      @TimestampConverter() DateTime sentAt});
}

/// @nodoc
class _$TextMessageCopyWithImpl<$Res, $Val extends TextMessage>
    implements $TextMessageCopyWith<$Res> {
  _$TextMessageCopyWithImpl(this._value, this._then);

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
              as Role,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextMessageCopyWith<$Res>
    implements $TextMessageCopyWith<$Res> {
  factory _$$_TextMessageCopyWith(
          _$_TextMessage value, $Res Function(_$_TextMessage) then) =
      __$$_TextMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String text,
      Role role,
      @TimestampConverter() DateTime sentAt});
}

/// @nodoc
class __$$_TextMessageCopyWithImpl<$Res>
    extends _$TextMessageCopyWithImpl<$Res, _$_TextMessage>
    implements _$$_TextMessageCopyWith<$Res> {
  __$$_TextMessageCopyWithImpl(
      _$_TextMessage _value, $Res Function(_$_TextMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
  }) {
    return _then(_$_TextMessage(
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
              as Role,
      sentAt: null == sentAt
          ? _value.sentAt
          : sentAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_TextMessage implements _TextMessage {
  const _$_TextMessage(
      {required this.id,
      required this.text,
      required this.role,
      @TimestampConverter() required this.sentAt});

  factory _$_TextMessage.fromJson(Map<String, dynamic> json) =>
      _$$_TextMessageFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final Role role;
  @override
  @TimestampConverter()
  final DateTime sentAt;

  @override
  String toString() {
    return 'TextMessage(id: $id, text: $text, role: $role, sentAt: $sentAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, text, role, sentAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextMessageCopyWith<_$_TextMessage> get copyWith =>
      __$$_TextMessageCopyWithImpl<_$_TextMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TextMessageToJson(
      this,
    );
  }
}

abstract class _TextMessage implements TextMessage {
  const factory _TextMessage(
      {required final String id,
      required final String text,
      required final Role role,
      @TimestampConverter() required final DateTime sentAt}) = _$_TextMessage;

  factory _TextMessage.fromJson(Map<String, dynamic> json) =
      _$_TextMessage.fromJson;

  @override
  String get id;
  @override
  String get text;
  @override
  Role get role;
  @override
  @TimestampConverter()
  DateTime get sentAt;
  @override
  @JsonKey(ignore: true)
  _$$_TextMessageCopyWith<_$_TextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
