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
abstract class _$$TextMessageImplCopyWith<$Res>
    implements $TextMessageCopyWith<$Res> {
  factory _$$TextMessageImplCopyWith(
          _$TextMessageImpl value, $Res Function(_$TextMessageImpl) then) =
      __$$TextMessageImplCopyWithImpl<$Res>;
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
class __$$TextMessageImplCopyWithImpl<$Res>
    extends _$TextMessageCopyWithImpl<$Res, _$TextMessageImpl>
    implements _$$TextMessageImplCopyWith<$Res> {
  __$$TextMessageImplCopyWithImpl(
      _$TextMessageImpl _value, $Res Function(_$TextMessageImpl) _then)
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
    return _then(_$TextMessageImpl(
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
@JsonSerializable()
class _$TextMessageImpl extends _TextMessage {
  const _$TextMessageImpl(
      {required this.id,
      this.clientId,
      required this.text,
      required this.role,
      required this.sentAt,
      required this.locationAnalysis})
      : super._();

  factory _$TextMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextMessageImplFromJson(json);

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
            other is _$TextMessageImpl &&
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
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      __$$TextMessageImplCopyWithImpl<_$TextMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextMessageImplToJson(
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
      required final LocationAnalysis locationAnalysis}) = _$TextMessageImpl;
  const _TextMessage._() : super._();

  factory _TextMessage.fromJson(Map<String, dynamic> json) =
      _$TextMessageImpl.fromJson;

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
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
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
abstract class _$$LocationAnalysisImplCopyWith<$Res>
    implements $LocationAnalysisCopyWith<$Res> {
  factory _$$LocationAnalysisImplCopyWith(_$LocationAnalysisImpl value,
          $Res Function(_$LocationAnalysisImpl) then) =
      __$$LocationAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AnalyzedLocation> locations, DateTime? analyzedAt, String? error});
}

/// @nodoc
class __$$LocationAnalysisImplCopyWithImpl<$Res>
    extends _$LocationAnalysisCopyWithImpl<$Res, _$LocationAnalysisImpl>
    implements _$$LocationAnalysisImplCopyWith<$Res> {
  __$$LocationAnalysisImplCopyWithImpl(_$LocationAnalysisImpl _value,
      $Res Function(_$LocationAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? analyzedAt = freezed,
    Object? error = freezed,
  }) {
    return _then(_$LocationAnalysisImpl(
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
@JsonSerializable()
class _$LocationAnalysisImpl extends _LocationAnalysis {
  const _$LocationAnalysisImpl(
      {required final List<AnalyzedLocation> locations,
      this.analyzedAt,
      this.error})
      : _locations = locations,
        super._();

  factory _$LocationAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationAnalysisImplFromJson(json);

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
            other is _$LocationAnalysisImpl &&
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
  _$$LocationAnalysisImplCopyWith<_$LocationAnalysisImpl> get copyWith =>
      __$$LocationAnalysisImplCopyWithImpl<_$LocationAnalysisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationAnalysisImplToJson(
      this,
    );
  }
}

abstract class _LocationAnalysis extends LocationAnalysis {
  const factory _LocationAnalysis(
      {required final List<AnalyzedLocation> locations,
      final DateTime? analyzedAt,
      final String? error}) = _$LocationAnalysisImpl;
  const _LocationAnalysis._() : super._();

  factory _LocationAnalysis.fromJson(Map<String, dynamic> json) =
      _$LocationAnalysisImpl.fromJson;

  @override
  List<AnalyzedLocation> get locations;
  @override
  DateTime? get analyzedAt;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$LocationAnalysisImplCopyWith<_$LocationAnalysisImpl> get copyWith =>
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
abstract class _$$AnalyzedLocationImplCopyWith<$Res>
    implements $AnalyzedLocationCopyWith<$Res> {
  factory _$$AnalyzedLocationImplCopyWith(_$AnalyzedLocationImpl value,
          $Res Function(_$AnalyzedLocationImpl) then) =
      __$$AnalyzedLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, Location location});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$AnalyzedLocationImplCopyWithImpl<$Res>
    extends _$AnalyzedLocationCopyWithImpl<$Res, _$AnalyzedLocationImpl>
    implements _$$AnalyzedLocationImplCopyWith<$Res> {
  __$$AnalyzedLocationImplCopyWithImpl(_$AnalyzedLocationImpl _value,
      $Res Function(_$AnalyzedLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? location = null,
  }) {
    return _then(_$AnalyzedLocationImpl(
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
@JsonSerializable()
class _$AnalyzedLocationImpl implements _AnalyzedLocation {
  const _$AnalyzedLocationImpl({required this.text, required this.location});

  factory _$AnalyzedLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyzedLocationImplFromJson(json);

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
            other is _$AnalyzedLocationImpl &&
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
  _$$AnalyzedLocationImplCopyWith<_$AnalyzedLocationImpl> get copyWith =>
      __$$AnalyzedLocationImplCopyWithImpl<_$AnalyzedLocationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyzedLocationImplToJson(
      this,
    );
  }
}

abstract class _AnalyzedLocation implements AnalyzedLocation {
  const factory _AnalyzedLocation(
      {required final String text,
      required final Location location}) = _$AnalyzedLocationImpl;

  factory _AnalyzedLocation.fromJson(Map<String, dynamic> json) =
      _$AnalyzedLocationImpl.fromJson;

  @override
  String get text;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$AnalyzedLocationImplCopyWith<_$AnalyzedLocationImpl> get copyWith =>
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
abstract class _$$TextMessageChunkImplCopyWith<$Res>
    implements $TextMessageChunkCopyWith<$Res> {
  factory _$$TextMessageChunkImplCopyWith(_$TextMessageChunkImpl value,
          $Res Function(_$TextMessageChunkImpl) then) =
      __$$TextMessageChunkImplCopyWithImpl<$Res>;
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
class __$$TextMessageChunkImplCopyWithImpl<$Res>
    extends _$TextMessageChunkCopyWithImpl<$Res, _$TextMessageChunkImpl>
    implements _$$TextMessageChunkImplCopyWith<$Res> {
  __$$TextMessageChunkImplCopyWithImpl(_$TextMessageChunkImpl _value,
      $Res Function(_$TextMessageChunkImpl) _then)
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
    return _then(_$TextMessageChunkImpl(
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

class _$TextMessageChunkImpl implements _TextMessageChunk {
  const _$TextMessageChunkImpl(
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
            other is _$TextMessageChunkImpl &&
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
  _$$TextMessageChunkImplCopyWith<_$TextMessageChunkImpl> get copyWith =>
      __$$TextMessageChunkImplCopyWithImpl<_$TextMessageChunkImpl>(
          this, _$identity);
}

abstract class _TextMessageChunk implements TextMessageChunk {
  const factory _TextMessageChunk(
      {required final String messageId,
      required final String text,
      required final Role role,
      required final DateTime sentAt,
      final String? clientId,
      required final bool isLast}) = _$TextMessageChunkImpl;

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
  _$$TextMessageChunkImplCopyWith<_$TextMessageChunkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
