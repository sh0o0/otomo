import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/policies_agreement.dart';
import 'package:otomo/domains/entities/policies_agreements.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/view_models/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'agreed_policies.freezed.dart';
part 'agreed_policies.g.dart';

@freezed
class PoliciesAgreementState with _$PoliciesAgreementState {
  const PoliciesAgreementState._();
  const factory PoliciesAgreementState({
    @Default(null) PoliciesAgreements? agreements,
  }) = _PoliciesAgreementState;

  bool get isAgreed => agreements?.isAgreed == true;
}

@Riverpod(keepAlive: true)
class PoliciesAgreement extends _$PoliciesAgreement {
  final _agreementsController = getIt<PoliciesAgreementControllerImpl>();

  @override
  Future<PoliciesAgreementState> build() async {
    logger.debug('build policies agreement');

    final accountSub = ref.listen(accountProvider, (previous, next) async {
      if (next == null) {
        state = const AsyncValue.data(PoliciesAgreementState());
      } else {
        state = const AsyncValue.loading();
        state = await guard(() async {
          final agreements =
              await _agreementsController.getAgreements(next.uid);
          return PoliciesAgreementState(agreements: agreements);
        });
      }
    });
    final savedAgreementsSub =
        _agreementsController.savedAgreementsStream.listen((agreements) {
      state = AsyncValue.data(PoliciesAgreementState(agreements: agreements));
    });

    ref.onDispose(() {
      accountSub.close();
      savedAgreementsSub.cancel();
    });

    return const PoliciesAgreementState();
  }
}
