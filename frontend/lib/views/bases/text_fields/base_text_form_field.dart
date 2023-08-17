import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  const BaseTextFormField({
    super.key,
    this.style,
    this.decoration,
    this.keyboardType,
  });

  final TextStyle? style;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: decoration,
      style: style,
      keyboardType: keyboardType,
    );
  }
}
