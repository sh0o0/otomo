import 'package:flutter/material.dart';

abstract class TextStyles {
  static const bold = TextStyle(fontWeight: FontWeight.bold);
  static const ellipsis = TextStyle(overflow: TextOverflow.ellipsis);
  static TextStyle? disabled(BuildContext context) => TextStyle(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.38),
      );
}

abstract class BaseText extends StatelessWidget {
  const BaseText(
    this.text, {
    super.key,
    this.style,
    this.overflow
  });

  final String text;
  final TextStyle? style;
  final TextOverflow? overflow;

  TextStyle? defaultStyle(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: defaultStyle(context)?.merge(style),
      overflow: overflow,
    );
  }
}

class BodySmall extends BaseText {
  const BodySmall(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}

class BodyMedium extends BaseText {
  const BodyMedium(
    super.text, {
    super.key,
    super.style,
    super.overflow,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}

class BodyLarge extends BaseText {
  const BodyLarge(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge;

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}

class TitleSmall extends BaseText {
  const TitleSmall(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}

class TitleMedium extends BaseText {
  const TitleMedium(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}

class TitleLarge extends BaseText {
  const TitleLarge(
    super.text, {
    super.key,
    super.style,
  });

  static TextStyle? styleOf(BuildContext context) =>
      Theme.of(context).textTheme.titleLarge;

  @override
  TextStyle? defaultStyle(BuildContext context) => styleOf(context);
}
