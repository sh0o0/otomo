import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/location.dart';
import 'package:otomo/entities/lat_lng.dart';
import 'package:otomo/entities/location.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/entities/position.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map.freezed.dart';
part 'map.g.dart';

@freezed
class MapState with _$MapState {
  const MapState._();
  const factory MapState({
    required List<AnalyzedLocation> activeAnalyzedLocations,
    Location? focusingLocation,
  }) = _MapState;

  AppLatLngList get activeLocationLatLngList {
    return AppLatLngList(activeAnalyzedLocations
        .map((e) => e.location.geometry.latLng)
        .toList());
  }
}

@riverpod
class Map extends _$Map {
  @override
  MapState build() {
    final chatNotifier = ref.read(chatProvider.notifier);
    focusedLocationStream = chatNotifier.focusedAnalyzedLocationStream;
    activatedTextMessageStream = chatNotifier.activatedTextMessageStream;

    final activeAnalyzedLocations =
        ref.watch(chatProvider.select((v) => v.value?.activeAnalyzedLocations));

    final focusedLocationStreamSub =
        focusedLocationStream.listen((focusedLocation) {
      state = state.copyWith(focusingLocation: focusedLocation.location);
    });

    ref.onDispose(() {
      focusedLocationStreamSub.cancel();
    });

    return MapState(
      activeAnalyzedLocations: activeAnalyzedLocations ?? [],
    );
  }

  late final Stream<AnalyzedLocation> focusedLocationStream;
  late final Stream<TextMessageData> activatedTextMessageStream;

  final LocationControllerImpl _locationController =
      getIt<LocationControllerImpl>();
  final StreamController<Location> _focusedPlaceStreamController =
      StreamController<Location>.broadcast();

  Stream<Location> get focusedPlaceStream =>
      _focusedPlaceStreamController.stream;

  Future<Position> getCurrentPosition() {
    return _locationController.determinePosition();
  }

  void focusPlace(Location location) {
    _focusedPlaceStreamController.add(location);
    state = state.copyWith(focusingLocation: location);
  }
}
