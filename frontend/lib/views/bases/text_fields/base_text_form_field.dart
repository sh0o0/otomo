import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  const BaseTextFormField({
    super.key,
    this.style,
    this.decoration,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.validator,
  });

  final TextStyle? style;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      style: style,
      keyboardType: keyboardType,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
