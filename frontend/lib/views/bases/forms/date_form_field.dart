import 'package:flutter/material.dart';
import 'package:otomo/views/bases/forms/rounded_text_form_field.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    Key? key,
    this.labelText,
    required this.onConfirmed,
    this.isRequired = false,
  }) : super(key: key);

  final String? labelText;
  final ValueChanged<DateTime> onConfirmed;
  final bool isRequired;

  @override
  DateFormFieldState createState() => DateFormFieldState();
}

class DateFormFieldState extends State<DateFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTap(BuildContext context) async {
    final pickedDate = await _showDatePicker(context);
    // ignore: always_put_control_body_on_new_line
    if (pickedDate == null) return;
    _controller.text = pickedDate.toIso8601String();
    widget.onConfirmed(pickedDate);
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1950),
      lastDate: now,
      cancelText: 'キャンセル',
      confirmText: '確定',
      errorInvalidText: '選択した日付が正しくありません',
      builder: (context, child) {
        return Theme(data: Theme.of(context), child: child!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: RoundedTextFormField(
        controller: _controller,
        hintText: widget.labelText,
        enabled: false,
        decoration: const InputDecoration(
          suffixIcon: Icon(Icons.arrow_right_rounded),
        ),
      ),
    );
  }
}
