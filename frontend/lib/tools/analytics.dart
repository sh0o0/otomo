import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:otomo/configs/injection.dart';

final class Analytics {
  Analytics._();

  static final _analytics = getIt<FirebaseAnalytics>();
  static final observer = FirebaseAnalyticsObserver(analytics: _analytics);

  static Future<void> logScreenView({
    String? screenClass,
    String? screenName,
  }) =>
      _analytics.logScreenView(
        screenClass: screenClass,
        screenName: screenName,
      );
}
