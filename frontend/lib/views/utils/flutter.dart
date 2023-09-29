import 'package:flutter/material.dart';

void afterBuildCallback(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}

bool validateAndSaveForm(GlobalKey<FormState> formKey) {
  final currentState = formKey.currentState;
  assert(currentState != null);

  if (!(currentState!.validate())) return false;
  currentState.save();
  return true;
}
