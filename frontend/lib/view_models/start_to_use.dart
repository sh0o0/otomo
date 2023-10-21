import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/controllers/otomo.dart';
import 'package:otomo/controllers/policies_agreement.dart';
import 'package:otomo/domains/entities/app_exception.dart';
import 'package:otomo/domains/entities/date.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/view_models/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_to_use.freezed.dart';
part 'start_to_use.g.dart';

@freezed
class StartToUseState with _$StartToUseState {
  const StartToUseState._();
  const factory StartToUseState({
    Date? birthday,
    @Default(false) bool isAgreed,
  }) = _StartToUseState;

  bool get canSaveAgreements => isAgreed && birthday != null;
}

@riverpod
class StartToUse extends _$StartToUse {
  final _agreementController = getIt<PoliciesAgreementControllerImpl>();
  final _otomoController = getIt<OtomoControllerImpl>();
  final _authController = getIt<AuthControllerImpl>();

  @override
  Future<StartToUseState> build() async {
    return const StartToUseState();
  }

  StartToUseState get _value {
    final value = state.value;
    if (value == null) return const StartToUseState();
    return value;
  }

  void setBirthday(DateTime birthday) {
    state = AsyncValue.data(
      _value.copyWith(birthday: Date.fromDateTime(birthday)),
    );
  }

  void setIsAgreed(bool value) {
    state = AsyncValue.data(_value.copyWith(isAgreed: value));
  }

  Future<void> signOut() => _authController.signOut();

  Future<void> startToUse(String otomoLanguage) async {
    state = const AsyncValue.loading();
    state = await guard(() async {
      await _agree();
      // Not future intentionally
      _saveOtomoLanguage(otomoLanguage);
      return _value;
    });
  }

  Future<void> _agree() async {
    if (!_value.isAgreed) {
      throw const AppException(
        message: 'Must agree',
        cause: Cause.invalidArgument,
        domain: Domain.policiesAgreements,
      );
    }

    final birthday = _value.birthday;
    if (birthday == null) {
      throw const AppException(
        message: 'Must input birthday',
        cause: Cause.invalidArgument,
        domain: Domain.user,
        field: Field.birthday,
      );
    }
    final userId = readAccount(ref)!.uid;
    await _agreementController.agree(userId, birthday);
  }

  Future<void> _saveOtomoLanguage(String otomoLanguage) async {
    final userId = readAccount(ref)!.uid;
    final otomo = Otomo(
      userId: userId,
      profile: OtomoProfile(
        language: otomoLanguage,
      ),
    );
    await _otomoController.save(otomo);
  }
}
