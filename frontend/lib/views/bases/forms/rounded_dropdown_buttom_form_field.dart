import 'package:flutter/material.dart';

class RoundedDropdownButtonFormField<T> extends StatelessWidget {
  const RoundedDropdownButtonFormField({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
  });

  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;

  static final defaultDecoration = InputDecoration(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10000),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  );

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField(
        decoration: defaultDecoration,
        borderRadius: BorderRadius.circular(20),
        value: value,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
