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
  String? get clientId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  LocationAnalysis get locationAnalysis => throw _privateConstructorUsedError;

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
      String? clientId,
      String text,
      Role role,
      DateTime sentAt,
      LocationAnalysis locationAnalysis});

  $LocationAnalysisCopyWith<$Res> get locationAnalysis;
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
    Object? clientId = freezed,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
    Object? locationAnalysis = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      locationAnalysis: null == locationAnalysis
          ? _value.locationAnalysis
          : locationAnalysis // ignore: cast_nullable_to_non_nullable
              as LocationAnalysis,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationAnalysisCopyWith<$Res> get locationAnalysis {
    return $LocationAnalysisCopyWith<$Res>(_value.locationAnalysis, (value) {
      return _then(_value.copyWith(locationAnalysis: value) as $Val);
    });
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
      String? clientId,
      String text,
      Role role,
      DateTime sentAt,
      LocationAnalysis locationAnalysis});

  @override
  $LocationAnalysisCopyWith<$Res> get locationAnalysis;
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
    Object? clientId = freezed,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
    Object? locationAnalysis = null,
  }) {
    return _then(_$_TextMessage(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      locationAnalysis: null == locationAnalysis
          ? _value.locationAnalysis
          : locationAnalysis // ignore: cast_nullable_to_non_nullable
              as LocationAnalysis,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_TextMessage extends _TextMessage {
  const _$_TextMessage(
      {required this.id,
      this.clientId,
      required this.text,
      required this.role,
      required this.sentAt,
      required this.locationAnalysis})
      : super._();

  factory _$_TextMessage.fromJson(Map<String, dynamic> json) =>
      _$$_TextMessageFromJson(json);

  @override
  final String id;
  @override
  final String? clientId;
  @override
  final String text;
  @override
  final Role role;
  @override
  final DateTime sentAt;
  @override
  final LocationAnalysis locationAnalysis;

  @override
  String toString() {
    return 'TextMessage(id: $id, clientId: $clientId, text: $text, role: $role, sentAt: $sentAt, locationAnalysis: $locationAnalysis)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextMessage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.locationAnalysis, locationAnalysis) ||
                other.locationAnalysis == locationAnalysis));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, clientId, text, role, sentAt, locationAnalysis);

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

abstract class _TextMessage extends TextMessage {
  const factory _TextMessage(
      {required final String id,
      final String? clientId,
      required final String text,
      required final Role role,
      required final DateTime sentAt,
      required final LocationAnalysis locationAnalysis}) = _$_TextMessage;
  const _TextMessage._() : super._();

  factory _TextMessage.fromJson(Map<String, dynamic> json) =
      _$_TextMessage.fromJson;

  @override
  String get id;
  @override
  String? get clientId;
  @override
  String get text;
  @override
  Role get role;
  @override
  DateTime get sentAt;
  @override
  LocationAnalysis get locationAnalysis;
  @override
  @JsonKey(ignore: true)
  _$$_TextMessageCopyWith<_$_TextMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationAnalysis _$LocationAnalysisFromJson(Map<String, dynamic> json) {
  return _LocationAnalysis.fromJson(json);
}

/// @nodoc
mixin _$LocationAnalysis {
  List<AnalyzedLocation> get locations => throw _privateConstructorUsedError;
  DateTime? get analyzedAt => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationAnalysisCopyWith<LocationAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationAnalysisCopyWith<$Res> {
  factory $LocationAnalysisCopyWith(
          LocationAnalysis value, $Res Function(LocationAnalysis) then) =
      _$LocationAnalysisCopyWithImpl<$Res, LocationAnalysis>;
  @useResult
  $Res call(
      {List<AnalyzedLocation> locations, DateTime? analyzedAt, String? error});
}

/// @nodoc
class _$LocationAnalysisCopyWithImpl<$Res, $Val extends LocationAnalysis>
    implements $LocationAnalysisCopyWith<$Res> {
  _$LocationAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? analyzedAt = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<AnalyzedLocation>,
      analyzedAt: freezed == analyzedAt
          ? _value.analyzedAt
          : analyzedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationAnalysisCopyWith<$Res>
    implements $LocationAnalysisCopyWith<$Res> {
  factory _$$_LocationAnalysisCopyWith(
          _$_LocationAnalysis value, $Res Function(_$_LocationAnalysis) then) =
      __$$_LocationAnalysisCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AnalyzedLocation> locations, DateTime? analyzedAt, String? error});
}

/// @nodoc
class __$$_LocationAnalysisCopyWithImpl<$Res>
    extends _$LocationAnalysisCopyWithImpl<$Res, _$_LocationAnalysis>
    implements _$$_LocationAnalysisCopyWith<$Res> {
  __$$_LocationAnalysisCopyWithImpl(
      _$_LocationAnalysis _value, $Res Function(_$_LocationAnalysis) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? analyzedAt = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_LocationAnalysis(
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<AnalyzedLocation>,
      analyzedAt: freezed == analyzedAt
          ? _value.analyzedAt
          : analyzedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_LocationAnalysis extends _LocationAnalysis {
  const _$_LocationAnalysis(
      {required final List<AnalyzedLocation> locations,
      this.analyzedAt,
      this.error})
      : _locations = locations,
        super._();

  factory _$_LocationAnalysis.fromJson(Map<String, dynamic> json) =>
      _$$_LocationAnalysisFromJson(json);

  final List<AnalyzedLocation> _locations;
  @override
  List<AnalyzedLocation> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  final DateTime? analyzedAt;
  @override
  final String? error;

  @override
  String toString() {
    return 'LocationAnalysis(locations: $locations, analyzedAt: $analyzedAt, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationAnalysis &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            (identical(other.analyzedAt, analyzedAt) ||
                other.analyzedAt == analyzedAt) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_locations), analyzedAt, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationAnalysisCopyWith<_$_LocationAnalysis> get copyWith =>
      __$$_LocationAnalysisCopyWithImpl<_$_LocationAnalysis>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationAnalysisToJson(
      this,
    );
  }
}

abstract class _LocationAnalysis extends LocationAnalysis {
  const factory _LocationAnalysis(
      {required final List<AnalyzedLocation> locations,
      final DateTime? analyzedAt,
      final String? error}) = _$_LocationAnalysis;
  const _LocationAnalysis._() : super._();

  factory _LocationAnalysis.fromJson(Map<String, dynamic> json) =
      _$_LocationAnalysis.fromJson;

  @override
  List<AnalyzedLocation> get locations;
  @override
  DateTime? get analyzedAt;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_LocationAnalysisCopyWith<_$_LocationAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyzedLocation _$AnalyzedLocationFromJson(Map<String, dynamic> json) {
  return _AnalyzedLocation.fromJson(json);
}

/// @nodoc
mixin _$AnalyzedLocation {
  String get text => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyzedLocationCopyWith<AnalyzedLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzedLocationCopyWith<$Res> {
  factory $AnalyzedLocationCopyWith(
          AnalyzedLocation value, $Res Function(AnalyzedLocation) then) =
      _$AnalyzedLocationCopyWithImpl<$Res, AnalyzedLocation>;
  @useResult
  $Res call({String text, Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$AnalyzedLocationCopyWithImpl<$Res, $Val extends AnalyzedLocation>
    implements $AnalyzedLocationCopyWith<$Res> {
  _$AnalyzedLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnalyzedLocationCopyWith<$Res>
    implements $AnalyzedLocationCopyWith<$Res> {
  factory _$$_AnalyzedLocationCopyWith(
          _$_AnalyzedLocation value, $Res Function(_$_AnalyzedLocation) then) =
      __$$_AnalyzedLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, Location location});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_AnalyzedLocationCopyWithImpl<$Res>
    extends _$AnalyzedLocationCopyWithImpl<$Res, _$_AnalyzedLocation>
    implements _$$_AnalyzedLocationCopyWith<$Res> {
  __$$_AnalyzedLocationCopyWithImpl(
      _$_AnalyzedLocation _value, $Res Function(_$_AnalyzedLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? location = null,
  }) {
    return _then(_$_AnalyzedLocation(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_AnalyzedLocation implements _AnalyzedLocation {
  const _$_AnalyzedLocation({required this.text, required this.location});

  factory _$_AnalyzedLocation.fromJson(Map<String, dynamic> json) =>
      _$$_AnalyzedLocationFromJson(json);

  @override
  final String text;
  @override
  final Location location;

  @override
  String toString() {
    return 'AnalyzedLocation(text: $text, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnalyzedLocation &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnalyzedLocationCopyWith<_$_AnalyzedLocation> get copyWith =>
      __$$_AnalyzedLocationCopyWithImpl<_$_AnalyzedLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnalyzedLocationToJson(
      this,
    );
  }
}

abstract class _AnalyzedLocation implements AnalyzedLocation {
  const factory _AnalyzedLocation(
      {required final String text,
      required final Location location}) = _$_AnalyzedLocation;

  factory _AnalyzedLocation.fromJson(Map<String, dynamic> json) =
      _$_AnalyzedLocation.fromJson;

  @override
  String get text;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$_AnalyzedLocationCopyWith<_$_AnalyzedLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TextMessageChunk {
  String get messageId => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;
  DateTime get sentAt => throw _privateConstructorUsedError;
  String? get clientId => throw _privateConstructorUsedError;
  bool get isLast => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextMessageChunkCopyWith<TextMessageChunk> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextMessageChunkCopyWith<$Res> {
  factory $TextMessageChunkCopyWith(
          TextMessageChunk value, $Res Function(TextMessageChunk) then) =
      _$TextMessageChunkCopyWithImpl<$Res, TextMessageChunk>;
  @useResult
  $Res call(
      {String messageId,
      String text,
      Role role,
      DateTime sentAt,
      String? clientId,
      bool isLast});
}

/// @nodoc
class _$TextMessageChunkCopyWithImpl<$Res, $Val extends TextMessageChunk>
    implements $TextMessageChunkCopyWith<$Res> {
  _$TextMessageChunkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
    Object? clientId = freezed,
    Object? isLast = null,
  }) {
    return _then(_value.copyWith(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
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
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextMessageChunkCopyWith<$Res>
    implements $TextMessageChunkCopyWith<$Res> {
  factory _$$_TextMessageChunkCopyWith(
          _$_TextMessageChunk value, $Res Function(_$_TextMessageChunk) then) =
      __$$_TextMessageChunkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String messageId,
      String text,
      Role role,
      DateTime sentAt,
      String? clientId,
      bool isLast});
}

/// @nodoc
class __$$_TextMessageChunkCopyWithImpl<$Res>
    extends _$TextMessageChunkCopyWithImpl<$Res, _$_TextMessageChunk>
    implements _$$_TextMessageChunkCopyWith<$Res> {
  __$$_TextMessageChunkCopyWithImpl(
      _$_TextMessageChunk _value, $Res Function(_$_TextMessageChunk) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? text = null,
    Object? role = null,
    Object? sentAt = null,
    Object? clientId = freezed,
    Object? isLast = null,
  }) {
    return _then(_$_TextMessageChunk(
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
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
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      isLast: null == isLast
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TextMessageChunk implements _TextMessageChunk {
  const _$_TextMessageChunk(
      {required this.messageId,
      required this.text,
      required this.role,
      required this.sentAt,
      this.clientId,
      required this.isLast});

  @override
  final String messageId;
  @override
  final String text;
  @override
  final Role role;
  @override
  final DateTime sentAt;
  @override
  final String? clientId;
  @override
  final bool isLast;

  @override
  String toString() {
    return 'TextMessageChunk(messageId: $messageId, text: $text, role: $role, sentAt: $sentAt, clientId: $clientId, isLast: $isLast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextMessageChunk &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.isLast, isLast) || other.isLast == isLast));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, messageId, text, role, sentAt, clientId, isLast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextMessageChunkCopyWith<_$_TextMessageChunk> get copyWith =>
      __$$_TextMessageChunkCopyWithImpl<_$_TextMessageChunk>(this, _$identity);
}

abstract class _TextMessageChunk implements TextMessageChunk {
  const factory _TextMessageChunk(
      {required final String messageId,
      required final String text,
      required final Role role,
      required final DateTime sentAt,
      final String? clientId,
      required final bool isLast}) = _$_TextMessageChunk;

  @override
  String get messageId;
  @override
  String get text;
  @override
  Role get role;
  @override
  DateTime get sentAt;
  @override
  String? get clientId;
  @override
  bool get isLast;
  @override
  @JsonKey(ignore: true)
  _$$_TextMessageChunkCopyWith<_$_TextMessageChunk> get copyWith =>
      throw _privateConstructorUsedError;
}
