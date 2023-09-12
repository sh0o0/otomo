import 'package:flutter/material.dart';

class ViewUtilsController {
  ViewUtilsController._();
  static final _instance = ViewUtilsController._();
  static ViewUtilsController get instance => _instance;

  void unfocus(BuildContext context) {
    final currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
