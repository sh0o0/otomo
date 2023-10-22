import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/otomo.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/view_models/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'otomo_profile.g.dart';

@riverpod
class OtomoProfileVM extends _$OtomoProfileVM {
  final _otomoController = getIt<OtomoControllerImpl>();

  @override
  FutureOr<Otomo> build() => _otomoController.get(readAccount(ref)!.uid);

  Otomo get _emptyState => Otomo(
        userId: readAccount(ref)!.uid,
        profile: const OtomoProfile(language: ''),
      );
  Otomo get _value => state.value ?? _emptyState;

  Future<void> updateLanguage(String languageCode) async {
    state = await guard(() async {
      final otomo = _value.copyWith.profile(language: languageCode);
      await _otomoController.save(otomo);
      return otomo;
    });
  }
}
