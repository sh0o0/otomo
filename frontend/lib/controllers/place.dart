import 'package:dio/dio.dart';
import 'package:otomo/entities/app_exception.dart';
import 'package:otomo/entities/place.dart';
import 'package:otomo/tools/logger.dart';

class PlaceControllerImpl {
  PlaceControllerImpl(String apiKey)
      : _client = Dio(
          BaseOptions(
            baseUrl: 'https://maps.googleapis.com',
            queryParameters: {'key': apiKey},
          ),
        );

  final Dio _client;

  static const _detailsUrl = '/maps/api/place/details/json';

  Future<BasicPlaceDetails> getBasicPlaceDetails(String googlePlaceId) async {
    logger.debug('getBasicPlaceDetails. googlePlaceId: $googlePlaceId');
    final response = await _client.get(
      _detailsUrl,
      queryParameters: {
        'place_id': googlePlaceId,
        'language': 'ja',
      },
    );

    final errorMessage = response.data['error_message'];
    if (errorMessage != null) {
      throw AppException.unknown(errorMessage);
    }

    return BasicPlaceDetails.fromJson(response.data['result']);
  }
}
