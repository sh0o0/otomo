import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/view_models/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app.g.dart';

@Riverpod(keepAlive: true)
class AppVM extends _$AppVM {

  @override
  void build() {
    _setUserIdOnAccountChanged();
    return;
  }

  void _setUserIdOnAccountChanged() {
    final sub = ref.listen(accountVMProvider.select((value) => value.account),
        (_, account) {
      if (account == null) return;
      getIt<FirebaseCrashlytics>().setUserIdentifier(account.uid);
      getIt<FirebaseAnalytics>().setUserId(id: account.uid);
    });
    ref.onDispose(() {
      sub.close();
    });
  }
}
