import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/views/utils/converter.dart';

final class MarkerMaker {
  MarkerMaker._();

  static List<Marker> fromExtractedPlaceList(List<ExtractedPlace> places) =>
      places.map(fromExtractedPlace).toList();

  static Marker fromExtractedPlace(
    ExtractedPlace place, {
    VoidCallback? onTap,
  }) {
    final geocodedPlace = place.geocodedPlace;
    if (geocodedPlace == null) {
      throw ArgumentError.notNull('place.geocodedPlace');
    }

    return Marker(
      markerId: MarkerId(geocodedPlace.googlePlaceId),
      position:
          ViewConverter.I.latLng.entityToViewForGoogle(geocodedPlace.latLng),
      onTap: onTap,
      infoWindow: InfoWindow(
        title: place.text,
        snippet: geocodedPlace.latLng.toString(),
      ),
    );
  }

  static Future<Marker> fromExtractedPlaceWithLabel({
    required BuildContext context,
    required ExtractedPlace place,
    VoidCallback? onTap,
  }) async {
    final geocodedPlace = place.geocodedPlace;
    if (geocodedPlace == null) {
      throw ArgumentError.notNull('place.geocodedPlace');
    }

    final theme = Theme.of(context);
    return Marker(
      markerId: MarkerId(geocodedPlace.googlePlaceId),
      position: ViewConverter.I.latLng.entityToViewForGoogle(
        geocodedPlace.latLng,
      ),
      onTap: onTap,
      icon: await createCustomMarkerBitmap(
        place.text,
        backgroundColor: theme.colorScheme.secondary,
        textStyle: TextStyle(
          fontSize: 40,
          color: theme.colorScheme.onSecondary,
          letterSpacing: 1.0,
          fontFamily: 'Roboto Bold',
        ),
      ),
    );
  }
}
