import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/controllers/place.dart';
import 'package:otomo/tools/logger.dart';

void main() {
  const apiKey = String.fromEnvironment('GOOGLE_MAP_API_KEY');
  const googlePlaceId = 'ChIJN1t_tDeuEmsRUsoyG83frY4';

  late PlaceControllerImpl controller;

  setUp(() {
    controller = PlaceControllerImpl(apiKey);
  });

  group('System test.', () {
    group('PlaceControllerImpl class.', () {
      group('getBasicPlaceDetails method.', () {
        test(
          'should show log'
          'when give google place id',
          () async {
            final resp = await controller.getBasicPlaceDetails(googlePlaceId);
            logger.info(resp);
          },
        );
      });
    });
  }, skip: 'Skip system test.');
}
