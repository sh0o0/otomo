// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MessageData {
  String get id => throw _privateConstructorUsedError;
  Author get author => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  String? get remoteId => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;
  MessageStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageDataCopyWith<MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDataCopyWith<$Res> {
  factory $MessageDataCopyWith(
          MessageData value, $Res Function(MessageData) then) =
      _$MessageDataCopyWithImpl<$Res, MessageData>;
  @useResult
  $Res call(
      {String id,
      Author author,
      DateTime sentAt,
      String? remoteId,
      bool active,
      MessageStatus status});

  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class _$MessageDataCopyWithImpl<$Res, $Val extends MessageData>
    implements $MessageDataCopyWith<$Res> {
  _$MessageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? sentAt = null,
    Object? remoteId = freezed,
    Object? active = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthorCopyWith<$Res> get author {
    return $AuthorCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageDataCopyWith<$Res>
    implements $MessageDataCopyWith<$Res> {
  factory _$$_MessageDataCopyWith(
          _$_MessageData value, $Res Function(_$_MessageData) then) =
      __$$_MessageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Author author,
      DateTime sentAt,
      String? remoteId,
      bool active,
      MessageStatus status});

  @override
  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$$_MessageDataCopyWithImpl<$Res>
    extends _$MessageDataCopyWithImpl<$Res, _$_MessageData>
    implements _$$_MessageDataCopyWith<$Res> {
  __$$_MessageDataCopyWithImpl(
      _$_MessageData _value, $Res Function(_$_MessageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? sentAt = null,
    Object? remoteId = freezed,
    Object? active = null,
    Object? status = null,
  }) {
    return _then(_$_MessageData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Author,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MessageStatus,
    ));
  }
}

/// @nodoc

class _$_MessageData implements _MessageData {
  const _$_MessageData(
      {required this.id,
      required this.author,
      required this.sentAt,
      this.remoteId,
      this.active = false,
      required this.status});

  @override
  final String id;
  @override
  final Author author;
  @override
  final DateTime sentAt;
  @override
  final String? remoteId;
  @override
  @JsonKey()
  final bool active;
  @override
  final MessageStatus status;

  @override
  String toString() {
    return 'MessageData(id: $id, author: $author, sentAt: $sentAt, remoteId: $remoteId, active: $active, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, author, sentAt, remoteId, active, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageDataCopyWith<_$_MessageData> get copyWith =>
      __$$_MessageDataCopyWithImpl<_$_MessageData>(this, _$identity);
}

abstract class _MessageData implements MessageData {
  const factory _MessageData(
      {required final String id,
      required final Author author,
      required final DateTime sentAt,
      final String? remoteId,
      final bool active,
      required final MessageStatus status}) = _$_MessageData;

  @override
  String get id;
  @override
  Author get author;
  @override
  DateTime get sentAt;
  @override
  String? get remoteId;
  @override
  bool get active;
  @override
  MessageStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_MessageDataCopyWith<_$_MessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TextMessageData {
  MessageData get message => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

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
  $Res call({MessageData message, String text});

  $MessageDataCopyWith<$Res> get message;
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
    Object? message = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageData,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDataCopyWith<$Res> get message {
    return $MessageDataCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
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
  $Res call({MessageData message, String text});

  @override
  $MessageDataCopyWith<$Res> get message;
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
    Object? message = null,
    Object? text = null,
  }) {
    return _then(_$_TextMessageData(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageData,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TextMessageData extends _TextMessageData {
  const _$_TextMessageData({required this.message, required this.text})
      : super._();

  @override
  final MessageData message;
  @override
  final String text;

  @override
  String toString() {
    return 'TextMessageData(message: $message, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextMessageData &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextMessageDataCopyWith<_$_TextMessageData> get copyWith =>
      __$$_TextMessageDataCopyWithImpl<_$_TextMessageData>(this, _$identity);
}

abstract class _TextMessageData extends TextMessageData {
  const factory _TextMessageData(
      {required final MessageData message,
      required final String text}) = _$_TextMessageData;
  const _TextMessageData._() : super._();

  @override
  MessageData get message;
  @override
  String get text;
  @override
  @JsonKey(ignore: true)
  _$$_TextMessageDataCopyWith<_$_TextMessageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Author {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorCopyWith<Author> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorCopyWith<$Res> {
  factory $AuthorCopyWith(Author value, $Res Function(Author) then) =
      _$AuthorCopyWithImpl<$Res, Author>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$AuthorCopyWithImpl<$Res, $Val extends Author>
    implements $AuthorCopyWith<$Res> {
  _$AuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthorCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$_AuthorCopyWith(_$_Author value, $Res Function(_$_Author) then) =
      __$$_AuthorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_AuthorCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$_Author>
    implements _$$_AuthorCopyWith<$Res> {
  __$$_AuthorCopyWithImpl(_$_Author _value, $Res Function(_$_Author) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Author(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Author extends _Author {
  const _$_Author({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString() {
    return 'Author(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Author &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      __$$_AuthorCopyWithImpl<_$_Author>(this, _$identity);
}

abstract class _Author extends Author {
  const factory _Author({required final String id}) = _$_Author;
  const _Author._() : super._();

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorCopyWith<_$_Author> get copyWith =>
      throw _privateConstructorUsedError;
}
