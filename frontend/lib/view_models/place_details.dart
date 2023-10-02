import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/place.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/map.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'place_details.freezed.dart';

@freezed
class PlaceDetailsState with _$PlaceDetailsState {
  const factory PlaceDetailsState({
    BasicPlaceDetails? basic,
    @Default(false) bool isNotSpecified,
  }) = _PlaceDetailsState;
}

final placeDetailsProvider =
    FutureProvider.autoDispose<PlaceDetailsState>((ref) async {
  final placeId = ref.watch(mapProvider).focusingLocation?.googlePlaceId;
  if (placeId == null) {
    return const PlaceDetailsState(isNotSpecified: true);
  }

  final controller = getIt<PlaceControllerImpl>();
  final details = await controller.getBasicPlaceDetails(placeId);
  return PlaceDetailsState(basic: details);
});
