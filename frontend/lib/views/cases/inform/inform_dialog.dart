import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class InformDialog extends AwesomeDialog {
  InformDialog({
    required super.context,
    required super.btnOkText,
    required super.btnOkOnPress,
    required super.body,
  }) : super(
          dialogType: DialogType.info,
          headerAnimationLoop: false,
          btnOkColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.all(16),
        );
}
