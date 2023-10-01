import 'package:freezed_annotation/freezed_annotation.dart';
part 'place.freezed.dart';
part 'place.g.dart';

@freezed
class BasicPlaceDetails with _$BasicPlaceDetails {
  const factory BasicPlaceDetails({
    required String name,
    required String formattedAddress,
    required String formattedPhoneNumber,
    required String website,
    required String url,
    required double rating,
    required int userRatingsTotal,
    required String placeId,
    required String vicinity,
    required String icon,
    required String internationalPhoneNumber,
    required String reference,
    required List<String> types,
    required BasicPlaceDetailsGeometry geometry,
    required BasicPlaceDetailsOpeningHours openingHours,
    required List<BasicPlaceDetailsPhoto> photos,
    required List<BasicPlaceDetailsReview> reviews,
  }) = _BasicPlaceDetails;

  factory BasicPlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsFromJson(json);
}

@freezed
class BasicPlaceDetailsGeometry with _$BasicPlaceDetailsGeometry {
  const factory BasicPlaceDetailsGeometry({
    required BasicPlaceDetailsLocation location,
  }) = _BasicPlaceDetailsGeometry;

  factory BasicPlaceDetailsGeometry.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsGeometryFromJson(json);
}

@freezed
class BasicPlaceDetailsLocation with _$BasicPlaceDetailsLocation {
  const factory BasicPlaceDetailsLocation({
    required double lat,
    required double lng,
  }) = _BasicPlaceDetailsLocation;

  factory BasicPlaceDetailsLocation.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsLocationFromJson(json);
}

@freezed
class BasicPlaceDetailsOpeningHours with _$BasicPlaceDetailsOpeningHours {
  const factory BasicPlaceDetailsOpeningHours({
    required bool openNow,
    required List<BasicPlaceDetailsPeriod> periods,
    required List<String> weekdayText,
  }) = _BasicPlaceDetailsOpeningHours;

  factory BasicPlaceDetailsOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsOpeningHoursFromJson(json);
}

@freezed
class BasicPlaceDetailsPeriod with _$BasicPlaceDetailsPeriod {
  const factory BasicPlaceDetailsPeriod({
    required BasicPlaceDetailsPeriodClose close,
    required BasicPlaceDetailsPeriodOpen open,
  }) = _BasicPlaceDetailsPeriod;

  factory BasicPlaceDetailsPeriod.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsPeriodFromJson(json);
}

@freezed
class BasicPlaceDetailsPeriodClose with _$BasicPlaceDetailsPeriodClose {
  const factory BasicPlaceDetailsPeriodClose({
    required int day,
    required String time,
  }) = _BasicPlaceDetailsPeriodClose;

  factory BasicPlaceDetailsPeriodClose.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsPeriodCloseFromJson(json);
}

@freezed
class BasicPlaceDetailsPeriodOpen with _$BasicPlaceDetailsPeriodOpen {
  const factory BasicPlaceDetailsPeriodOpen({
    required int day,
    required String time,
  }) = _BasicPlaceDetailsPeriodOpen;

  factory BasicPlaceDetailsPeriodOpen.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsPeriodOpenFromJson(json);
}

@freezed
class BasicPlaceDetailsPhoto with _$BasicPlaceDetailsPhoto {
  const factory BasicPlaceDetailsPhoto({
    required int height,
    required List<String> htmlAttributions,
    required String photoReference,
    required int width,
  }) = _BasicPlaceDetailsPhoto;

  factory BasicPlaceDetailsPhoto.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsPhotoFromJson(json);
}

@freezed
class BasicPlaceDetailsReview with _$BasicPlaceDetailsReview {
  const factory BasicPlaceDetailsReview({
    required String authorName,
    required String authorUrl,
    required String language,
    required String profilePhotoUrl,
    required int rating,
    required String relativeTimeDescription,
    required String text,
    required int time,
  }) = _BasicPlaceDetailsReview;

  factory BasicPlaceDetailsReview.fromJson(Map<String, dynamic> json) =>
      _$BasicPlaceDetailsReviewFromJson(json);
}
