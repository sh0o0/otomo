import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/app_config.dart';
import 'package:otomo/tools/reg_exps.dart';

part 'place_details.freezed.dart';
part 'place_details.g.dart';

@freezed
class PlaceDetails with _$PlaceDetails {
  const factory PlaceDetails({
    required List<PlaceDetailsAddressComponent>? addressComponents,
    required String? adrAddress,
    required String? businessStatus,
    required bool? curbsidePickup,
    required PlaceDetailsOpeningHours? currentOpeningHours,
    required bool? delivery,
    required bool? dineIn,
    required PlaceDetailsEditorialSummary? editorialSummary,
    required String? formattedAddress,
    required String? formattedPhoneNumber,
    required PlaceDetailsGeometry? geometry,
    required String? icon,
    required String? iconBackgroundColor,
    required String? iconMaskBaseUri,
    required String? internationalPhoneNumber,
    required String? name,
    required PlaceDetailsOpeningHours? openingHours,
    required bool? permanentlyClosed,
    required List<PlaceDetailsPhoto>? photos,
    required String? placeId,
    required PlaceDetailsPlusCode? plusCode,
    required int? priceLevel,
    required double? rating,
    required String? reference,
    required bool? reservable,
    required List<PlaceDetailsReview>? reviews,
    required String? scope,
    required List<PlaceDetailsOpeningHours>? secondaryOpeningHours,
    required bool? servesBeer,
    required bool? servesBreakfast,
    required bool? servesBrunch,
    required bool? servesDinner,
    required bool? servesLunch,
    required bool? servesVegetarianFood,
    required bool? servesWine,
    required bool? takeout,
    required List<String>? types,
    required String? url,
    required int? userRatingsTotal,
    required int? utcOffset,
    required String? vicinity,
    required String? website,
    required bool? wheelchairAccessibleEntrance,
  }) = _PlaceDetails;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsFromJson(json);
}

@freezed
class PlaceDetailsAddressComponent with _$PlaceDetailsAddressComponent {
  const factory PlaceDetailsAddressComponent({
    required String longName,
    required String shortName,
    required List<String> types,
  }) = _PlaceDetailsAddressComponent;

  factory PlaceDetailsAddressComponent.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsAddressComponentFromJson(json);
}

@freezed
class PlaceDetailsEditorialSummary with _$PlaceDetailsEditorialSummary {
  const factory PlaceDetailsEditorialSummary({
    required String? language,
    required String? overview,
  }) = _PlaceDetailsEditorialSummary;

  factory PlaceDetailsEditorialSummary.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsEditorialSummaryFromJson(json);
}

@freezed
class PlaceDetailsGeometry with _$PlaceDetailsGeometry {
  const factory PlaceDetailsGeometry({
    required PlaceDetailsLatLngLiteral location,
    required PlaceDetailsBounds viewport,
  }) = _PlaceDetailsGeometry;

  factory PlaceDetailsGeometry.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsGeometryFromJson(json);
}

@freezed
class PlaceDetailsBounds with _$PlaceDetailsBounds {
  const factory PlaceDetailsBounds({
    required PlaceDetailsLatLngLiteral northeast,
    required PlaceDetailsLatLngLiteral southwest,
  }) = _PlaceDetailsBounds;

  factory PlaceDetailsBounds.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsBoundsFromJson(json);
}

@freezed
class PlaceDetailsLatLngLiteral with _$PlaceDetailsLatLngLiteral {
  const factory PlaceDetailsLatLngLiteral({
    required double lat,
    required double lng,
  }) = _PlaceDetailsLatLngLiteral;

  factory PlaceDetailsLatLngLiteral.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsLatLngLiteralFromJson(json);
}

@freezed
class PlaceDetailsOpeningHours with _$PlaceDetailsOpeningHours {
  const factory PlaceDetailsOpeningHours({
    required bool? openNow,
    required List<PlaceDetailsHoursPeriod>? periods,
    required List<PlaceDetailsSpecialDay>? specialDays,
    required String? type,
    required List<String>? weekdayText,
  }) = _PlaceDetailsOpeningHours;

  factory PlaceDetailsOpeningHours.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsOpeningHoursFromJson(json);
}

@freezed
class PlaceDetailsHoursPeriod with _$PlaceDetailsHoursPeriod {
  const factory PlaceDetailsHoursPeriod({
    required PlaceDetailsHoursPeriodDetail? close,
    required PlaceDetailsHoursPeriodDetail open,
  }) = _PlaceDetailsHoursPeriod;

  factory PlaceDetailsHoursPeriod.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsHoursPeriodFromJson(json);
}

@freezed
class PlaceDetailsHoursPeriodDetail with _$PlaceDetailsHoursPeriodDetail {
  const factory PlaceDetailsHoursPeriodDetail({
    required int day,
    required String time,
    required String? date,
    required bool? truncated,
  }) = _PlaceDetailsHoursPeriodDetail;

  factory PlaceDetailsHoursPeriodDetail.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsHoursPeriodDetailFromJson(json);
}

@freezed
class PlaceDetailsSpecialDay with _$PlaceDetailsSpecialDay {
  const factory PlaceDetailsSpecialDay({
    required String? date,
    required bool? exceptionalHours,
  }) = _PlaceDetailsSpecialDay;

  factory PlaceDetailsSpecialDay.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsSpecialDayFromJson(json);
}

@freezed
class PlaceDetailsPhoto with _$PlaceDetailsPhoto {
  const PlaceDetailsPhoto._();
  const factory PlaceDetailsPhoto({
    required int height,
    required List<String> htmlAttributions,
    required String photoReference,
    required int width,
  }) = _PlaceDetailsPhoto;

  factory PlaceDetailsPhoto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsPhotoFromJson(json);

  String photoUrl({
    int? maxHeight,
  }) {
    // For when assigning fake image url
    if (RegExps.url.hasMatch(photoReference)) return photoReference;

    final mh = maxHeight ?? height;
    return 'https://maps.googleapis.com/maps/api/place/photo?maxheight=$mh&photo_reference=$photoReference&key=${appConfig.googleMapApiKey}';
  }
}

@freezed
class PlaceDetailsPlusCode with _$PlaceDetailsPlusCode {
  const factory PlaceDetailsPlusCode({
    required String? compoundCode,
    required String globalCode,
  }) = _PlaceDetailsPlusCode;

  factory PlaceDetailsPlusCode.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsPlusCodeFromJson(json);
}

@freezed
class PlaceDetailsReview with _$PlaceDetailsReview {
  const factory PlaceDetailsReview({
    required String authorName,
    required int rating,
    required String relativeTimeDescription,
    required int time,
    required String? authorUrl,
    required String? language,
    required String? originalLanguage,
    required String? profilePhotoUrl,
    required String? text,
    required bool? translated,
  }) = _PlaceDetailsReview;

  factory PlaceDetailsReview.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsReviewFromJson(json);
}
