import 'package:otomo/domains/entities/policies_agreements.dart';

abstract class PoliciesAgreementsRepository {
  Future<PoliciesAgreements> get(String userId);
  Future<void> save(PoliciesAgreements agreements);
}
