import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/date.dart';
import 'package:otomo/domains/entities/policies_agreements.dart';
import 'package:otomo/domains/entities/user.dart';
import 'package:otomo/domains/repo/policies_agreements.dart';
import 'package:otomo/domains/repo/user.dart';
import 'package:otomo/tools/clock.dart';

@injectable
class PoliciesAgreementControllerImpl {
  PoliciesAgreementControllerImpl(
    this._agreementsRepository,
    this._userRepository,
    this._savedAgreementsStreamCtrl,
  );

  final PoliciesAgreementsRepository _agreementsRepository;
  final UserRepository _userRepository;
  final StreamController<PoliciesAgreements> _savedAgreementsStreamCtrl;

  Stream<PoliciesAgreements> get savedAgreementsStream =>
      _savedAgreementsStreamCtrl.stream;

  Future<PoliciesAgreements> agree(String userId, Date birthday) async {
    if (!PoliciesAgreements.canAgree(birthday)) {
      throw const AppException(
        message: 'Must be 13 years old or older',
        cause: Cause.invalidArgument,
        domain: Domain.user,
        field: Field.birthday,
      );
    }

    final user = User(id: userId, birthday: birthday);
    await _userRepository.save(user);

    final agreements = PoliciesAgreements(
      userId: userId,
      agreed20231011At: clock.now(),
    );
    await _agreementsRepository.save(agreements);
    _savedAgreementsStreamCtrl.add(agreements);
    return agreements;
  }

  Future<PoliciesAgreements> getAgreements(String userId) async {
    try {
      return await _agreementsRepository.get(userId);
    } on AppException catch (e) {
      if (e.cause == Cause.notFound) {
        return PoliciesAgreements.disagree(userId);
      }
      rethrow;
    }
  }
}
