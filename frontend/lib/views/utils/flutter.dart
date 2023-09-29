import 'package:flutter/material.dart';

void afterBuildCallback(VoidCallback callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    callback();
  });
}
