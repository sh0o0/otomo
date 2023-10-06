import 'package:flutter/material.dart';
import 'package:otomo/views/bases/text_fields/base_text_form_field.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({
    super.key,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.validator,
  });

  final String? hintText;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  static final inputDecoration = InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 8,
      horizontal: 24,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10000),
      borderSide: BorderSide.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      keyboardType: keyboardType,
      decoration: inputDecoration,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
