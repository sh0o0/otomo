import 'package:flutter/material.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/bases/forms/date_form_field.dart';

class PoliciesAgreementPage extends StatelessWidget {
  const PoliciesAgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DateFormField(onConfirmed: (date) {
            logger.debug(date.toIso8601String());
          })
        ],
      ),
    );
  }
}
