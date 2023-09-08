import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/map.dart';
import 'package:otomo/views/cases/map/app_map.dart';

class Map extends HookConsumerWidget {
  const Map({super.key});

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void _onMapCreated(GoogleMapController controller, WidgetRef ref) {
    ref.read(mapProvider.notifier).mapController = controller;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AppMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _onMapCreated(controller, ref),
      ),
    );
  }
}
