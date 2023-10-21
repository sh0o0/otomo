import 'dart:io';

import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';

final firestoreSecurityRulesPath =
    '${Directory.current.parent.path}/firebase/firestore/firestore.rules';

String? _rulesCache;

// fake_firebase_security_rules does not support `functions` yet.
// ignore: unused_element
Future<String> _firestoreSecurityRules() async {
  if (_rulesCache != null) {
    return _rulesCache!;
  }

  final rules = await File(firestoreSecurityRulesPath).readAsString();
  _rulesCache = rules;
  return rules;
}

Future<FakeFirebaseFirestore> newFakeFirebaseFirestore() async {
  return FakeFirebaseFirestore();
}
