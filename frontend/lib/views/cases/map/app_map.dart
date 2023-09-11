import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/entities/lat_lng.dart';
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

  Future<void> goWithAnimation({
    required AppLatLng latLng,
    required double zoom,
  }) async {
    final gLatLng = Converter.instance.latLng.entityToViewForGoogle(latLng);

    _controller.animateCamera(
      CameraUpdate.newLatLngZoom(gLatLng, zoom),
    );
  }
}
