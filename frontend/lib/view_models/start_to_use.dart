import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/controllers/policies_agreements.dart';
import 'package:otomo/controllers/user.dart';
import 'package:otomo/entities/app_exception.dart';
import 'package:otomo/entities/date.dart';
import 'package:otomo/entities/policies_agreements.dart';
import 'package:otomo/entities/user.dart';
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
    PoliciesAgreements? savedAgreements,
  }) = _StartToUseState;
}

@riverpod
class StartToUse extends _$StartToUse {
  final _userController = getIt<UserControllerImpl>();
  final _agreementsController = getIt<PoliciesAgreementsControllerImpl>();
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

  Future<void> saveAgreement() async {
    state = await guard(() async {
      _validate();

      final user = User(id: readAccount(ref)!.uid, birthday: _value.birthday!);
      await _userController.save(user);
      final agreements =
          PoliciesAgreements(userId: user.id, agreed20231011At: DateTime.now());
      await _agreementsController.save(agreements);
      return _value.copyWith(savedAgreements: agreements);
    });
  }

  void _validate() {
    if (_value.isAgreed) {
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
    if (!PoliciesAgreements.canAgree(birthday)) {
      throw const AppException(
        message: 'Must be 13 years old or older',
        cause: Cause.invalidArgument,
        domain: Domain.user,
        field: Field.birthday,
      );
    }
  }
}
