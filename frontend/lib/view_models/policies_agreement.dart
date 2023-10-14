import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/policies_agreement.dart';
import 'package:otomo/domains/entities/policies_agreements.dart';
import 'package:otomo/view_models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'policies_agreement.freezed.dart';
part 'policies_agreement.g.dart';

@freezed
class PoliciesAgreementState with _$PoliciesAgreementState {
  const PoliciesAgreementState._();
  const factory PoliciesAgreementState({
    @Default(null) PoliciesAgreements? agreements,
    @Default(true) bool initialized,
    @Default(false) bool loading,
  }) = _PoliciesAgreementState;

  bool get isAgreed => agreements?.isAgreed == true;
}

@Riverpod(keepAlive: true)
class PoliciesAgreement extends _$PoliciesAgreement {
  final _agreementsController = getIt<PoliciesAgreementControllerImpl>();

  @override
  PoliciesAgreementState build() {
    final accountSub = ref.listen(accountVMProvider, (previous, next) async {
      final account = next.account;
      if (account == null) {
        state = const PoliciesAgreementState();
      } else {
        try {
          state = state.copyWith(loading: true);
          final agreements =
              await _agreementsController.getAgreements(account.uid);
          state = PoliciesAgreementState(agreements: agreements);
        } catch (_) {
          state = state.copyWith(loading: false);
          rethrow;
        }
      }
    });
    final savedAgreementsSub =
        _agreementsController.savedAgreementsStream.listen((agreements) {
      state = PoliciesAgreementState(agreements: agreements);
    });

    ref.onDispose(() {
      accountSub.close();
      savedAgreementsSub.cancel();
    });

    return const PoliciesAgreementState(initialized: false);
  }
}
