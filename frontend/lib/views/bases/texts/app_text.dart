import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText._(
    this.text, {
    this.style,
    required this.styleBuilder,
  });

  final String text;
  final TextStyle? style;
  final TextStyle? Function(BuildContext) styleBuilder;

  static TextStyle? bodySmallStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;
  static TextStyle? bodyMediumStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;

  static TextStyle? titleSmallStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleSmall;
  static TextStyle? titleMediumStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  factory AppText.bodySmall(
    String text, {
    TextStyle? style,
  }) =>
      AppText._(
        text,
        style: style,
        styleBuilder: bodySmallStyle,
      );

  factory AppText.bodyMedium(
    String text, {
    TextStyle? style,
  }) =>
      AppText._(
        text,
        style: style,
        styleBuilder: bodyMediumStyle,
      );

  factory AppText.titleSmall(
    String text, {
    TextStyle? style,
  }) =>
      AppText._(
        text,
        style: style,
        styleBuilder: titleSmallStyle,
      );

  factory AppText.titleMedium(
    String text, {
    TextStyle? style,
  }) =>
      AppText._(
        text,
        style: style,
        styleBuilder: titleMediumStyle,
      );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: styleBuilder.call(context)?.merge(style),
    );
  }
}

abstract class TextStyles {
  static const bold = TextStyle(fontWeight: FontWeight.bold);
}
