import 'package:flutter/material.dart';

bool isAnimationRunningForwardsOrComplete(AnimationStatus status) {
  switch (status) {
    case AnimationStatus.forward:
    case AnimationStatus.completed:
      return true;
    case AnimationStatus.reverse:
    case AnimationStatus.dismissed:
      return false;
  }
}
