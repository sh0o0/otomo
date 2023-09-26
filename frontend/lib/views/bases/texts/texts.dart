import 'package:flutter/material.dart';

abstract class TextStyles {
  static const bold = TextStyle(fontWeight: FontWeight.bold);
}

abstract class _BaseText extends StatelessWidget {
  const _BaseText(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  TextStyle? _styleOf(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _styleOf(context)?.merge(style),
    );
  }
}

class BodySmall extends _BaseText {
  const BodySmall(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  @override
  TextStyle? _styleOf(BuildContext context) => styleOf(context);
}

class BodyMedium extends _BaseText {
  const BodyMedium(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  @override
  TextStyle? _styleOf(BuildContext context) => styleOf(context);
}

class TitleSmall extends _BaseText {
  const TitleSmall(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;

  @override
  TextStyle? _styleOf(BuildContext context) => styleOf(context);
}

class TitleMedium extends _BaseText {
  const TitleMedium(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  @override
  TextStyle? _styleOf(BuildContext context) => styleOf(context);
}
