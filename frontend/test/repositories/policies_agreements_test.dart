import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/policies_agreements.dart';
import 'package:otomo/repositories/policies_agreements.dart';
import 'package:otomo/tools/uuid.dart';

void main() async {
  final firestore = FakeFirebaseFirestore();
  final repo = PoliciesAgreementsRepositoryImpl(firestore);

  group('PoliciesAgreementsRepositoryImpl class', () {
    group('save method.', () {
      test('Should save when give PoliciesAgreements.', () async {
        final agreements = PoliciesAgreements(
            userId: uuid(), agreed20231011At: DateTime.now());
        await repo.save(agreements);
        final snapshot = await firestore
            .collection('versions/1/policies_agreements')
            .doc(agreements.userId)
            .get();
        expect(snapshot.exists, true);
        expect(snapshot.data(), agreements.toJson());
      });
    });
    group('get method.', () {
      test('Should get when found.', () async {
        final agreements = PoliciesAgreements(
            userId: uuid(), agreed20231011At: DateTime.now());
        await repo.save(agreements);
        final result = await repo.get(agreements.userId);
        expect(result, agreements);
      });
      test('Should throw PoliciesAgreements when not found.', () async {
        try {
          await repo.get(uuid());
          fail('should throw exception');
        } catch (e) {
          expect(
            true,
            e is AppException &&
                e.cause == Cause.notFound &&
                e.domain == Domain.policiesAgreements &&
                e.field == Field.id,
          );
        }
      });
    });
  });
}
