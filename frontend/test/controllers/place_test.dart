import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:otomo/controllers/place.dart';
import 'package:otomo/tools/logger.dart';

import '../test_config.dart';

@GenerateMocks([Dio])
void main() {
  const googlePlaceIds = [
    'ChIJN1t_tDeuEmsRUsoyG83frY4',
    'ChIJ39-uHhSuEmsRM7AE1NF_fK0',
    'ChIJ51cu8IcbXWARiRtXIothAS4',
  ];

  late PlaceControllerImpl controller;

  setUp(() {
    controller = PlaceControllerImpl(apiKey: TestConfig.googleMapApiKey);
  });

  group('PlaceControllerImpl class.', () {
    group('System test.', () {
      group('getPlaceDetails method.', () {
        test(
          'should show log'
          'when give google place id',
          () async {
            for (final id in googlePlaceIds) {
              final resp = await controller.getPlaceDetails(id);
              logger.info(resp);
            }
          },
        );
      });
    }, skip: 'Skip PlaceControllerImpl class.');
  });
}
