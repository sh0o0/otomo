import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/place.dart';
import 'package:otomo/domains/entities/place_details.dart';
import 'package:otomo/view_models/map.dart';

part 'place_details.freezed.dart';

@freezed
class PlaceDetailsState with _$PlaceDetailsState {
  const factory PlaceDetailsState({
    PlaceDetails? place,
    @Default(false) bool isNotSpecified,
  }) = _PlaceDetailsState;
}

final placeDetailsProvider = FutureProvider.family
    .autoDispose<PlaceDetailsState, String>((ref, language) async {
  final placeId =
      ref.watch(mapProvider).focusingPlace?.geocodedPlace?.googlePlaceId;
  if (placeId == null) {
    return const PlaceDetailsState(isNotSpecified: true);
  }

  final controller = getIt<PlaceControllerImpl>();
  final details = await controller.getPlaceDetails(placeId, language: language);
  return PlaceDetailsState(place: details);
});
