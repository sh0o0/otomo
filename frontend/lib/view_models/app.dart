import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/controllers/auth.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/view_models/account.dart';
import 'package:otomo/view_models/sign_in_with_email_link.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app.g.dart';

@Riverpod(keepAlive: true)
class AppVM extends _$AppVM {
  final _dynamicLinks = getIt<FirebaseDynamicLinks>();
  final _authController = getIt<AuthControllerImpl>();

  @override
  void build() {
    _setUserIdOnAccountChanged();
    _initDynamicLinks();
    return;
  }

  void applyLanguageToControllers(String languageCode) {
    _authController.setLanguageCode(languageCode);
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

  Future<void> _initDynamicLinks() async {
    final initialLink = await _dynamicLinks.getInitialLink();

    if (initialLink == null) {
      logger.info('initial dynamic link is null');
    } else {
      logger.info('got initial dynamic link');
      _handleDynamicLink(initialLink);
    }

    final sub = _dynamicLinks.onLink.listen((data) {
      logger.info('dynamic link received');
      _handleDynamicLink(data);
    });
    ref.onDispose(() {
      sub.cancel();
    });
  }

  void _handleDynamicLink(PendingDynamicLinkData data) {
    logger
        .info('handel dynamic link. do nothing. Link: ${data.link.toString()}');

    ref
        .read(signInWithEmailLinkProvider.notifier)
        .signInWithEmailLinkIfLinkCorrect(data.link.toString());
  }
}
