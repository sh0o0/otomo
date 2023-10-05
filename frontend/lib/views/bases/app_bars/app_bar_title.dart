import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: HeadlineMedium(title),
    );
  }
}
