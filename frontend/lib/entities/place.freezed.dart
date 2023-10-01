// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasicPlaceDetails _$BasicPlaceDetailsFromJson(Map<String, dynamic> json) {
  return _BasicPlaceDetails.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetails {
  String get name => throw _privateConstructorUsedError;
  String get formattedAddress => throw _privateConstructorUsedError;
  String get formattedPhoneNumber => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get userRatingsTotal => throw _privateConstructorUsedError;
  String get placeId => throw _privateConstructorUsedError;
  String get vicinity => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get internationalPhoneNumber => throw _privateConstructorUsedError;
  String get reference => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  BasicPlaceDetailsGeometry get geometry => throw _privateConstructorUsedError;
  BasicPlaceDetailsOpeningHours get openingHours =>
      throw _privateConstructorUsedError;
  List<BasicPlaceDetailsPhoto> get photos => throw _privateConstructorUsedError;
  List<BasicPlaceDetailsReview> get reviews =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsCopyWith<BasicPlaceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsCopyWith<$Res> {
  factory $BasicPlaceDetailsCopyWith(
          BasicPlaceDetails value, $Res Function(BasicPlaceDetails) then) =
      _$BasicPlaceDetailsCopyWithImpl<$Res, BasicPlaceDetails>;
  @useResult
  $Res call(
      {String name,
      String formattedAddress,
      String formattedPhoneNumber,
      String website,
      String url,
      double rating,
      int userRatingsTotal,
      String placeId,
      String vicinity,
      String icon,
      String internationalPhoneNumber,
      String reference,
      List<String> types,
      BasicPlaceDetailsGeometry geometry,
      BasicPlaceDetailsOpeningHours openingHours,
      List<BasicPlaceDetailsPhoto> photos,
      List<BasicPlaceDetailsReview> reviews});

  $BasicPlaceDetailsGeometryCopyWith<$Res> get geometry;
  $BasicPlaceDetailsOpeningHoursCopyWith<$Res> get openingHours;
}

/// @nodoc
class _$BasicPlaceDetailsCopyWithImpl<$Res, $Val extends BasicPlaceDetails>
    implements $BasicPlaceDetailsCopyWith<$Res> {
  _$BasicPlaceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? formattedAddress = null,
    Object? formattedPhoneNumber = null,
    Object? website = null,
    Object? url = null,
    Object? rating = null,
    Object? userRatingsTotal = null,
    Object? placeId = null,
    Object? vicinity = null,
    Object? icon = null,
    Object? internationalPhoneNumber = null,
    Object? reference = null,
    Object? types = null,
    Object? geometry = null,
    Object? openingHours = null,
    Object? photos = null,
    Object? reviews = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPhoneNumber: null == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      userRatingsTotal: null == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      internationalPhoneNumber: null == internationalPhoneNumber
          ? _value.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsGeometry,
      openingHours: null == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsOpeningHours,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<BasicPlaceDetailsPhoto>,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<BasicPlaceDetailsReview>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicPlaceDetailsGeometryCopyWith<$Res> get geometry {
    return $BasicPlaceDetailsGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicPlaceDetailsOpeningHoursCopyWith<$Res> get openingHours {
    return $BasicPlaceDetailsOpeningHoursCopyWith<$Res>(_value.openingHours,
        (value) {
      return _then(_value.copyWith(openingHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsCopyWith<$Res>
    implements $BasicPlaceDetailsCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsCopyWith(_$_BasicPlaceDetails value,
          $Res Function(_$_BasicPlaceDetails) then) =
      __$$_BasicPlaceDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String formattedAddress,
      String formattedPhoneNumber,
      String website,
      String url,
      double rating,
      int userRatingsTotal,
      String placeId,
      String vicinity,
      String icon,
      String internationalPhoneNumber,
      String reference,
      List<String> types,
      BasicPlaceDetailsGeometry geometry,
      BasicPlaceDetailsOpeningHours openingHours,
      List<BasicPlaceDetailsPhoto> photos,
      List<BasicPlaceDetailsReview> reviews});

  @override
  $BasicPlaceDetailsGeometryCopyWith<$Res> get geometry;
  @override
  $BasicPlaceDetailsOpeningHoursCopyWith<$Res> get openingHours;
}

/// @nodoc
class __$$_BasicPlaceDetailsCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsCopyWithImpl<$Res, _$_BasicPlaceDetails>
    implements _$$_BasicPlaceDetailsCopyWith<$Res> {
  __$$_BasicPlaceDetailsCopyWithImpl(
      _$_BasicPlaceDetails _value, $Res Function(_$_BasicPlaceDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? formattedAddress = null,
    Object? formattedPhoneNumber = null,
    Object? website = null,
    Object? url = null,
    Object? rating = null,
    Object? userRatingsTotal = null,
    Object? placeId = null,
    Object? vicinity = null,
    Object? icon = null,
    Object? internationalPhoneNumber = null,
    Object? reference = null,
    Object? types = null,
    Object? geometry = null,
    Object? openingHours = null,
    Object? photos = null,
    Object? reviews = null,
  }) {
    return _then(_$_BasicPlaceDetails(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      formattedPhoneNumber: null == formattedPhoneNumber
          ? _value.formattedPhoneNumber
          : formattedPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      userRatingsTotal: null == userRatingsTotal
          ? _value.userRatingsTotal
          : userRatingsTotal // ignore: cast_nullable_to_non_nullable
              as int,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      vicinity: null == vicinity
          ? _value.vicinity
          : vicinity // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      internationalPhoneNumber: null == internationalPhoneNumber
          ? _value.internationalPhoneNumber
          : internationalPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsGeometry,
      openingHours: null == openingHours
          ? _value.openingHours
          : openingHours // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsOpeningHours,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<BasicPlaceDetailsPhoto>,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<BasicPlaceDetailsReview>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetails implements _BasicPlaceDetails {
  const _$_BasicPlaceDetails(
      {required this.name,
      required this.formattedAddress,
      required this.formattedPhoneNumber,
      required this.website,
      required this.url,
      required this.rating,
      required this.userRatingsTotal,
      required this.placeId,
      required this.vicinity,
      required this.icon,
      required this.internationalPhoneNumber,
      required this.reference,
      required final List<String> types,
      required this.geometry,
      required this.openingHours,
      required final List<BasicPlaceDetailsPhoto> photos,
      required final List<BasicPlaceDetailsReview> reviews})
      : _types = types,
        _photos = photos,
        _reviews = reviews;

  factory _$_BasicPlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsFromJson(json);

  @override
  final String name;
  @override
  final String formattedAddress;
  @override
  final String formattedPhoneNumber;
  @override
  final String website;
  @override
  final String url;
  @override
  final double rating;
  @override
  final int userRatingsTotal;
  @override
  final String placeId;
  @override
  final String vicinity;
  @override
  final String icon;
  @override
  final String internationalPhoneNumber;
  @override
  final String reference;
  final List<String> _types;
  @override
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final BasicPlaceDetailsGeometry geometry;
  @override
  final BasicPlaceDetailsOpeningHours openingHours;
  final List<BasicPlaceDetailsPhoto> _photos;
  @override
  List<BasicPlaceDetailsPhoto> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  final List<BasicPlaceDetailsReview> _reviews;
  @override
  List<BasicPlaceDetailsReview> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  String toString() {
    return 'BasicPlaceDetails(name: $name, formattedAddress: $formattedAddress, formattedPhoneNumber: $formattedPhoneNumber, website: $website, url: $url, rating: $rating, userRatingsTotal: $userRatingsTotal, placeId: $placeId, vicinity: $vicinity, icon: $icon, internationalPhoneNumber: $internationalPhoneNumber, reference: $reference, types: $types, geometry: $geometry, openingHours: $openingHours, photos: $photos, reviews: $reviews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetails &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.formattedPhoneNumber, formattedPhoneNumber) ||
                other.formattedPhoneNumber == formattedPhoneNumber) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.userRatingsTotal, userRatingsTotal) ||
                other.userRatingsTotal == userRatingsTotal) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.vicinity, vicinity) ||
                other.vicinity == vicinity) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(
                    other.internationalPhoneNumber, internationalPhoneNumber) ||
                other.internationalPhoneNumber == internationalPhoneNumber) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.openingHours, openingHours) ||
                other.openingHours == openingHours) &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      formattedAddress,
      formattedPhoneNumber,
      website,
      url,
      rating,
      userRatingsTotal,
      placeId,
      vicinity,
      icon,
      internationalPhoneNumber,
      reference,
      const DeepCollectionEquality().hash(_types),
      geometry,
      openingHours,
      const DeepCollectionEquality().hash(_photos),
      const DeepCollectionEquality().hash(_reviews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsCopyWith<_$_BasicPlaceDetails> get copyWith =>
      __$$_BasicPlaceDetailsCopyWithImpl<_$_BasicPlaceDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetails implements BasicPlaceDetails {
  const factory _BasicPlaceDetails(
          {required final String name,
          required final String formattedAddress,
          required final String formattedPhoneNumber,
          required final String website,
          required final String url,
          required final double rating,
          required final int userRatingsTotal,
          required final String placeId,
          required final String vicinity,
          required final String icon,
          required final String internationalPhoneNumber,
          required final String reference,
          required final List<String> types,
          required final BasicPlaceDetailsGeometry geometry,
          required final BasicPlaceDetailsOpeningHours openingHours,
          required final List<BasicPlaceDetailsPhoto> photos,
          required final List<BasicPlaceDetailsReview> reviews}) =
      _$_BasicPlaceDetails;

  factory _BasicPlaceDetails.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetails.fromJson;

  @override
  String get name;
  @override
  String get formattedAddress;
  @override
  String get formattedPhoneNumber;
  @override
  String get website;
  @override
  String get url;
  @override
  double get rating;
  @override
  int get userRatingsTotal;
  @override
  String get placeId;
  @override
  String get vicinity;
  @override
  String get icon;
  @override
  String get internationalPhoneNumber;
  @override
  String get reference;
  @override
  List<String> get types;
  @override
  BasicPlaceDetailsGeometry get geometry;
  @override
  BasicPlaceDetailsOpeningHours get openingHours;
  @override
  List<BasicPlaceDetailsPhoto> get photos;
  @override
  List<BasicPlaceDetailsReview> get reviews;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsCopyWith<_$_BasicPlaceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

BasicPlaceDetailsGeometry _$BasicPlaceDetailsGeometryFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsGeometry.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsGeometry {
  BasicPlaceDetailsLocation get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsGeometryCopyWith<BasicPlaceDetailsGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsGeometryCopyWith<$Res> {
  factory $BasicPlaceDetailsGeometryCopyWith(BasicPlaceDetailsGeometry value,
          $Res Function(BasicPlaceDetailsGeometry) then) =
      _$BasicPlaceDetailsGeometryCopyWithImpl<$Res, BasicPlaceDetailsGeometry>;
  @useResult
  $Res call({BasicPlaceDetailsLocation location});

  $BasicPlaceDetailsLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$BasicPlaceDetailsGeometryCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsGeometry>
    implements $BasicPlaceDetailsGeometryCopyWith<$Res> {
  _$BasicPlaceDetailsGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsLocation,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicPlaceDetailsLocationCopyWith<$Res> get location {
    return $BasicPlaceDetailsLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsGeometryCopyWith<$Res>
    implements $BasicPlaceDetailsGeometryCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsGeometryCopyWith(
          _$_BasicPlaceDetailsGeometry value,
          $Res Function(_$_BasicPlaceDetailsGeometry) then) =
      __$$_BasicPlaceDetailsGeometryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BasicPlaceDetailsLocation location});

  @override
  $BasicPlaceDetailsLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_BasicPlaceDetailsGeometryCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsGeometryCopyWithImpl<$Res,
        _$_BasicPlaceDetailsGeometry>
    implements _$$_BasicPlaceDetailsGeometryCopyWith<$Res> {
  __$$_BasicPlaceDetailsGeometryCopyWithImpl(
      _$_BasicPlaceDetailsGeometry _value,
      $Res Function(_$_BasicPlaceDetailsGeometry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
  }) {
    return _then(_$_BasicPlaceDetailsGeometry(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsLocation,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsGeometry implements _BasicPlaceDetailsGeometry {
  const _$_BasicPlaceDetailsGeometry({required this.location});

  factory _$_BasicPlaceDetailsGeometry.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsGeometryFromJson(json);

  @override
  final BasicPlaceDetailsLocation location;

  @override
  String toString() {
    return 'BasicPlaceDetailsGeometry(location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsGeometry &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsGeometryCopyWith<_$_BasicPlaceDetailsGeometry>
      get copyWith => __$$_BasicPlaceDetailsGeometryCopyWithImpl<
          _$_BasicPlaceDetailsGeometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsGeometryToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsGeometry implements BasicPlaceDetailsGeometry {
  const factory _BasicPlaceDetailsGeometry(
          {required final BasicPlaceDetailsLocation location}) =
      _$_BasicPlaceDetailsGeometry;

  factory _BasicPlaceDetailsGeometry.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsGeometry.fromJson;

  @override
  BasicPlaceDetailsLocation get location;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsGeometryCopyWith<_$_BasicPlaceDetailsGeometry>
      get copyWith => throw _privateConstructorUsedError;
}

BasicPlaceDetailsLocation _$BasicPlaceDetailsLocationFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsLocation.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsLocation {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsLocationCopyWith<BasicPlaceDetailsLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsLocationCopyWith<$Res> {
  factory $BasicPlaceDetailsLocationCopyWith(BasicPlaceDetailsLocation value,
          $Res Function(BasicPlaceDetailsLocation) then) =
      _$BasicPlaceDetailsLocationCopyWithImpl<$Res, BasicPlaceDetailsLocation>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$BasicPlaceDetailsLocationCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsLocation>
    implements $BasicPlaceDetailsLocationCopyWith<$Res> {
  _$BasicPlaceDetailsLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsLocationCopyWith<$Res>
    implements $BasicPlaceDetailsLocationCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsLocationCopyWith(
          _$_BasicPlaceDetailsLocation value,
          $Res Function(_$_BasicPlaceDetailsLocation) then) =
      __$$_BasicPlaceDetailsLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_BasicPlaceDetailsLocationCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsLocationCopyWithImpl<$Res,
        _$_BasicPlaceDetailsLocation>
    implements _$$_BasicPlaceDetailsLocationCopyWith<$Res> {
  __$$_BasicPlaceDetailsLocationCopyWithImpl(
      _$_BasicPlaceDetailsLocation _value,
      $Res Function(_$_BasicPlaceDetailsLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_BasicPlaceDetailsLocation(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsLocation implements _BasicPlaceDetailsLocation {
  const _$_BasicPlaceDetailsLocation({required this.lat, required this.lng});

  factory _$_BasicPlaceDetailsLocation.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsLocationFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'BasicPlaceDetailsLocation(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsLocation &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsLocationCopyWith<_$_BasicPlaceDetailsLocation>
      get copyWith => __$$_BasicPlaceDetailsLocationCopyWithImpl<
          _$_BasicPlaceDetailsLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsLocationToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsLocation implements BasicPlaceDetailsLocation {
  const factory _BasicPlaceDetailsLocation(
      {required final double lat,
      required final double lng}) = _$_BasicPlaceDetailsLocation;

  factory _BasicPlaceDetailsLocation.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsLocation.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsLocationCopyWith<_$_BasicPlaceDetailsLocation>
      get copyWith => throw _privateConstructorUsedError;
}

BasicPlaceDetailsOpeningHours _$BasicPlaceDetailsOpeningHoursFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsOpeningHours.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsOpeningHours {
  bool get openNow => throw _privateConstructorUsedError;
  List<BasicPlaceDetailsPeriod> get periods =>
      throw _privateConstructorUsedError;
  List<String> get weekdayText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsOpeningHoursCopyWith<BasicPlaceDetailsOpeningHours>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsOpeningHoursCopyWith<$Res> {
  factory $BasicPlaceDetailsOpeningHoursCopyWith(
          BasicPlaceDetailsOpeningHours value,
          $Res Function(BasicPlaceDetailsOpeningHours) then) =
      _$BasicPlaceDetailsOpeningHoursCopyWithImpl<$Res,
          BasicPlaceDetailsOpeningHours>;
  @useResult
  $Res call(
      {bool openNow,
      List<BasicPlaceDetailsPeriod> periods,
      List<String> weekdayText});
}

/// @nodoc
class _$BasicPlaceDetailsOpeningHoursCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsOpeningHours>
    implements $BasicPlaceDetailsOpeningHoursCopyWith<$Res> {
  _$BasicPlaceDetailsOpeningHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
    Object? periods = null,
    Object? weekdayText = null,
  }) {
    return _then(_value.copyWith(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      periods: null == periods
          ? _value.periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<BasicPlaceDetailsPeriod>,
      weekdayText: null == weekdayText
          ? _value.weekdayText
          : weekdayText // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsOpeningHoursCopyWith<$Res>
    implements $BasicPlaceDetailsOpeningHoursCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsOpeningHoursCopyWith(
          _$_BasicPlaceDetailsOpeningHours value,
          $Res Function(_$_BasicPlaceDetailsOpeningHours) then) =
      __$$_BasicPlaceDetailsOpeningHoursCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool openNow,
      List<BasicPlaceDetailsPeriod> periods,
      List<String> weekdayText});
}

/// @nodoc
class __$$_BasicPlaceDetailsOpeningHoursCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsOpeningHoursCopyWithImpl<$Res,
        _$_BasicPlaceDetailsOpeningHours>
    implements _$$_BasicPlaceDetailsOpeningHoursCopyWith<$Res> {
  __$$_BasicPlaceDetailsOpeningHoursCopyWithImpl(
      _$_BasicPlaceDetailsOpeningHours _value,
      $Res Function(_$_BasicPlaceDetailsOpeningHours) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? openNow = null,
    Object? periods = null,
    Object? weekdayText = null,
  }) {
    return _then(_$_BasicPlaceDetailsOpeningHours(
      openNow: null == openNow
          ? _value.openNow
          : openNow // ignore: cast_nullable_to_non_nullable
              as bool,
      periods: null == periods
          ? _value._periods
          : periods // ignore: cast_nullable_to_non_nullable
              as List<BasicPlaceDetailsPeriod>,
      weekdayText: null == weekdayText
          ? _value._weekdayText
          : weekdayText // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsOpeningHours
    implements _BasicPlaceDetailsOpeningHours {
  const _$_BasicPlaceDetailsOpeningHours(
      {required this.openNow,
      required final List<BasicPlaceDetailsPeriod> periods,
      required final List<String> weekdayText})
      : _periods = periods,
        _weekdayText = weekdayText;

  factory _$_BasicPlaceDetailsOpeningHours.fromJson(
          Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsOpeningHoursFromJson(json);

  @override
  final bool openNow;
  final List<BasicPlaceDetailsPeriod> _periods;
  @override
  List<BasicPlaceDetailsPeriod> get periods {
    if (_periods is EqualUnmodifiableListView) return _periods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_periods);
  }

  final List<String> _weekdayText;
  @override
  List<String> get weekdayText {
    if (_weekdayText is EqualUnmodifiableListView) return _weekdayText;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdayText);
  }

  @override
  String toString() {
    return 'BasicPlaceDetailsOpeningHours(openNow: $openNow, periods: $periods, weekdayText: $weekdayText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsOpeningHours &&
            (identical(other.openNow, openNow) || other.openNow == openNow) &&
            const DeepCollectionEquality().equals(other._periods, _periods) &&
            const DeepCollectionEquality()
                .equals(other._weekdayText, _weekdayText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      openNow,
      const DeepCollectionEquality().hash(_periods),
      const DeepCollectionEquality().hash(_weekdayText));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsOpeningHoursCopyWith<_$_BasicPlaceDetailsOpeningHours>
      get copyWith => __$$_BasicPlaceDetailsOpeningHoursCopyWithImpl<
          _$_BasicPlaceDetailsOpeningHours>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsOpeningHoursToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsOpeningHours
    implements BasicPlaceDetailsOpeningHours {
  const factory _BasicPlaceDetailsOpeningHours(
          {required final bool openNow,
          required final List<BasicPlaceDetailsPeriod> periods,
          required final List<String> weekdayText}) =
      _$_BasicPlaceDetailsOpeningHours;

  factory _BasicPlaceDetailsOpeningHours.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsOpeningHours.fromJson;

  @override
  bool get openNow;
  @override
  List<BasicPlaceDetailsPeriod> get periods;
  @override
  List<String> get weekdayText;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsOpeningHoursCopyWith<_$_BasicPlaceDetailsOpeningHours>
      get copyWith => throw _privateConstructorUsedError;
}

BasicPlaceDetailsPeriod _$BasicPlaceDetailsPeriodFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsPeriod.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsPeriod {
  BasicPlaceDetailsPeriodClose get close => throw _privateConstructorUsedError;
  BasicPlaceDetailsPeriodOpen get open => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsPeriodCopyWith<BasicPlaceDetailsPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsPeriodCopyWith<$Res> {
  factory $BasicPlaceDetailsPeriodCopyWith(BasicPlaceDetailsPeriod value,
          $Res Function(BasicPlaceDetailsPeriod) then) =
      _$BasicPlaceDetailsPeriodCopyWithImpl<$Res, BasicPlaceDetailsPeriod>;
  @useResult
  $Res call(
      {BasicPlaceDetailsPeriodClose close, BasicPlaceDetailsPeriodOpen open});

  $BasicPlaceDetailsPeriodCloseCopyWith<$Res> get close;
  $BasicPlaceDetailsPeriodOpenCopyWith<$Res> get open;
}

/// @nodoc
class _$BasicPlaceDetailsPeriodCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsPeriod>
    implements $BasicPlaceDetailsPeriodCopyWith<$Res> {
  _$BasicPlaceDetailsPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? close = null,
    Object? open = null,
  }) {
    return _then(_value.copyWith(
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsPeriodClose,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsPeriodOpen,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicPlaceDetailsPeriodCloseCopyWith<$Res> get close {
    return $BasicPlaceDetailsPeriodCloseCopyWith<$Res>(_value.close, (value) {
      return _then(_value.copyWith(close: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BasicPlaceDetailsPeriodOpenCopyWith<$Res> get open {
    return $BasicPlaceDetailsPeriodOpenCopyWith<$Res>(_value.open, (value) {
      return _then(_value.copyWith(open: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsPeriodCopyWith<$Res>
    implements $BasicPlaceDetailsPeriodCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsPeriodCopyWith(_$_BasicPlaceDetailsPeriod value,
          $Res Function(_$_BasicPlaceDetailsPeriod) then) =
      __$$_BasicPlaceDetailsPeriodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BasicPlaceDetailsPeriodClose close, BasicPlaceDetailsPeriodOpen open});

  @override
  $BasicPlaceDetailsPeriodCloseCopyWith<$Res> get close;
  @override
  $BasicPlaceDetailsPeriodOpenCopyWith<$Res> get open;
}

/// @nodoc
class __$$_BasicPlaceDetailsPeriodCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsPeriodCopyWithImpl<$Res,
        _$_BasicPlaceDetailsPeriod>
    implements _$$_BasicPlaceDetailsPeriodCopyWith<$Res> {
  __$$_BasicPlaceDetailsPeriodCopyWithImpl(_$_BasicPlaceDetailsPeriod _value,
      $Res Function(_$_BasicPlaceDetailsPeriod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? close = null,
    Object? open = null,
  }) {
    return _then(_$_BasicPlaceDetailsPeriod(
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsPeriodClose,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as BasicPlaceDetailsPeriodOpen,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsPeriod implements _BasicPlaceDetailsPeriod {
  const _$_BasicPlaceDetailsPeriod({required this.close, required this.open});

  factory _$_BasicPlaceDetailsPeriod.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsPeriodFromJson(json);

  @override
  final BasicPlaceDetailsPeriodClose close;
  @override
  final BasicPlaceDetailsPeriodOpen open;

  @override
  String toString() {
    return 'BasicPlaceDetailsPeriod(close: $close, open: $open)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsPeriod &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.open, open) || other.open == open));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, close, open);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsPeriodCopyWith<_$_BasicPlaceDetailsPeriod>
      get copyWith =>
          __$$_BasicPlaceDetailsPeriodCopyWithImpl<_$_BasicPlaceDetailsPeriod>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsPeriodToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsPeriod implements BasicPlaceDetailsPeriod {
  const factory _BasicPlaceDetailsPeriod(
          {required final BasicPlaceDetailsPeriodClose close,
          required final BasicPlaceDetailsPeriodOpen open}) =
      _$_BasicPlaceDetailsPeriod;

  factory _BasicPlaceDetailsPeriod.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsPeriod.fromJson;

  @override
  BasicPlaceDetailsPeriodClose get close;
  @override
  BasicPlaceDetailsPeriodOpen get open;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsPeriodCopyWith<_$_BasicPlaceDetailsPeriod>
      get copyWith => throw _privateConstructorUsedError;
}

BasicPlaceDetailsPeriodClose _$BasicPlaceDetailsPeriodCloseFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsPeriodClose.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsPeriodClose {
  int get day => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsPeriodCloseCopyWith<BasicPlaceDetailsPeriodClose>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsPeriodCloseCopyWith<$Res> {
  factory $BasicPlaceDetailsPeriodCloseCopyWith(
          BasicPlaceDetailsPeriodClose value,
          $Res Function(BasicPlaceDetailsPeriodClose) then) =
      _$BasicPlaceDetailsPeriodCloseCopyWithImpl<$Res,
          BasicPlaceDetailsPeriodClose>;
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class _$BasicPlaceDetailsPeriodCloseCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsPeriodClose>
    implements $BasicPlaceDetailsPeriodCloseCopyWith<$Res> {
  _$BasicPlaceDetailsPeriodCloseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsPeriodCloseCopyWith<$Res>
    implements $BasicPlaceDetailsPeriodCloseCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsPeriodCloseCopyWith(
          _$_BasicPlaceDetailsPeriodClose value,
          $Res Function(_$_BasicPlaceDetailsPeriodClose) then) =
      __$$_BasicPlaceDetailsPeriodCloseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class __$$_BasicPlaceDetailsPeriodCloseCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsPeriodCloseCopyWithImpl<$Res,
        _$_BasicPlaceDetailsPeriodClose>
    implements _$$_BasicPlaceDetailsPeriodCloseCopyWith<$Res> {
  __$$_BasicPlaceDetailsPeriodCloseCopyWithImpl(
      _$_BasicPlaceDetailsPeriodClose _value,
      $Res Function(_$_BasicPlaceDetailsPeriodClose) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_$_BasicPlaceDetailsPeriodClose(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsPeriodClose implements _BasicPlaceDetailsPeriodClose {
  const _$_BasicPlaceDetailsPeriodClose(
      {required this.day, required this.time});

  factory _$_BasicPlaceDetailsPeriodClose.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsPeriodCloseFromJson(json);

  @override
  final int day;
  @override
  final String time;

  @override
  String toString() {
    return 'BasicPlaceDetailsPeriodClose(day: $day, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsPeriodClose &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsPeriodCloseCopyWith<_$_BasicPlaceDetailsPeriodClose>
      get copyWith => __$$_BasicPlaceDetailsPeriodCloseCopyWithImpl<
          _$_BasicPlaceDetailsPeriodClose>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsPeriodCloseToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsPeriodClose
    implements BasicPlaceDetailsPeriodClose {
  const factory _BasicPlaceDetailsPeriodClose(
      {required final int day,
      required final String time}) = _$_BasicPlaceDetailsPeriodClose;

  factory _BasicPlaceDetailsPeriodClose.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsPeriodClose.fromJson;

  @override
  int get day;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsPeriodCloseCopyWith<_$_BasicPlaceDetailsPeriodClose>
      get copyWith => throw _privateConstructorUsedError;
}

BasicPlaceDetailsPeriodOpen _$BasicPlaceDetailsPeriodOpenFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsPeriodOpen.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsPeriodOpen {
  int get day => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsPeriodOpenCopyWith<BasicPlaceDetailsPeriodOpen>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsPeriodOpenCopyWith<$Res> {
  factory $BasicPlaceDetailsPeriodOpenCopyWith(
          BasicPlaceDetailsPeriodOpen value,
          $Res Function(BasicPlaceDetailsPeriodOpen) then) =
      _$BasicPlaceDetailsPeriodOpenCopyWithImpl<$Res,
          BasicPlaceDetailsPeriodOpen>;
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class _$BasicPlaceDetailsPeriodOpenCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsPeriodOpen>
    implements $BasicPlaceDetailsPeriodOpenCopyWith<$Res> {
  _$BasicPlaceDetailsPeriodOpenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsPeriodOpenCopyWith<$Res>
    implements $BasicPlaceDetailsPeriodOpenCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsPeriodOpenCopyWith(
          _$_BasicPlaceDetailsPeriodOpen value,
          $Res Function(_$_BasicPlaceDetailsPeriodOpen) then) =
      __$$_BasicPlaceDetailsPeriodOpenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, String time});
}

/// @nodoc
class __$$_BasicPlaceDetailsPeriodOpenCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsPeriodOpenCopyWithImpl<$Res,
        _$_BasicPlaceDetailsPeriodOpen>
    implements _$$_BasicPlaceDetailsPeriodOpenCopyWith<$Res> {
  __$$_BasicPlaceDetailsPeriodOpenCopyWithImpl(
      _$_BasicPlaceDetailsPeriodOpen _value,
      $Res Function(_$_BasicPlaceDetailsPeriodOpen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? time = null,
  }) {
    return _then(_$_BasicPlaceDetailsPeriodOpen(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsPeriodOpen implements _BasicPlaceDetailsPeriodOpen {
  const _$_BasicPlaceDetailsPeriodOpen({required this.day, required this.time});

  factory _$_BasicPlaceDetailsPeriodOpen.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsPeriodOpenFromJson(json);

  @override
  final int day;
  @override
  final String time;

  @override
  String toString() {
    return 'BasicPlaceDetailsPeriodOpen(day: $day, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsPeriodOpen &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsPeriodOpenCopyWith<_$_BasicPlaceDetailsPeriodOpen>
      get copyWith => __$$_BasicPlaceDetailsPeriodOpenCopyWithImpl<
          _$_BasicPlaceDetailsPeriodOpen>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsPeriodOpenToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsPeriodOpen
    implements BasicPlaceDetailsPeriodOpen {
  const factory _BasicPlaceDetailsPeriodOpen(
      {required final int day,
      required final String time}) = _$_BasicPlaceDetailsPeriodOpen;

  factory _BasicPlaceDetailsPeriodOpen.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsPeriodOpen.fromJson;

  @override
  int get day;
  @override
  String get time;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsPeriodOpenCopyWith<_$_BasicPlaceDetailsPeriodOpen>
      get copyWith => throw _privateConstructorUsedError;
}

BasicPlaceDetailsPhoto _$BasicPlaceDetailsPhotoFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsPhoto.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsPhoto {
  int get height => throw _privateConstructorUsedError;
  List<String> get htmlAttributions => throw _privateConstructorUsedError;
  String get photoReference => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsPhotoCopyWith<BasicPlaceDetailsPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsPhotoCopyWith<$Res> {
  factory $BasicPlaceDetailsPhotoCopyWith(BasicPlaceDetailsPhoto value,
          $Res Function(BasicPlaceDetailsPhoto) then) =
      _$BasicPlaceDetailsPhotoCopyWithImpl<$Res, BasicPlaceDetailsPhoto>;
  @useResult
  $Res call(
      {int height,
      List<String> htmlAttributions,
      String photoReference,
      int width});
}

/// @nodoc
class _$BasicPlaceDetailsPhotoCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsPhoto>
    implements $BasicPlaceDetailsPhotoCopyWith<$Res> {
  _$BasicPlaceDetailsPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? htmlAttributions = null,
    Object? photoReference = null,
    Object? width = null,
  }) {
    return _then(_value.copyWith(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      htmlAttributions: null == htmlAttributions
          ? _value.htmlAttributions
          : htmlAttributions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoReference: null == photoReference
          ? _value.photoReference
          : photoReference // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsPhotoCopyWith<$Res>
    implements $BasicPlaceDetailsPhotoCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsPhotoCopyWith(_$_BasicPlaceDetailsPhoto value,
          $Res Function(_$_BasicPlaceDetailsPhoto) then) =
      __$$_BasicPlaceDetailsPhotoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int height,
      List<String> htmlAttributions,
      String photoReference,
      int width});
}

/// @nodoc
class __$$_BasicPlaceDetailsPhotoCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsPhotoCopyWithImpl<$Res,
        _$_BasicPlaceDetailsPhoto>
    implements _$$_BasicPlaceDetailsPhotoCopyWith<$Res> {
  __$$_BasicPlaceDetailsPhotoCopyWithImpl(_$_BasicPlaceDetailsPhoto _value,
      $Res Function(_$_BasicPlaceDetailsPhoto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? height = null,
    Object? htmlAttributions = null,
    Object? photoReference = null,
    Object? width = null,
  }) {
    return _then(_$_BasicPlaceDetailsPhoto(
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      htmlAttributions: null == htmlAttributions
          ? _value._htmlAttributions
          : htmlAttributions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      photoReference: null == photoReference
          ? _value.photoReference
          : photoReference // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsPhoto implements _BasicPlaceDetailsPhoto {
  const _$_BasicPlaceDetailsPhoto(
      {required this.height,
      required final List<String> htmlAttributions,
      required this.photoReference,
      required this.width})
      : _htmlAttributions = htmlAttributions;

  factory _$_BasicPlaceDetailsPhoto.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsPhotoFromJson(json);

  @override
  final int height;
  final List<String> _htmlAttributions;
  @override
  List<String> get htmlAttributions {
    if (_htmlAttributions is EqualUnmodifiableListView)
      return _htmlAttributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_htmlAttributions);
  }

  @override
  final String photoReference;
  @override
  final int width;

  @override
  String toString() {
    return 'BasicPlaceDetailsPhoto(height: $height, htmlAttributions: $htmlAttributions, photoReference: $photoReference, width: $width)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsPhoto &&
            (identical(other.height, height) || other.height == height) &&
            const DeepCollectionEquality()
                .equals(other._htmlAttributions, _htmlAttributions) &&
            (identical(other.photoReference, photoReference) ||
                other.photoReference == photoReference) &&
            (identical(other.width, width) || other.width == width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      height,
      const DeepCollectionEquality().hash(_htmlAttributions),
      photoReference,
      width);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsPhotoCopyWith<_$_BasicPlaceDetailsPhoto> get copyWith =>
      __$$_BasicPlaceDetailsPhotoCopyWithImpl<_$_BasicPlaceDetailsPhoto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsPhotoToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsPhoto implements BasicPlaceDetailsPhoto {
  const factory _BasicPlaceDetailsPhoto(
      {required final int height,
      required final List<String> htmlAttributions,
      required final String photoReference,
      required final int width}) = _$_BasicPlaceDetailsPhoto;

  factory _BasicPlaceDetailsPhoto.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsPhoto.fromJson;

  @override
  int get height;
  @override
  List<String> get htmlAttributions;
  @override
  String get photoReference;
  @override
  int get width;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsPhotoCopyWith<_$_BasicPlaceDetailsPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

BasicPlaceDetailsReview _$BasicPlaceDetailsReviewFromJson(
    Map<String, dynamic> json) {
  return _BasicPlaceDetailsReview.fromJson(json);
}

/// @nodoc
mixin _$BasicPlaceDetailsReview {
  String get authorName => throw _privateConstructorUsedError;
  String get authorUrl => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get profilePhotoUrl => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  String get relativeTimeDescription => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicPlaceDetailsReviewCopyWith<BasicPlaceDetailsReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicPlaceDetailsReviewCopyWith<$Res> {
  factory $BasicPlaceDetailsReviewCopyWith(BasicPlaceDetailsReview value,
          $Res Function(BasicPlaceDetailsReview) then) =
      _$BasicPlaceDetailsReviewCopyWithImpl<$Res, BasicPlaceDetailsReview>;
  @useResult
  $Res call(
      {String authorName,
      String authorUrl,
      String language,
      String profilePhotoUrl,
      int rating,
      String relativeTimeDescription,
      String text,
      int time});
}

/// @nodoc
class _$BasicPlaceDetailsReviewCopyWithImpl<$Res,
        $Val extends BasicPlaceDetailsReview>
    implements $BasicPlaceDetailsReviewCopyWith<$Res> {
  _$BasicPlaceDetailsReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorName = null,
    Object? authorUrl = null,
    Object? language = null,
    Object? profilePhotoUrl = null,
    Object? rating = null,
    Object? relativeTimeDescription = null,
    Object? text = null,
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      authorUrl: null == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: null == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      relativeTimeDescription: null == relativeTimeDescription
          ? _value.relativeTimeDescription
          : relativeTimeDescription // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicPlaceDetailsReviewCopyWith<$Res>
    implements $BasicPlaceDetailsReviewCopyWith<$Res> {
  factory _$$_BasicPlaceDetailsReviewCopyWith(_$_BasicPlaceDetailsReview value,
          $Res Function(_$_BasicPlaceDetailsReview) then) =
      __$$_BasicPlaceDetailsReviewCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String authorName,
      String authorUrl,
      String language,
      String profilePhotoUrl,
      int rating,
      String relativeTimeDescription,
      String text,
      int time});
}

/// @nodoc
class __$$_BasicPlaceDetailsReviewCopyWithImpl<$Res>
    extends _$BasicPlaceDetailsReviewCopyWithImpl<$Res,
        _$_BasicPlaceDetailsReview>
    implements _$$_BasicPlaceDetailsReviewCopyWith<$Res> {
  __$$_BasicPlaceDetailsReviewCopyWithImpl(_$_BasicPlaceDetailsReview _value,
      $Res Function(_$_BasicPlaceDetailsReview) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorName = null,
    Object? authorUrl = null,
    Object? language = null,
    Object? profilePhotoUrl = null,
    Object? rating = null,
    Object? relativeTimeDescription = null,
    Object? text = null,
    Object? time = null,
  }) {
    return _then(_$_BasicPlaceDetailsReview(
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      authorUrl: null == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoUrl: null == profilePhotoUrl
          ? _value.profilePhotoUrl
          : profilePhotoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      relativeTimeDescription: null == relativeTimeDescription
          ? _value.relativeTimeDescription
          : relativeTimeDescription // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BasicPlaceDetailsReview implements _BasicPlaceDetailsReview {
  const _$_BasicPlaceDetailsReview(
      {required this.authorName,
      required this.authorUrl,
      required this.language,
      required this.profilePhotoUrl,
      required this.rating,
      required this.relativeTimeDescription,
      required this.text,
      required this.time});

  factory _$_BasicPlaceDetailsReview.fromJson(Map<String, dynamic> json) =>
      _$$_BasicPlaceDetailsReviewFromJson(json);

  @override
  final String authorName;
  @override
  final String authorUrl;
  @override
  final String language;
  @override
  final String profilePhotoUrl;
  @override
  final int rating;
  @override
  final String relativeTimeDescription;
  @override
  final String text;
  @override
  final int time;

  @override
  String toString() {
    return 'BasicPlaceDetailsReview(authorName: $authorName, authorUrl: $authorUrl, language: $language, profilePhotoUrl: $profilePhotoUrl, rating: $rating, relativeTimeDescription: $relativeTimeDescription, text: $text, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicPlaceDetailsReview &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.profilePhotoUrl, profilePhotoUrl) ||
                other.profilePhotoUrl == profilePhotoUrl) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(
                    other.relativeTimeDescription, relativeTimeDescription) ||
                other.relativeTimeDescription == relativeTimeDescription) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authorName, authorUrl, language,
      profilePhotoUrl, rating, relativeTimeDescription, text, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicPlaceDetailsReviewCopyWith<_$_BasicPlaceDetailsReview>
      get copyWith =>
          __$$_BasicPlaceDetailsReviewCopyWithImpl<_$_BasicPlaceDetailsReview>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicPlaceDetailsReviewToJson(
      this,
    );
  }
}

abstract class _BasicPlaceDetailsReview implements BasicPlaceDetailsReview {
  const factory _BasicPlaceDetailsReview(
      {required final String authorName,
      required final String authorUrl,
      required final String language,
      required final String profilePhotoUrl,
      required final int rating,
      required final String relativeTimeDescription,
      required final String text,
      required final int time}) = _$_BasicPlaceDetailsReview;

  factory _BasicPlaceDetailsReview.fromJson(Map<String, dynamic> json) =
      _$_BasicPlaceDetailsReview.fromJson;

  @override
  String get authorName;
  @override
  String get authorUrl;
  @override
  String get language;
  @override
  String get profilePhotoUrl;
  @override
  int get rating;
  @override
  String get relativeTimeDescription;
  @override
  String get text;
  @override
  int get time;
  @override
  @JsonKey(ignore: true)
  _$$_BasicPlaceDetailsReviewCopyWith<_$_BasicPlaceDetailsReview>
      get copyWith => throw _privateConstructorUsedError;
}
