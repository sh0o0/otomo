import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/domains/entities/message.dart';
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
      icon: await _createLabelMarker(
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

  static Future<BitmapDescriptor> _createLabelMarker(
    String title, {
    required TextStyle textStyle,
    Color backgroundColor = Colors.blueAccent,
  }) async {
    TextSpan span = TextSpan(
      style: textStyle,
      text: title,
    );
    TextPainter painter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: ui.TextDirection.ltr,
    );
    painter.text = TextSpan(
      text: title.toString(),
      style: textStyle,
    );
    ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    Canvas canvas = Canvas(pictureRecorder);
    painter.layout();
    painter.paint(canvas, const Offset(20.0, 10.0));
    int textWidth = painter.width.toInt();
    int textHeight = painter.height.toInt();
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(0, 0, textWidth + 40, textHeight + 20,
            bottomLeft: const Radius.circular(10),
            bottomRight: const Radius.circular(10),
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10)),
        Paint()..color = backgroundColor);
    var arrowPath = Path();
    arrowPath.moveTo((textWidth + 40) / 2 - 15, textHeight + 20);
    arrowPath.lineTo((textWidth + 40) / 2, textHeight + 40);
    arrowPath.lineTo((textWidth + 40) / 2 + 15, textHeight + 20);
    arrowPath.close();
    canvas.drawPath(arrowPath, Paint()..color = backgroundColor);
    painter.layout();
    painter.paint(canvas, const Offset(20.0, 10.0));
    ui.Picture p = pictureRecorder.endRecording();
    ByteData? pngBytes = await (await p.toImage(
            painter.width.toInt() + 40, painter.height.toInt() + 50))
        .toByteData(format: ui.ImageByteFormat.png);
    Uint8List data = Uint8List.view(pngBytes!.buffer);
    return BitmapDescriptor.fromBytes(data);
  }
}
