import 'package:flutter/material.dart';

final class AppSnackbar {
  AppSnackbar._();

  static SnackBar build({
    required Widget content,
  }) {
    return SnackBar(content: content);
  }

  static SnackBar text(String text) {
    return build(content: Text(text));
  }
}
