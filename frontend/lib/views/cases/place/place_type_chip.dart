import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceTypeChip extends StatelessWidget {
  const PlaceTypeChip({
    super.key,
    required this.type,
  });

  final String type;

  static Widget wrap({
    required BuildContext context,
    required List<String> types,
  }) =>
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: types.map((type) => PlaceTypeChip(type: type)).toList(),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: theme.colorScheme.secondary)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: BodySmall(
        type,
        style: TextStyle(color: theme.colorScheme.secondary),
      ),
    );
  }
}
