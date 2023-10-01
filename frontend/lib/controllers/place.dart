import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/entities/place.dart';

@injectable
class PlaceControllerImpl {
  PlaceControllerImpl(
    String apiKey,
  ) : _client = Dio(
          BaseOptions(
            baseUrl: 'https://maps.googleapis.com',
            queryParameters: {'key': apiKey},
          ),
        );

  final Dio _client;

  static const _detailsUrl = '/maps/api/place/details/json';

  Future<BasicPlaceDetails> getBasicPlaceDetails(String googlePlaceId) async {
    final response = await _client.get(
      _detailsUrl,
      queryParameters: {
        'place_id': googlePlaceId,
        'language': 'ja',
      },
    );

    return BasicPlaceDetails.fromJson(response.data['result']);
  }
}
