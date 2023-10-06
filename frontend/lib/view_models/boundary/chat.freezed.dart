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
  Object? get error => throw _privateConstructorUsedError;

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
      MessageStatus status,
      Object? error});

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
    Object? error = freezed,
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
      error: freezed == error ? _value.error : error,
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
abstract class _$$MessageDataImplCopyWith<$Res>
    implements $MessageDataCopyWith<$Res> {
  factory _$$MessageDataImplCopyWith(
          _$MessageDataImpl value, $Res Function(_$MessageDataImpl) then) =
      __$$MessageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Author author,
      DateTime sentAt,
      String? remoteId,
      bool active,
      MessageStatus status,
      Object? error});

  @override
  $AuthorCopyWith<$Res> get author;
}

/// @nodoc
class __$$MessageDataImplCopyWithImpl<$Res>
    extends _$MessageDataCopyWithImpl<$Res, _$MessageDataImpl>
    implements _$$MessageDataImplCopyWith<$Res> {
  __$$MessageDataImplCopyWithImpl(
      _$MessageDataImpl _value, $Res Function(_$MessageDataImpl) _then)
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
    Object? error = freezed,
  }) {
    return _then(_$MessageDataImpl(
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
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$MessageDataImpl extends _MessageData {
  const _$MessageDataImpl(
      {required this.id,
      required this.author,
      required this.sentAt,
      this.remoteId,
      this.active = false,
      required this.status,
      this.error})
      : super._();

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
  final Object? error;

  @override
  String toString() {
    return 'MessageData(id: $id, author: $author, sentAt: $sentAt, remoteId: $remoteId, active: $active, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.remoteId, remoteId) ||
                other.remoteId == remoteId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, author, sentAt, remoteId,
      active, status, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDataImplCopyWith<_$MessageDataImpl> get copyWith =>
      __$$MessageDataImplCopyWithImpl<_$MessageDataImpl>(this, _$identity);
}

abstract class _MessageData extends MessageData {
  const factory _MessageData(
      {required final String id,
      required final Author author,
      required final DateTime sentAt,
      final String? remoteId,
      final bool active,
      required final MessageStatus status,
      final Object? error}) = _$MessageDataImpl;
  const _MessageData._() : super._();

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
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$MessageDataImplCopyWith<_$MessageDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TextMessageData {
  MessageData get message => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  PlaceExtraction get placeExtraction => throw _privateConstructorUsedError;

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
      {MessageData message, String text, PlaceExtraction placeExtraction});

  $MessageDataCopyWith<$Res> get message;
  $PlaceExtractionCopyWith<$Res> get placeExtraction;
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
    Object? placeExtraction = null,
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
      placeExtraction: null == placeExtraction
          ? _value.placeExtraction
          : placeExtraction // ignore: cast_nullable_to_non_nullable
              as PlaceExtraction,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageDataCopyWith<$Res> get message {
    return $MessageDataCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlaceExtractionCopyWith<$Res> get placeExtraction {
    return $PlaceExtractionCopyWith<$Res>(_value.placeExtraction, (value) {
      return _then(_value.copyWith(placeExtraction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TextMessageDataImplCopyWith<$Res>
    implements $TextMessageDataCopyWith<$Res> {
  factory _$$TextMessageDataImplCopyWith(_$TextMessageDataImpl value,
          $Res Function(_$TextMessageDataImpl) then) =
      __$$TextMessageDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MessageData message, String text, PlaceExtraction placeExtraction});

  @override
  $MessageDataCopyWith<$Res> get message;
  @override
  $PlaceExtractionCopyWith<$Res> get placeExtraction;
}

/// @nodoc
class __$$TextMessageDataImplCopyWithImpl<$Res>
    extends _$TextMessageDataCopyWithImpl<$Res, _$TextMessageDataImpl>
    implements _$$TextMessageDataImplCopyWith<$Res> {
  __$$TextMessageDataImplCopyWithImpl(
      _$TextMessageDataImpl _value, $Res Function(_$TextMessageDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? text = null,
    Object? placeExtraction = null,
  }) {
    return _then(_$TextMessageDataImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageData,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      placeExtraction: null == placeExtraction
          ? _value.placeExtraction
          : placeExtraction // ignore: cast_nullable_to_non_nullable
              as PlaceExtraction,
    ));
  }
}

/// @nodoc

class _$TextMessageDataImpl extends _TextMessageData {
  const _$TextMessageDataImpl(
      {required this.message,
      required this.text,
      this.placeExtraction = const PlaceExtraction(places: [])})
      : super._();

  @override
  final MessageData message;
  @override
  final String text;
  @override
  @JsonKey()
  final PlaceExtraction placeExtraction;

  @override
  String toString() {
    return 'TextMessageData(message: $message, text: $text, placeExtraction: $placeExtraction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextMessageDataImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.placeExtraction, placeExtraction) ||
                other.placeExtraction == placeExtraction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, text, placeExtraction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextMessageDataImplCopyWith<_$TextMessageDataImpl> get copyWith =>
      __$$TextMessageDataImplCopyWithImpl<_$TextMessageDataImpl>(
          this, _$identity);
}

abstract class _TextMessageData extends TextMessageData {
  const factory _TextMessageData(
      {required final MessageData message,
      required final String text,
      final PlaceExtraction placeExtraction}) = _$TextMessageDataImpl;
  const _TextMessageData._() : super._();

  @override
  MessageData get message;
  @override
  String get text;
  @override
  PlaceExtraction get placeExtraction;
  @override
  @JsonKey(ignore: true)
  _$$TextMessageDataImplCopyWith<_$TextMessageDataImpl> get copyWith =>
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
abstract class _$$AuthorImplCopyWith<$Res> implements $AuthorCopyWith<$Res> {
  factory _$$AuthorImplCopyWith(
          _$AuthorImpl value, $Res Function(_$AuthorImpl) then) =
      __$$AuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$AuthorImplCopyWithImpl<$Res>
    extends _$AuthorCopyWithImpl<$Res, _$AuthorImpl>
    implements _$$AuthorImplCopyWith<$Res> {
  __$$AuthorImplCopyWithImpl(
      _$AuthorImpl _value, $Res Function(_$AuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$AuthorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthorImpl extends _Author {
  const _$AuthorImpl({required this.id}) : super._();

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
            other is _$AuthorImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      __$$AuthorImplCopyWithImpl<_$AuthorImpl>(this, _$identity);
}

abstract class _Author extends Author {
  const factory _Author({required final String id}) = _$AuthorImpl;
  const _Author._() : super._();

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$AuthorImplCopyWith<_$AuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
