import 'package:flutter/material.dart';
import 'package:otomo/views/bases/text_fields/base_text_form_field.dart';

final borderRadius = BorderRadius.circular(10000);

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
  });

  final String? hintText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
      ),
    );
  }
}
