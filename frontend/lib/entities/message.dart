import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/location.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class TextMessage with _$TextMessage {
  const TextMessage._();

  const factory TextMessage({
    required String id,
    String? clientId,
    required String text,
    required Role role,
    required DateTime sentAt,
    required PlaceExtraction placeExtraction,
  }) = _TextMessage;

  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);

  bool get hasError => placeExtraction.hasError;
}

enum Role {
  user,
  otomo,
}

@freezed
class PlaceExtraction with _$PlaceExtraction {
  const PlaceExtraction._();

  const factory PlaceExtraction({
    required List<ExtractedPlace> places,
    DateTime? processedAt,
    String? error,
  }) = _PlaceExtraction;

  factory PlaceExtraction.fromJson(Map<String, dynamic> json) =>
      _$PlaceExtractionFromJson(json);

  bool get hasError => error?.isNotEmpty == true;
}

@freezed
class ExtractedPlace with _$ExtractedPlace {
  const factory ExtractedPlace({
    required String text,
    required GeocodedPlace? geocodedPlace,
  }) = _ExtractedPlace;

  factory ExtractedPlace.fromJson(Map<String, dynamic> json) =>
      _$ExtractedPlaceFromJson(json);
}

@freezed
class GeocodedPlace with _$GeocodedPlace {
  const factory GeocodedPlace({
    required String googlePlaceId,
    required AppLatLng latLng,
  }) = _GeocodedPlace;

  factory GeocodedPlace.fromJson(Map<String, dynamic> json) =>
      _$GeocodedPlaceFromJson(json);
}

@freezed
class TextMessageChunk with _$TextMessageChunk {
  const factory TextMessageChunk({
    required String messageId,
    required String text,
    required Role role,
    required DateTime sentAt,
    String? clientId,
    required bool isLast,
  }) = _TextMessageChunk;
}
