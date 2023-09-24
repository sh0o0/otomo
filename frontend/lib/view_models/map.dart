import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/location.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/position.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';

part 'map.freezed.dart';

final mapProvider =
    StateNotifierProvider.autoDispose<MapNotifier, MapState>((ref) {
  final chatNotifier = ref.read(chatProvider.notifier);
  final activeAnalyzedLocations =
      ref.watch(chatProvider.select((v) => v.value?.activeAnalyzedLocations));

  return MapNotifier(
    MapState(activeAnalyzedLocations: activeAnalyzedLocations ?? []),
    focusedLocationStream: chatNotifier.focusedAnalyzedLocationStream,
    activatedTextMessageStream: chatNotifier.activatedTextMessageStream,
  );
});

@freezed
class MapState with _$MapState {
  const MapState._();
  const factory MapState({
    required List<AnalyzedLocation> activeAnalyzedLocations,
  }) = _MapState;

  AppLatLngList get activeLocationLatLngList {
    return AppLatLngList(activeAnalyzedLocations
        .map((e) => e.location.geometry.latLng)
        .toList());
  }
}

class MapNotifier extends StateNotifier<MapState> {
  MapNotifier(
    super._state, {
    required this.focusedLocationStream,
    required this.activatedTextMessageStream,
  });

  final Stream<AnalyzedLocation> focusedLocationStream;
  final Stream<TextMessageData> activatedTextMessageStream;
  final LocationControllerImpl _locationController =
      getIt<LocationControllerImpl>();

  Future<Position> getCurrentPosition() {
    return _locationController.determinePosition();
  }
}
