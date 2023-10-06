import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/location.dart';
import 'package:otomo/entities/lat_lng.dart';
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
    required List<ExtractedPlace> activePlaces,
    ExtractedPlace? focusingPlace,
  }) = _MapState;

  AppLatLngList get activePlacesLatLngList {
    return AppLatLngList(
      activePlaces.map((e) => e.geocodedPlace.latLng).toList(),
    );
  }
}

@riverpod
class Map extends _$Map {
  Map();

  @override
  MapState build() {
    final focusedPlacesStreamSub =
        focusedTextOfPlaceStream.listen((focusedPlace) {
      state = state.copyWith(focusingPlace: focusedPlace);
    });

    ref.onDispose(() {
      focusedPlacesStreamSub.cancel();
    });

    final activePlaces = ref.watch(
      chatProvider.select((v) => v.value?.activePlaces),
    );

    return MapState(
      activePlaces: activePlaces ?? [],
    );
  }

  final LocationControllerImpl _locationController =
      getIt<LocationControllerImpl>();
  final StreamController<ExtractedPlace> _focusedPlaceStreamController =
      StreamController<ExtractedPlace>.broadcast();

  Stream<ExtractedPlace> get focusedTextOfPlaceStream =>
      ref.read(chatProvider.notifier).focusedExtractedPlaceStream;
  Stream<TextMessageData> get activatedTextMessageStream =>
      ref.read(chatProvider.notifier).activatedTextMessageStream;
  Stream<ExtractedPlace> get focusedPlaceStream =>
      _focusedPlaceStreamController.stream;

  Future<Position> getCurrentPosition() {
    return _locationController.determinePosition();
  }

  void focusPlace(ExtractedPlace place) {
    _focusedPlaceStreamController.add(place);
    state = state.copyWith(focusingPlace: place);
  }
}
