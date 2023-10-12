import 'package:cloud_firestore/cloud_firestore.dart';

class PoliciesAgreementsControllerImpl {
  const PoliciesAgreementsControllerImpl(this._firestore);

  final FirebaseFirestore _firestore;

  Future<bool> hasAgreedToPolicies(String userId) async {
    final doc = await _firestore.doc('users/$userId').get();
    return doc.exists && doc.data()!['hasAgreedToPolicies'] == true;
  }
}
