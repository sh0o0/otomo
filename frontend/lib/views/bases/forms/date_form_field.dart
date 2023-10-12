import 'package:flutter/material.dart';
import 'package:otomo/views/bases/forms/rounded_text_form_field.dart';
import 'package:otomo/views/utils/date_formatter.dart';

class DateFormField extends StatefulWidget {
  const DateFormField({
    Key? key,
    required this.onConfirmed,
    this.validator,
  }) : super(key: key);

  final ValueChanged<DateTime> onConfirmed;
  final FormFieldValidator<String>? validator;

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
    _controller.text = DateFormatter.jaDate.format(pickedDate);
    widget.onConfirmed(pickedDate);
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    final now = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
      cancelText: 'キャンセル',
      confirmText: '確定',
      errorInvalidText: '選択した日付が正しくありません',
    );
  }

  @override
  Widget build(BuildContext context) {
    return RoundedTextFormField(
      controller: _controller,
      readOnly: true,
      decoration: RoundedTextFormField.defaultDecoration.copyWith(
        suffixIcon: const Icon(Icons.arrow_right_rounded),
      ),
      onTap: () => _onTap(context),
      validator: widget.validator,
    );
  }
}
