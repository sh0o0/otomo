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

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: styleBuilder.call(context)?.merge(style),
    );
  }
}
