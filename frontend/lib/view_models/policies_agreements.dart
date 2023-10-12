import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/policies_agreements.dart';
import 'package:otomo/controllers/user.dart';
import 'package:otomo/entities/date.dart';
import 'package:otomo/entities/user.dart';
import 'package:otomo/view_models/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'policies_agreements.freezed.dart';
part 'policies_agreements.g.dart';

@freezed
class PoliciesAgreementsState with _$PoliciesAgreementsState {
  const PoliciesAgreementsState._();
  const factory PoliciesAgreementsState({
    Date? birthday,
    @Default(false) bool isAgreed,
  }) = _PoliciesAgreementsState;
}

@riverpod
class PoliciesAgreements extends _$PoliciesAgreements {
  final _userController = getIt<UserControllerImpl>();
  final _agreementsController = getIt<PoliciesAgreementsControllerImpl>();

  @override
  PoliciesAgreementsState build() {
    return const PoliciesAgreementsState();
  }

  void setBirthday(DateTime birthday) {
    state = state.copyWith(birthday: Date.fromDateTime(birthday));
  }

  void agree() {
    state = state.copyWith(isAgreed: true);
  }

  bool _validate() {
    final id = readAccount(ref)?.uid;
    final birthday = state.birthday;
    if (id == null || birthday == null) {
      return false;
    }
    final user = User(id: id, birthday: birthday);
    return user.age >= 13;
  }
}
