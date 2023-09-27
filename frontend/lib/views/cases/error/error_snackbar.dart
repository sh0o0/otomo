import 'package:flutter/material.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';

final class ErrorSnackbar {
  ErrorSnackbar._();

  static SnackBar build({
    required Widget content,
  }) {
    return SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline_rounded),
          Spaces.w8,
          content,
        ],
      ),
    );
  }

  static SnackBar text(String text) {
    return build(content: BodyMedium(text));
  }
}
