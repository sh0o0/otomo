import 'package:injectable/injectable.dart';
import 'package:otomo/repositories/policies_agreements.dart';
import 'package:otomo/repositories/user.dart';

@injectable
class PoliciesAgreementControllerImpl {
  const PoliciesAgreementControllerImpl(
    this._agreementsRepository,
    this._userRepository,
  );

  final PoliciesAgreementsRepositoryImpl _agreementsRepository;
  final UserRepositoryImpl _userRepository;
}
