import 'package:flutter/material.dart';

class RoundedTextFormField extends StatelessWidget {
  const RoundedTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.enabled,
    this.readOnly = false,
    this.decoration,
    this.onTap,
    this.initialValue,
    this.autofocus = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? enabled;
  final bool readOnly;
  final InputDecoration? decoration;
  final GestureTapCallback? onTap;
  final String? initialValue;
  final bool autofocus;

  static final defaultDecoration = InputDecoration(
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
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: (decoration ?? defaultDecoration).copyWith(
        hintText: hintText,
      ),
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      readOnly: readOnly,
      onTap: onTap,
      initialValue: initialValue,
      autofocus: autofocus,
    );
  }
}
