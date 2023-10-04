// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlaceDetails _$$_PlaceDetailsFromJson(Map<String, dynamic> json) =>
    _$_PlaceDetails(
      addressComponents: (json['address_components'] as List<dynamic>?)
          ?.map((e) =>
              PlaceDetailsAddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      adrAddress: json['adr_address'] as String?,
      businessStatus: json['business_status'] as String?,
      curbsidePickup: json['curbside_pickup'] as bool?,
      currentOpeningHours: json['current_opening_hours'] == null
          ? null
          : PlaceDetailsOpeningHours.fromJson(
              json['current_opening_hours'] as Map<String, dynamic>),
      delivery: json['delivery'] as bool?,
      dineIn: json['dine_in'] as bool?,
      editorialSummary: json['editorial_summary'] == null
          ? null
          : PlaceDetailsEditorialSummary.fromJson(
              json['editorial_summary'] as Map<String, dynamic>),
      formattedAddress: json['formatted_address'] as String?,
      formattedPhoneNumber: json['formatted_phone_number'] as String?,
      geometry: json['geometry'] == null
          ? null
          : PlaceDetailsGeometry.fromJson(
              json['geometry'] as Map<String, dynamic>),
      icon: json['icon'] as String?,
      iconBackgroundColor: json['icon_background_color'] as String?,
      iconMaskBaseUri: json['icon_mask_base_uri'] as String?,
      internationalPhoneNumber: json['international_phone_number'] as String?,
      name: json['name'] as String?,
      openingHours: json['opening_hours'] == null
          ? null
          : PlaceDetailsOpeningHours.fromJson(
              json['opening_hours'] as Map<String, dynamic>),
      permanentlyClosed: json['permanently_closed'] as bool?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PlaceDetailsPhoto.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String?,
      plusCode: json['plus_code'] == null
          ? null
          : PlaceDetailsPlusCode.fromJson(
              json['plus_code'] as Map<String, dynamic>),
      priceLevel: json['price_level'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      reference: json['reference'] as String?,
      reservable: json['reservable'] as bool?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => PlaceDetailsReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      scope: json['scope'] as String?,
      secondaryOpeningHours: (json['secondary_opening_hours'] as List<dynamic>?)
          ?.map((e) =>
              PlaceDetailsOpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
      servesBeer: json['serves_beer'] as bool?,
      servesBreakfast: json['serves_breakfast'] as bool?,
      servesBrunch: json['serves_brunch'] as bool?,
      servesDinner: json['serves_dinner'] as bool?,
      servesLunch: json['serves_lunch'] as bool?,
      servesVegetarianFood: json['serves_vegetarian_food'] as bool?,
      servesWine: json['serves_wine'] as bool?,
      takeout: json['takeout'] as bool?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
      url: json['url'] as String?,
      userRatingsTotal: json['user_ratings_total'] as int?,
      utcOffset: json['utc_offset'] as int?,
      vicinity: json['vicinity'] as String?,
      website: json['website'] as String?,
      wheelchairAccessibleEntrance:
          json['wheelchair_accessible_entrance'] as bool?,
    );

Map<String, dynamic> _$$_PlaceDetailsToJson(_$_PlaceDetails instance) =>
    <String, dynamic>{
      'address_components': instance.addressComponents,
      'adr_address': instance.adrAddress,
      'business_status': instance.businessStatus,
      'curbside_pickup': instance.curbsidePickup,
      'current_opening_hours': instance.currentOpeningHours,
      'delivery': instance.delivery,
      'dine_in': instance.dineIn,
      'editorial_summary': instance.editorialSummary,
      'formatted_address': instance.formattedAddress,
      'formatted_phone_number': instance.formattedPhoneNumber,
      'geometry': instance.geometry,
      'icon': instance.icon,
      'icon_background_color': instance.iconBackgroundColor,
      'icon_mask_base_uri': instance.iconMaskBaseUri,
      'international_phone_number': instance.internationalPhoneNumber,
      'name': instance.name,
      'opening_hours': instance.openingHours,
      'permanently_closed': instance.permanentlyClosed,
      'photos': instance.photos,
      'place_id': instance.placeId,
      'plus_code': instance.plusCode,
      'price_level': instance.priceLevel,
      'rating': instance.rating,
      'reference': instance.reference,
      'reservable': instance.reservable,
      'reviews': instance.reviews,
      'scope': instance.scope,
      'secondary_opening_hours': instance.secondaryOpeningHours,
      'serves_beer': instance.servesBeer,
      'serves_breakfast': instance.servesBreakfast,
      'serves_brunch': instance.servesBrunch,
      'serves_dinner': instance.servesDinner,
      'serves_lunch': instance.servesLunch,
      'serves_vegetarian_food': instance.servesVegetarianFood,
      'serves_wine': instance.servesWine,
      'takeout': instance.takeout,
      'types': instance.types,
      'url': instance.url,
      'user_ratings_total': instance.userRatingsTotal,
      'utc_offset': instance.utcOffset,
      'vicinity': instance.vicinity,
      'website': instance.website,
      'wheelchair_accessible_entrance': instance.wheelchairAccessibleEntrance,
    };

_$_PlaceDetailsAddressComponent _$$_PlaceDetailsAddressComponentFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsAddressComponent(
      longName: json['long_name'] as String,
      shortName: json['short_name'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_PlaceDetailsAddressComponentToJson(
        _$_PlaceDetailsAddressComponent instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };

_$_PlaceDetailsEditorialSummary _$$_PlaceDetailsEditorialSummaryFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsEditorialSummary(
      language: json['language'] as String?,
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$$_PlaceDetailsEditorialSummaryToJson(
        _$_PlaceDetailsEditorialSummary instance) =>
    <String, dynamic>{
      'language': instance.language,
      'overview': instance.overview,
    };

_$_PlaceDetailsGeometry _$$_PlaceDetailsGeometryFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsGeometry(
      location: PlaceDetailsLatLngLiteral.fromJson(
          json['location'] as Map<String, dynamic>),
      viewport:
          PlaceDetailsBounds.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlaceDetailsGeometryToJson(
        _$_PlaceDetailsGeometry instance) =>
    <String, dynamic>{
      'location': instance.location,
      'viewport': instance.viewport,
    };

_$_PlaceDetailsBounds _$$_PlaceDetailsBoundsFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsBounds(
      northeast: PlaceDetailsLatLngLiteral.fromJson(
          json['northeast'] as Map<String, dynamic>),
      southwest: PlaceDetailsLatLngLiteral.fromJson(
          json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlaceDetailsBoundsToJson(
        _$_PlaceDetailsBounds instance) =>
    <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

_$_PlaceDetailsLatLngLiteral _$$_PlaceDetailsLatLngLiteralFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsLatLngLiteral(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$_PlaceDetailsLatLngLiteralToJson(
        _$_PlaceDetailsLatLngLiteral instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_PlaceDetailsOpeningHours _$$_PlaceDetailsOpeningHoursFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsOpeningHours(
      openNow: json['open_now'] as bool?,
      periods: (json['periods'] as List<dynamic>?)
          ?.map((e) =>
              PlaceDetailsHoursPeriod.fromJson(e as Map<String, dynamic>))
          .toList(),
      specialDays: (json['special_days'] as List<dynamic>?)
          ?.map(
              (e) => PlaceDetailsSpecialDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String?,
      weekdayText: (json['weekday_text'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_PlaceDetailsOpeningHoursToJson(
        _$_PlaceDetailsOpeningHours instance) =>
    <String, dynamic>{
      'open_now': instance.openNow,
      'periods': instance.periods,
      'special_days': instance.specialDays,
      'type': instance.type,
      'weekday_text': instance.weekdayText,
    };

_$_PlaceDetailsHoursPeriod _$$_PlaceDetailsHoursPeriodFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsHoursPeriod(
      close: json['close'] == null
          ? null
          : PlaceDetailsHoursPeriodDetail.fromJson(
              json['close'] as Map<String, dynamic>),
      open: PlaceDetailsHoursPeriodDetail.fromJson(
          json['open'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PlaceDetailsHoursPeriodToJson(
        _$_PlaceDetailsHoursPeriod instance) =>
    <String, dynamic>{
      'close': instance.close,
      'open': instance.open,
    };

_$_PlaceDetailsHoursPeriodDetail _$$_PlaceDetailsHoursPeriodDetailFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsHoursPeriodDetail(
      day: json['day'] as int,
      time: json['time'] as String,
      date: json['date'] as String?,
      truncated: json['truncated'] as bool?,
    );

Map<String, dynamic> _$$_PlaceDetailsHoursPeriodDetailToJson(
        _$_PlaceDetailsHoursPeriodDetail instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'date': instance.date,
      'truncated': instance.truncated,
    };

_$_PlaceDetailsSpecialDay _$$_PlaceDetailsSpecialDayFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsSpecialDay(
      date: json['date'] as String?,
      exceptionalHours: json['exceptional_hours'] as bool?,
    );

Map<String, dynamic> _$$_PlaceDetailsSpecialDayToJson(
        _$_PlaceDetailsSpecialDay instance) =>
    <String, dynamic>{
      'date': instance.date,
      'exceptional_hours': instance.exceptionalHours,
    };

_$_PlaceDetailsPhoto _$$_PlaceDetailsPhotoFromJson(Map<String, dynamic> json) =>
    _$_PlaceDetailsPhoto(
      height: json['height'] as int,
      htmlAttributions: (json['html_attributions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoReference: json['photo_reference'] as String,
      width: json['width'] as int,
    );

Map<String, dynamic> _$$_PlaceDetailsPhotoToJson(
        _$_PlaceDetailsPhoto instance) =>
    <String, dynamic>{
      'height': instance.height,
      'html_attributions': instance.htmlAttributions,
      'photo_reference': instance.photoReference,
      'width': instance.width,
    };

_$_PlaceDetailsPlusCode _$$_PlaceDetailsPlusCodeFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsPlusCode(
      compoundCode: json['compound_code'] as String?,
      globalCode: json['global_code'] as String,
    );

Map<String, dynamic> _$$_PlaceDetailsPlusCodeToJson(
        _$_PlaceDetailsPlusCode instance) =>
    <String, dynamic>{
      'compound_code': instance.compoundCode,
      'global_code': instance.globalCode,
    };

_$_PlaceDetailsReview _$$_PlaceDetailsReviewFromJson(
        Map<String, dynamic> json) =>
    _$_PlaceDetailsReview(
      authorName: json['author_name'] as String,
      rating: json['rating'] as int,
      relativeTimeDescription: json['relative_time_description'] as String,
      time: json['time'] as int,
      authorUrl: json['author_url'] as String?,
      language: json['language'] as String?,
      originalLanguage: json['original_language'] as String?,
      profilePhotoUrl: json['profile_photo_url'] as String?,
      text: json['text'] as String?,
      translated: json['translated'] as bool?,
    );

Map<String, dynamic> _$$_PlaceDetailsReviewToJson(
        _$_PlaceDetailsReview instance) =>
    <String, dynamic>{
      'author_name': instance.authorName,
      'rating': instance.rating,
      'relative_time_description': instance.relativeTimeDescription,
      'time': instance.time,
      'author_url': instance.authorUrl,
      'language': instance.language,
      'original_language': instance.originalLanguage,
      'profile_photo_url': instance.profilePhotoUrl,
      'text': instance.text,
      'translated': instance.translated,
    };
