import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:otomo/controllers/policies_agreement.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/date.dart';
import 'package:otomo/domains/entities/policies_agreements.dart';
import 'package:otomo/domains/entities/user.dart';
import 'package:otomo/domains/repo/policies_agreements.dart';
import 'package:otomo/domains/repo/user.dart';
import 'package:otomo/tools/clock.dart';
import 'package:otomo/tools/uuid.dart';

import '../tools/clock.dart';
import '../tools/utils.dart';
import 'policies_agreement_test.mocks.dart';

@GenerateMocks([PoliciesAgreementsRepository, UserRepository])
void main() {
  setTestClock();

  late MockPoliciesAgreementsRepository agreementsRepository;
  late MockUserRepository userRepository;
  late PoliciesAgreementControllerImpl controller;
  final now = clock.now();

  setUp(() {
    agreementsRepository = MockPoliciesAgreementsRepository();
    userRepository = MockUserRepository();
    controller = PoliciesAgreementControllerImpl(
      agreementsRepository,
      userRepository,
    );
  });

  group('PoliciesAgreementControllerImpl class', () {
    group('agree method', () {
      test('should throw when under 13 age', () async {
        final birthday =
            Date(year: now.year - 12, month: now.month, day: now.day);
        try {
          await controller.agree(uuid(), birthday);
          fail('should throw');
        } catch (e) {
          exceptAppException(e,
              cause: Cause.invalidArgument,
              domain: Domain.user,
              field: Field.birthday);
        }
      });
      test('should save when give valid args', () async {
        final userId = uuid();
        final birthday =
            Date(year: now.year - 13, month: now.month, day: now.day);
        final user = User(id: userId, birthday: birthday);
        final agreements = PoliciesAgreements(
          userId: userId,
          agreed20231011At: clock.now(),
        );

        final result = await controller.agree(userId, birthday);
        expect(result, agreements);
        verify(userRepository.save(user)).called(1);
        verify(agreementsRepository.save(agreements)).called(1);
      });
    });
    group('getAgreements', () {
      test('should return disagree when not found', () async {
        final userId = uuid();
        final want = PoliciesAgreements.disagree(userId);
        when(agreementsRepository.get(userId))
            .thenThrow(const AppException(cause: Cause.notFound));

        final result = await controller.getAgreements(userId);

        expect(result, want);
      });
      test('should return agreements when found', () async {
        final userId = uuid();
        final agreements = PoliciesAgreements(
          userId: userId,
          agreed20231011At: clock.now(),
        );
        when(agreementsRepository.get(userId))
            .thenAnswer((_) async => agreements);

        final result = await controller.getAgreements(userId);

        expect(result, agreements);
      });
    });
  });
}
