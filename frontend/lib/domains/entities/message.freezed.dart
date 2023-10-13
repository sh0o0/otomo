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
  PlaceExtraction get placeExtraction => throw _privateConstructorUsedError;

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
      PlaceExtraction placeExtraction});

  $PlaceExtractionCopyWith<$Res> get placeExtraction;
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
    Object? placeExtraction = null,
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
      placeExtraction: null == placeExtraction
          ? _value.placeExtraction
          : placeExtraction // ignore: cast_nullable_to_non_nullable
              as PlaceExtraction,
    ) as $Val);
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
      PlaceExtraction placeExtraction});

  @override
  $PlaceExtractionCopyWith<$Res> get placeExtraction;
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
    Object? placeExtraction = null,
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
      placeExtraction: null == placeExtraction
          ? _value.placeExtraction
          : placeExtraction // ignore: cast_nullable_to_non_nullable
              as PlaceExtraction,
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
      required this.placeExtraction})
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
  final PlaceExtraction placeExtraction;

  @override
  String toString() {
    return 'TextMessage(id: $id, clientId: $clientId, text: $text, role: $role, sentAt: $sentAt, placeExtraction: $placeExtraction)';
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
            (identical(other.placeExtraction, placeExtraction) ||
                other.placeExtraction == placeExtraction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, clientId, text, role, sentAt, placeExtraction);

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
      required final PlaceExtraction placeExtraction}) = _$TextMessageImpl;
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
  PlaceExtraction get placeExtraction;
  @override
  @JsonKey(ignore: true)
  _$$TextMessageImplCopyWith<_$TextMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlaceExtraction _$PlaceExtractionFromJson(Map<String, dynamic> json) {
  return _PlaceExtraction.fromJson(json);
}

/// @nodoc
mixin _$PlaceExtraction {
  List<ExtractedPlace> get places => throw _privateConstructorUsedError;
  DateTime? get processedAt => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceExtractionCopyWith<PlaceExtraction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceExtractionCopyWith<$Res> {
  factory $PlaceExtractionCopyWith(
          PlaceExtraction value, $Res Function(PlaceExtraction) then) =
      _$PlaceExtractionCopyWithImpl<$Res, PlaceExtraction>;
  @useResult
  $Res call(
      {List<ExtractedPlace> places, DateTime? processedAt, String? error});
}

/// @nodoc
class _$PlaceExtractionCopyWithImpl<$Res, $Val extends PlaceExtraction>
    implements $PlaceExtractionCopyWith<$Res> {
  _$PlaceExtractionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
    Object? processedAt = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      places: null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<ExtractedPlace>,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceExtractionImplCopyWith<$Res>
    implements $PlaceExtractionCopyWith<$Res> {
  factory _$$PlaceExtractionImplCopyWith(_$PlaceExtractionImpl value,
          $Res Function(_$PlaceExtractionImpl) then) =
      __$$PlaceExtractionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ExtractedPlace> places, DateTime? processedAt, String? error});
}

/// @nodoc
class __$$PlaceExtractionImplCopyWithImpl<$Res>
    extends _$PlaceExtractionCopyWithImpl<$Res, _$PlaceExtractionImpl>
    implements _$$PlaceExtractionImplCopyWith<$Res> {
  __$$PlaceExtractionImplCopyWithImpl(
      _$PlaceExtractionImpl _value, $Res Function(_$PlaceExtractionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
    Object? processedAt = freezed,
    Object? error = freezed,
  }) {
    return _then(_$PlaceExtractionImpl(
      places: null == places
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<ExtractedPlace>,
      processedAt: freezed == processedAt
          ? _value.processedAt
          : processedAt // ignore: cast_nullable_to_non_nullable
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
class _$PlaceExtractionImpl extends _PlaceExtraction {
  const _$PlaceExtractionImpl(
      {required final List<ExtractedPlace> places,
      this.processedAt,
      this.error})
      : _places = places,
        super._();

  factory _$PlaceExtractionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceExtractionImplFromJson(json);

  final List<ExtractedPlace> _places;
  @override
  List<ExtractedPlace> get places {
    if (_places is EqualUnmodifiableListView) return _places;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  final DateTime? processedAt;
  @override
  final String? error;

  @override
  String toString() {
    return 'PlaceExtraction(places: $places, processedAt: $processedAt, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceExtractionImpl &&
            const DeepCollectionEquality().equals(other._places, _places) &&
            (identical(other.processedAt, processedAt) ||
                other.processedAt == processedAt) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_places), processedAt, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceExtractionImplCopyWith<_$PlaceExtractionImpl> get copyWith =>
      __$$PlaceExtractionImplCopyWithImpl<_$PlaceExtractionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceExtractionImplToJson(
      this,
    );
  }
}

abstract class _PlaceExtraction extends PlaceExtraction {
  const factory _PlaceExtraction(
      {required final List<ExtractedPlace> places,
      final DateTime? processedAt,
      final String? error}) = _$PlaceExtractionImpl;
  const _PlaceExtraction._() : super._();

  factory _PlaceExtraction.fromJson(Map<String, dynamic> json) =
      _$PlaceExtractionImpl.fromJson;

  @override
  List<ExtractedPlace> get places;
  @override
  DateTime? get processedAt;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$PlaceExtractionImplCopyWith<_$PlaceExtractionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtractedPlace _$ExtractedPlaceFromJson(Map<String, dynamic> json) {
  return _ExtractedPlace.fromJson(json);
}

/// @nodoc
mixin _$ExtractedPlace {
  String get text => throw _privateConstructorUsedError;
  GeocodedPlace? get geocodedPlace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtractedPlaceCopyWith<ExtractedPlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtractedPlaceCopyWith<$Res> {
  factory $ExtractedPlaceCopyWith(
          ExtractedPlace value, $Res Function(ExtractedPlace) then) =
      _$ExtractedPlaceCopyWithImpl<$Res, ExtractedPlace>;
  @useResult
  $Res call({String text, GeocodedPlace? geocodedPlace});

  $GeocodedPlaceCopyWith<$Res>? get geocodedPlace;
}

/// @nodoc
class _$ExtractedPlaceCopyWithImpl<$Res, $Val extends ExtractedPlace>
    implements $ExtractedPlaceCopyWith<$Res> {
  _$ExtractedPlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? geocodedPlace = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      geocodedPlace: freezed == geocodedPlace
          ? _value.geocodedPlace
          : geocodedPlace // ignore: cast_nullable_to_non_nullable
              as GeocodedPlace?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeocodedPlaceCopyWith<$Res>? get geocodedPlace {
    if (_value.geocodedPlace == null) {
      return null;
    }

    return $GeocodedPlaceCopyWith<$Res>(_value.geocodedPlace!, (value) {
      return _then(_value.copyWith(geocodedPlace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtractedPlaceImplCopyWith<$Res>
    implements $ExtractedPlaceCopyWith<$Res> {
  factory _$$ExtractedPlaceImplCopyWith(_$ExtractedPlaceImpl value,
          $Res Function(_$ExtractedPlaceImpl) then) =
      __$$ExtractedPlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, GeocodedPlace? geocodedPlace});

  @override
  $GeocodedPlaceCopyWith<$Res>? get geocodedPlace;
}

/// @nodoc
class __$$ExtractedPlaceImplCopyWithImpl<$Res>
    extends _$ExtractedPlaceCopyWithImpl<$Res, _$ExtractedPlaceImpl>
    implements _$$ExtractedPlaceImplCopyWith<$Res> {
  __$$ExtractedPlaceImplCopyWithImpl(
      _$ExtractedPlaceImpl _value, $Res Function(_$ExtractedPlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? geocodedPlace = freezed,
  }) {
    return _then(_$ExtractedPlaceImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      geocodedPlace: freezed == geocodedPlace
          ? _value.geocodedPlace
          : geocodedPlace // ignore: cast_nullable_to_non_nullable
              as GeocodedPlace?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtractedPlaceImpl implements _ExtractedPlace {
  const _$ExtractedPlaceImpl({required this.text, required this.geocodedPlace});

  factory _$ExtractedPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtractedPlaceImplFromJson(json);

  @override
  final String text;
  @override
  final GeocodedPlace? geocodedPlace;

  @override
  String toString() {
    return 'ExtractedPlace(text: $text, geocodedPlace: $geocodedPlace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtractedPlaceImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.geocodedPlace, geocodedPlace) ||
                other.geocodedPlace == geocodedPlace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, geocodedPlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtractedPlaceImplCopyWith<_$ExtractedPlaceImpl> get copyWith =>
      __$$ExtractedPlaceImplCopyWithImpl<_$ExtractedPlaceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtractedPlaceImplToJson(
      this,
    );
  }
}

abstract class _ExtractedPlace implements ExtractedPlace {
  const factory _ExtractedPlace(
      {required final String text,
      required final GeocodedPlace? geocodedPlace}) = _$ExtractedPlaceImpl;

  factory _ExtractedPlace.fromJson(Map<String, dynamic> json) =
      _$ExtractedPlaceImpl.fromJson;

  @override
  String get text;
  @override
  GeocodedPlace? get geocodedPlace;
  @override
  @JsonKey(ignore: true)
  _$$ExtractedPlaceImplCopyWith<_$ExtractedPlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GeocodedPlace _$GeocodedPlaceFromJson(Map<String, dynamic> json) {
  return _GeocodedPlace.fromJson(json);
}

/// @nodoc
mixin _$GeocodedPlace {
  String get googlePlaceId => throw _privateConstructorUsedError;
  AppLatLng get latLng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocodedPlaceCopyWith<GeocodedPlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocodedPlaceCopyWith<$Res> {
  factory $GeocodedPlaceCopyWith(
          GeocodedPlace value, $Res Function(GeocodedPlace) then) =
      _$GeocodedPlaceCopyWithImpl<$Res, GeocodedPlace>;
  @useResult
  $Res call({String googlePlaceId, AppLatLng latLng});

  $AppLatLngCopyWith<$Res> get latLng;
}

/// @nodoc
class _$GeocodedPlaceCopyWithImpl<$Res, $Val extends GeocodedPlace>
    implements $GeocodedPlaceCopyWith<$Res> {
  _$GeocodedPlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googlePlaceId = null,
    Object? latLng = null,
  }) {
    return _then(_value.copyWith(
      googlePlaceId: null == googlePlaceId
          ? _value.googlePlaceId
          : googlePlaceId // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppLatLngCopyWith<$Res> get latLng {
    return $AppLatLngCopyWith<$Res>(_value.latLng, (value) {
      return _then(_value.copyWith(latLng: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GeocodedPlaceImplCopyWith<$Res>
    implements $GeocodedPlaceCopyWith<$Res> {
  factory _$$GeocodedPlaceImplCopyWith(
          _$GeocodedPlaceImpl value, $Res Function(_$GeocodedPlaceImpl) then) =
      __$$GeocodedPlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String googlePlaceId, AppLatLng latLng});

  @override
  $AppLatLngCopyWith<$Res> get latLng;
}

/// @nodoc
class __$$GeocodedPlaceImplCopyWithImpl<$Res>
    extends _$GeocodedPlaceCopyWithImpl<$Res, _$GeocodedPlaceImpl>
    implements _$$GeocodedPlaceImplCopyWith<$Res> {
  __$$GeocodedPlaceImplCopyWithImpl(
      _$GeocodedPlaceImpl _value, $Res Function(_$GeocodedPlaceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googlePlaceId = null,
    Object? latLng = null,
  }) {
    return _then(_$GeocodedPlaceImpl(
      googlePlaceId: null == googlePlaceId
          ? _value.googlePlaceId
          : googlePlaceId // ignore: cast_nullable_to_non_nullable
              as String,
      latLng: null == latLng
          ? _value.latLng
          : latLng // ignore: cast_nullable_to_non_nullable
              as AppLatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GeocodedPlaceImpl implements _GeocodedPlace {
  const _$GeocodedPlaceImpl(
      {required this.googlePlaceId, required this.latLng});

  factory _$GeocodedPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeocodedPlaceImplFromJson(json);

  @override
  final String googlePlaceId;
  @override
  final AppLatLng latLng;

  @override
  String toString() {
    return 'GeocodedPlace(googlePlaceId: $googlePlaceId, latLng: $latLng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeocodedPlaceImpl &&
            (identical(other.googlePlaceId, googlePlaceId) ||
                other.googlePlaceId == googlePlaceId) &&
            (identical(other.latLng, latLng) || other.latLng == latLng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, googlePlaceId, latLng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeocodedPlaceImplCopyWith<_$GeocodedPlaceImpl> get copyWith =>
      __$$GeocodedPlaceImplCopyWithImpl<_$GeocodedPlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GeocodedPlaceImplToJson(
      this,
    );
  }
}

abstract class _GeocodedPlace implements GeocodedPlace {
  const factory _GeocodedPlace(
      {required final String googlePlaceId,
      required final AppLatLng latLng}) = _$GeocodedPlaceImpl;

  factory _GeocodedPlace.fromJson(Map<String, dynamic> json) =
      _$GeocodedPlaceImpl.fromJson;

  @override
  String get googlePlaceId;
  @override
  AppLatLng get latLng;
  @override
  @JsonKey(ignore: true)
  _$$GeocodedPlaceImplCopyWith<_$GeocodedPlaceImpl> get copyWith =>
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
