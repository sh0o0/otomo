import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:otomo/configs/injection.dart';
import 'package:otomo/constants/analytics_event.dart';

final class Analytics {
  Analytics._();

  static final _analytics = getIt<FirebaseAnalytics>();
  static final observer = FirebaseAnalyticsObserver(analytics: _analytics);

  static Future<void> logScreenView({
    String? screenName,
    String? screenClass,
  }) {
    return _analytics.logScreenView(
      screenClass: screenClass,
      screenName: screenName,
    );
  }

  static Future<void> logEvent({
    required AnalyticsEvents event,
    Map<String, dynamic>? parameters,
  }) {
    return _analytics.logEvent(
      name: event.name,
      parameters: parameters,
    );
  }

  static FutureOr<void> logDraggableScrollableSheet({
    required String screenName,
    required double currentSize,
    required double maxSize,
    required double minSize,
    required List<double> snapSizes,
  }) {
    final roundedCurrentSize = currentSize.toStringAsFixed(8);
    final roundedMaxSize = maxSize.toStringAsFixed(8);
    final roundedMinSize = minSize.toStringAsFixed(8);
    final roundedSnapSizes =
        snapSizes.map((e) => e.toStringAsFixed(8)).toList();

    if (roundedCurrentSize == roundedMaxSize) {
      return logScreenView(screenName: '${screenName}_max');
    }
    if (roundedCurrentSize == roundedMinSize) {
      return logScreenView(screenName: '${screenName}_min');
    }
    for (final snapSize in roundedSnapSizes) {
      if (roundedCurrentSize == snapSize) {
        return logScreenView(screenName: '${screenName}_snap_$snapSize');
      }
    }
  }
}
