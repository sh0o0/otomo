import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/domains/repo/otomo.dart';

@Injectable(as: OtomoRepository)
class OtomoRepositoryImpl implements OtomoRepository {
  const OtomoRepositoryImpl(this._firestore);

  final FirebaseFirestore _firestore;

  static const _collectionPath = 'versions/1/otomos';

  @override
  Future<void> save(Otomo otomo) {
    final doc = _firestore.collection(_collectionPath).doc(otomo.userId);
    return doc.set(otomo.toJson());
  }

  @override
  Future<Otomo> get(String userId) async {
    final doc = _firestore.collection(_collectionPath).doc(userId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      return Otomo.fromJson(snapshot.data()!);
    }
    throw const AppException(
      message: 'Otomo not found',
      cause: Cause.notFound,
      domain: Domain.otomo,
      field: Field.id,
    );
  }
}
