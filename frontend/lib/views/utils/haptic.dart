import 'package:flutter/services.dart';

class Haptic {
  static Future<void> mediumImpact() => HapticFeedback.mediumImpact();
  static Future<void> lightImpact() => HapticFeedback.lightImpact();
}
