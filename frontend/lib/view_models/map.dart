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
  final focusPlaceStream = ref.read(chatProvider.notifier).focusPlaceStream;
  return MapNotifier(
    MapState(activePlaces: activePlaces ?? []),
    focusPlaceStream: focusPlaceStream,
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
    required this.focusPlaceStream,
  });

  final Stream<Place> focusPlaceStream;
  final LocationControllerImpl _locationController =
      getIt<LocationControllerImpl>();

  Future<Position> getCurrentPosition() {
    return _locationController.determinePosition();
  }
}
