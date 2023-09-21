import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/location.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/entities/position.dart';
import 'package:otomo/view_models/chat.dart';

part 'map.freezed.dart';

final mapProvider =
    StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  final activePlaces =
      ref.watch(chatProvider.select((v) => v.value?.activePlaces));
  final focusedPlaceStream = ref.read(chatProvider.notifier).focusedPlaceStream;
  return MapNotifier(
    MapState(activePlaces: activePlaces ?? []),
    focusedPlaceStream: focusedPlaceStream,
  );
});

@freezed
class MapState with _$MapState {
  const MapState._();
  const factory MapState({
    required List<Place> activePlaces,
  }) = _MapState;

  AppLatLngList get activePlacesLatLngList {
    return AppLatLngList(activePlaces.map((e) => e.latLng).toList());
  }
}

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier(
    super._state, {
    required this.focusedPlaceStream,
  });

  final Stream<Place> focusedPlaceStream;
  final LocationControllerImpl _locationController =
      getIt<LocationControllerImpl>();

  Future<Position> getCurrentPosition() {
    return _locationController.determinePosition();
  }
}
