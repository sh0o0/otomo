import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/user.dart';

@injectable
class UserRepositoryImpl {
  const UserRepositoryImpl(this._firestore);

  final FirebaseFirestore _firestore;

  static const _collectionPath = 'versions/1/users';

  Future<void> save(User user) async {
    final doc = _firestore.collection(_collectionPath).doc(user.id);
    await doc.set(user.toJson());
  }

  Future<User> get(String userId) async {
    final doc = _firestore.collection(_collectionPath).doc(userId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      return User.fromJson(snapshot.data()!);
    }
    throw const AppException(
      message: 'User not found',
      cause: Cause.notFound,
      domain: Domain.user,
      field: Field.id,
    );
  }
}
