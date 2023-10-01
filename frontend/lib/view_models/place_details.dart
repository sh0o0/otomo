import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/place.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/view_models/map.dart';

final placeDetailsProvider =
    FutureProvider.autoDispose<BasicPlaceDetails>((ref) {
  final placeId = ref.watch(mapProvider).focusingLocation?.googlePlaceId;
  if (placeId == null) {
    throw StateError('mapProvider.focusingLocation is null');
  }

  final controller = getIt<PlaceControllerImpl>();
  return controller.getBasicPlaceDetails(placeId);
});
