import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/policies_agreements.dart';
import 'package:otomo/entities/app_exception.dart';
import 'package:otomo/entities/policies_agreements.dart';
import 'package:otomo/view_models/start_to_use.dart';
import 'package:otomo/view_models/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'agreed_policies.g.dart';

@riverpod
class AgreedPolicies extends _$AgreedPolicies {
  final _agreementsController = getIt<PoliciesAgreementsControllerImpl>();

  @override
  Future<PoliciesAgreements> build() async {
    final sub = ref.listen(
        startToUseProvider.select((state) => state.value?.savedAgreements),
        (previous, next) {
      if (next != null) state = AsyncValue.data(next);
    });
    ref.onDispose(sub.close);

    final userId = readAccount(ref)?.uid;
    if (userId == null) throw const AppException(cause: Cause.notSignedIn);
    return _agreementsController.get(userId);
  }
}
