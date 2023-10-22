import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/repositories/otomo.dart';
import 'package:otomo/tools/uuid.dart';

import '../tools/firestore.dart';
import '../tools/utils.dart';

void main() async {
  final firestore = await newFakeFirebaseFirestore();
  final repo = OtomoRepositoryImpl(firestore);

  group('OtomoRepositoryImpl class', () {
    group('save method.', () {
      test('Should save when give Otomo.', () async {
        final otomo = Otomo(
          userId: uuid(),
          profile: const OtomoProfile(language: 'ja'),
        );
        await repo.save(otomo);
        final snapshot = await firestore
            .collection('versions/1/otomos')
            .doc(otomo.userId)
            .get();
        expect(snapshot.exists, true);
        expect(snapshot.data(), otomo.toJson());
      });
    });
    group('get method.', () {
      test('Should get when found.', () async {
        final otomo = Otomo(
          userId: uuid(),
          profile: const OtomoProfile(language: 'ja'),
        );
        await repo.save(otomo);
        final result = await repo.get(otomo.userId);
        expect(result, otomo);
      });
      test('Should throw when not found.', () async {
        try {
          await repo.get(uuid());
          fail('should throw exception');
        } catch (e) {
          exceptAppException(
            e,
            cause: Cause.notFound,
            domain: Domain.otomo,
            field: Field.id,
          );
        }
      });
    });
  });
}
