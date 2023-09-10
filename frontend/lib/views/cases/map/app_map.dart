import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppMap extends StatelessWidget {
  const AppMap({
    super.key,
    required this.initialCameraPosition,
    this.onMapCreated,
    this.markers = const <Marker>{},
  });

  final CameraPosition initialCameraPosition;
  final MapCreatedCallback? onMapCreated;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      onMapCreated:  onMapCreated,
      markers: markers,
      myLocationEnabled: true,
    );
  }
}
