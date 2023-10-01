// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasicPlaceDetails _$$_BasicPlaceDetailsFromJson(Map<String, dynamic> json) =>
    _$_BasicPlaceDetails(
      name: json['name'] as String,
      formattedAddress: json['formatted_address'] as String,
      formattedPhoneNumber: json['formatted_phone_number'] as String,
      website: json['website'] as String,
      url: json['url'] as String,
      rating: (json['rating'] as num).toDouble(),
      userRatingsTotal: json['user_ratings_total'] as int,
      placeId: json['place_id'] as String,
      vicinity: json['vicinity'] as String,
      icon: json['icon'] as String,
      internationalPhoneNumber: json['international_phone_number'] as String,
      reference: json['reference'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      geometry: BasicPlaceDetailsGeometry.fromJson(
          json['geometry'] as Map<String, dynamic>),
      openingHours: BasicPlaceDetailsOpeningHours.fromJson(
          json['opening_hours'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>)
          .map(
              (e) => BasicPlaceDetailsPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) =>
              BasicPlaceDetailsReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BasicPlaceDetailsToJson(
        _$_BasicPlaceDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'formatted_address': instance.formattedAddress,
      'formatted_phone_number': instance.formattedPhoneNumber,
      'website': instance.website,
      'url': instance.url,
      'rating': instance.rating,
      'user_ratings_total': instance.userRatingsTotal,
      'place_id': instance.placeId,
      'vicinity': instance.vicinity,
      'icon': instance.icon,
      'international_phone_number': instance.internationalPhoneNumber,
      'reference': instance.reference,
      'types': instance.types,
      'geometry': instance.geometry,
      'opening_hours': instance.openingHours,
      'photos': instance.photos,
      'reviews': instance.reviews,
    };

_$_BasicPlaceDetailsGeometry _$$_BasicPlaceDetailsGeometryFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsGeometry(
      location: BasicPlaceDetailsLocation.fromJson(
          json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BasicPlaceDetailsGeometryToJson(
        _$_BasicPlaceDetailsGeometry instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

_$_BasicPlaceDetailsLocation _$$_BasicPlaceDetailsLocationFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_BasicPlaceDetailsLocationToJson(
        _$_BasicPlaceDetailsLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_BasicPlaceDetailsOpeningHours _$$_BasicPlaceDetailsOpeningHoursFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsOpeningHours(
      openNow: json['open_now'] as bool,
      periods: (json['periods'] as List<dynamic>)
          .map((e) =>
              BasicPlaceDetailsPeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      weekdayText: (json['weekday_text'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_BasicPlaceDetailsOpeningHoursToJson(
        _$_BasicPlaceDetailsOpeningHours instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
      'periods': instance.periods,
      'weekday_text': instance.weekdayText,
    };

_$_BasicPlaceDetailsPeriod _$$_BasicPlaceDetailsPeriodFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsPeriod(
      close: BasicPlaceDetailsPeriodClose.fromJson(
          json['close'] as Map<String, dynamic>),
      open: BasicPlaceDetailsPeriodOpen.fromJson(
          json['open'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BasicPlaceDetailsPeriodToJson(
        _$_BasicPlaceDetailsPeriod instance) =>
    <String, dynamic>{
      'close': instance.close,
      'open': instance.open,
    };

_$_BasicPlaceDetailsPeriodClose _$$_BasicPlaceDetailsPeriodCloseFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsPeriodClose(
      day: json['day'] as int,
      time: json['time'] as String,
    );

Map<String, dynamic> _$$_BasicPlaceDetailsPeriodCloseToJson(
        _$_BasicPlaceDetailsPeriodClose instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
    };

_$_BasicPlaceDetailsPeriodOpen _$$_BasicPlaceDetailsPeriodOpenFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsPeriodOpen(
      day: json['day'] as int,
      time: json['time'] as String,
    );

Map<String, dynamic> _$$_BasicPlaceDetailsPeriodOpenToJson(
        _$_BasicPlaceDetailsPeriodOpen instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
    };

_$_BasicPlaceDetailsPhoto _$$_BasicPlaceDetailsPhotoFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsPhoto(
      height: json['height'] as int,
      htmlAttributions: (json['html_attributions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoReference: json['photo_reference'] as String,
      width: json['width'] as int,
    );

Map<String, dynamic> _$$_BasicPlaceDetailsPhotoToJson(
        _$_BasicPlaceDetailsPhoto instance) =>
    <String, dynamic>{
      'height': instance.height,
      'html_attributions': instance.htmlAttributions,
      'photo_reference': instance.photoReference,
      'width': instance.width,
    };

_$_BasicPlaceDetailsReview _$$_BasicPlaceDetailsReviewFromJson(
        Map<String, dynamic> json) =>
    _$_BasicPlaceDetailsReview(
      authorName: json['author_name'] as String,
      authorUrl: json['author_url'] as String,
      language: json['language'] as String,
      profilePhotoUrl: json['profile_photo_url'] as String,
      rating: json['rating'] as int,
      relativeTimeDescription: json['relative_time_description'] as String,
      text: json['text'] as String,
      time: json['time'] as int,
    );

Map<String, dynamic> _$$_BasicPlaceDetailsReviewToJson(
        _$_BasicPlaceDetailsReview instance) =>
    <String, dynamic>{
      'author_name': instance.authorName,
      'author_url': instance.authorUrl,
      'language': instance.language,
      'profile_photo_url': instance.profilePhotoUrl,
      'rating': instance.rating,
      'relative_time_description': instance.relativeTimeDescription,
      'text': instance.text,
      'time': instance.time,
    };
