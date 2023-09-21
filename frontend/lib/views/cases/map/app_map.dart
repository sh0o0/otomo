import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/region.dart';
import 'package:otomo/views/utils/converter.dart';

class AppMap extends StatelessWidget {
  const AppMap({
    super.key,
    required this.initialCameraPosition,
    this.onMapCreated,
    this.markers = const <Marker>{},
  });

  final CameraPosition initialCameraPosition;
  final void Function(MapController controller)? onMapCreated;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      onMapCreated: (controller) =>
          onMapCreated?.call(MapController(controller)),
      markers: markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
    );
  }
}

class MapController {
  const MapController(this._controller);
  final GoogleMapController _controller;

  Future<void> moveWithLatLng({
    required AppLatLng latLng,
    required double zoom,
  }) async {
    final gLatLng = ViewConverter.I.latLng.entityToViewForGoogle(latLng);

    await _controller.animateCamera(
      CameraUpdate.newLatLngZoom(gLatLng, zoom),
    );
  }

  Future<void> moveWithRegion({
    required Region region,
    double padding = 10,
  }) async {
    final gLatLngBounds = ViewConverter.I.region.entityToViewForGoogle(region);

    await _controller
        .animateCamera(CameraUpdate.newLatLngBounds(gLatLngBounds, padding));
  }
}
