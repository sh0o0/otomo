import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/location.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/views/utils/converter.dart';

part 'map.freezed.dart';

final mapProvider = StateNotifierProvider<MapViewModel, MapState>((ref) {
  final activePlaces =
      ref.watch(chatProvider.select((v) => v.value?.activePlaces));
  final focusedPlaceAtChatStream =
      ref.read(chatProvider.notifier).focusedPlaceController.stream;
  return MapViewModel(
    MapState(activePlaces: activePlaces ?? []),
    focusedPlaceAtChatStream: focusedPlaceAtChatStream,
  );
});

@freezed
class MapState with _$MapState {
  const factory MapState({
    required List<Place> activePlaces,
  }) = _MapState;
}

class MapViewModel extends StateNotifier<MapState> {
  MapViewModel(
    super._state, {
    required this.focusedPlaceAtChatStream,
  }) {
    focusedPlaceAtChatStream.listen((place) {
      if (!_canUseMapController) return;
      _mapController!.animateCamera(
        google.CameraUpdate.newLatLngZoom(
            Converter.instance.latLng.entityToViewForGoogle(place.latLng), 8),
      );
    });
  }

  final Stream<Place> focusedPlaceAtChatStream;
  final LocationControllerImpl _locationController =
      getIt<LocationControllerImpl>();

  static google.GoogleMapController? _mapController;

  set mapController(google.GoogleMapController mapController) =>
      _mapController = mapController;

  bool get _canUseMapController => _mapController != null;

  Future<void> goCurrentLocation() async {
    final position = await _locationController.determinePosition();

    if (!_canUseMapController) return;
    _mapController!.animateCamera(
      google.CameraUpdate.newLatLngZoom(
        Converter.instance.latLng.entityToViewForGoogle(position.latLng),
        8,
      ),
    );
  }
}
