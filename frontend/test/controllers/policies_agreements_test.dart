import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/controllers/policies_agreements.dart';
import 'package:otomo/entities/policies_agreements.dart';
import 'package:otomo/tools/uuid.dart';

void main() async {
  final firestore = FakeFirebaseFirestore();
  final policiesAgreementsController =
      PoliciesAgreementsControllerImpl(firestore);

  group('PoliciesAgreementsControllerImpl class.', () {
    group('save method.', () {
      test('Should save when give PoliciesAgreements.', () async {
        final agreements = PoliciesAgreements(
            userId: uuid(), agreed20231011At: DateTime.now());
        await policiesAgreementsController.save(agreements);
        final snapshot = await firestore
            .collection('versions/1/policies_agreements')
            .doc(agreements.userId)
            .get();
        expect(snapshot.exists, true);
        expect(snapshot.data(), agreements.toJson());
      });
    }, skip: 'System test');
    group('get method.', () {
      test('Should get when found.', () async {
        final agreements = PoliciesAgreements(
            userId: uuid(), agreed20231011At: DateTime.now());
        await policiesAgreementsController.save(agreements);
        final result =
            await policiesAgreementsController.get(agreements.userId);
        expect(result, agreements);
      });
      test('Should get disagree PoliciesAgreements when not found.', () async {
        final want = PoliciesAgreements.disagree(uuid());
        final result = await policiesAgreementsController.get(want.userId);
        expect(result, want);
      });
    }, skip: 'System test');
  });
}
