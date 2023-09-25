import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/view_models/map.dart';
import 'package:otomo/views/cases/map/app_map.dart';
import 'package:otomo/views/utils/converter.dart';

class MapPage extends StatefulHookConsumerWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapState();
}

class _MapState extends ConsumerState<MapPage> {
  MapController? _mapController;

  bool get _canUseMapController => _mapController != null;

  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void _onMapCreated(MapController controller) => _mapController = controller;

  Future<void> _goCurrentLocation(MapNotifier notifier) async {
    if (!_canUseMapController) return;
    final position = await notifier.getCurrentPosition();
    _mapController!.moveWithLatLng(latLng: position.latLng, zoom: 8);
  }

  Set<Marker> _markers(MapState state) =>
      ViewConverter.I.analyzedLocationAndMarker
          .locationsToMarkerList(state.activeAnalyzedLocations)
          .toSet();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mapProvider);
    final notifier = ref.read(mapProvider.notifier);

    useEffect(() {
      final focusedAnalyzedLocationStreamSub =
          notifier.focusedLocationStream.listen((analyzedLoc) {
        if (!_canUseMapController) return;
        _mapController!.moveWithLatLng(
          latLng: analyzedLoc.location.geometry.latLng,
          zoom: 8,
        );
      });

      final activatedTextMessageStreamSub =
          notifier.activatedTextMessageStream.listen((textMsg) {
        if (!_canUseMapController) return;

        final latLngList = AppLatLngList(textMsg.locationAnalysis.locations
            .map((e) => e.location.geometry.latLng)
            .toList());
        final region = latLngList.edge();
        if (region == null) return;
        _mapController!.moveWithRegion(region: region);
      });

      return () {
        focusedAnalyzedLocationStreamSub.cancel();
        activatedTextMessageStreamSub.cancel();
      };
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: _onMapCreated,
        markers: _markers(state),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () => _goCurrentLocation(notifier),
        child: const Icon(Icons.location_searching_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
