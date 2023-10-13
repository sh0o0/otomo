import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otomo/entities/app_exception.dart';
import 'package:otomo/entities/date.dart';
import 'package:otomo/entities/user.dart';
import 'package:otomo/repositories/user.dart';
import 'package:otomo/tools/uuid.dart';

import '../utils.dart';

void main() async {
  final firestore = FakeFirebaseFirestore();
  final repo = UserRepositoryImpl(firestore);
  final now = DateTime.now();

  group('${repo.runtimeType} class.', () {
    group('${repo.save.groupName} method.', () {
      test('Should save when give User.', () async {
        final user = User(
          id: uuid(),
          birthday: Date.fromDateTime(now),
        );
        await repo.save(user);
        final snapshot =
            await firestore.collection('versions/1/users').doc(user.id).get();
        expect(snapshot.exists, true);
        expect(snapshot.data(), user.toJson());
      });
    });
    group('${repo.get.groupName} method.', () {
      test('Should get when found.', () async {
        final user = User(
          id: uuid(),
          birthday: Date.fromDateTime(now),
        );
        await repo.save(user);
        final result = await repo.get(user.id);
        expect(result, user);
      });
      test('Should throw exception when not found.', () async {
        try {
          await repo.get(uuid());
          fail('should throw exception');
        } catch (e) {
          expect(
            true,
            e is AppException &&
                e.cause == Cause.notFound &&
                e.domain == Domain.user &&
                e.field == Field.id,
          );
        }
      });
    });
  });
}
