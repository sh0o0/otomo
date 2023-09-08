import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/models/place.dart';
import 'package:otomo/view_models/chat.dart';

final mapProvider = StateNotifierProvider<MapViewModel, void>((ref) {
  final messages = ref.watch(chatProvider.select((v) => v.value?.messages));
  final focusedPlaceAtChatStream =
      ref.read(chatProvider.notifier).focusedPlaceController.stream;
  return MapViewModel(
    messages: messages ?? [],
    focusedPlaceAtChatStream: focusedPlaceAtChatStream,
  );
});

class MapViewModel extends StateNotifier<void> {
  MapViewModel({
    required this.messages,
    required this.focusedPlaceAtChatStream,
  }) : super(null) {
    focusedPlaceAtChatStream.listen((place) {
      if (!_canUseMapController) return;
      _mapController!.animateCamera(
        google.CameraUpdate.newLatLngZoom(place.latLng.toGoogle(), 8),
      );
    });
  }

  final List<Message> messages;
  final Stream<Place> focusedPlaceAtChatStream;
  google.GoogleMapController? _mapController;

  List<Message> get activeMessages =>
      messages.where((m) => m.metadata?['active'] == true).toList();

  set mapController(google.GoogleMapController mapController) =>
      _mapController = mapController;
  bool get _canUseMapController => _mapController != null;
}
