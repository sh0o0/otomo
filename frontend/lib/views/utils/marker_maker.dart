import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/views/utils/converter.dart';

final class MarkerMaker {
  MarkerMaker._();

  static List<Marker> fromAnalyzedLocationList(
          List<ExtractedPlace> locations) =>
      locations.map(fromAnalyzedLocation).toList();

  static Marker fromAnalyzedLocation(
    ExtractedPlace loc, {
    VoidCallback? onTap,
  }) =>
      Marker(
        markerId: MarkerId(loc.location.googlePlaceId),
        position: ViewConverter.I.latLng
            .entityToViewForGoogle(loc.location.geometry.latLng),
        onTap: onTap,
        infoWindow: InfoWindow(
          title: loc.text,
          snippet: loc.location.geometry.latLng.toString(),
        ),
      );

  static Future<Marker> fromAnalyzedLocationWithLabel({
    required BuildContext context,
    required ExtractedPlace loc,
    VoidCallback? onTap,
  }) async {
    final theme = Theme.of(context);
    return Marker(
      markerId: MarkerId(loc.location.googlePlaceId),
      position: ViewConverter.I.latLng.entityToViewForGoogle(
        loc.location.geometry.latLng,
      ),
      onTap: onTap,
      icon: await createCustomMarkerBitmap(
        loc.text,
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
