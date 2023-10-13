import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/policies_agreements.dart';
import 'package:otomo/domains/repo/policies_agreements.dart';

@Injectable(as: PoliciesAgreementsRepository)
class PoliciesAgreementsRepositoryImpl implements PoliciesAgreementsRepository {
  const PoliciesAgreementsRepositoryImpl(this._firestore);

  final FirebaseFirestore _firestore;

  static const _collectionPath = 'versions/1/policies_agreements';

  @override
  Future<void> save(PoliciesAgreements agreements) async {
    final doc = _firestore.collection(_collectionPath).doc(agreements.userId);
    await doc.set(agreements.toJson());
  }

  @override
  Future<PoliciesAgreements> get(String userId) async {
    final doc = _firestore.collection(_collectionPath).doc(userId);
    final snapshot = await doc.get();
    if (snapshot.exists) {
      return PoliciesAgreements.fromJson(snapshot.data()!);
    }
    throw const AppException(
      message: 'PoliciesAgreements not found',
      cause: Cause.notFound,
      domain: Domain.policiesAgreements,
      field: Field.id,
    );
  }
}
