import 'package:otomo/entities/location.dart';
import 'package:otomo/entities/message.dart';
import 'package:otomo/view_models/boundary/chat.dart';
import 'package:otomo/view_models/chat.dart';
import 'package:otomo/view_models/map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.g.dart';

@riverpod
class Home extends _$Home {
  Stream<TextMessageData> get activatedTextMessageStream =>
      ref.read(chatProvider.notifier).activatedTextMessageStream;
  Stream<GeocodedPlace> get focusedPlaceStream =>
      ref.read(mapProvider.notifier).focusedPlaceStream;
  Stream<ExtractedPlace> get focusedAnalyzedLocationStream =>
      ref.read(chatProvider.notifier).focusedAnalyzedLocationStream;

  @override
  void build() {}
}
