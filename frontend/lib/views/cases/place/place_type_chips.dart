import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceTypeChips extends StatelessWidget {
  const PlaceTypeChips({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: BodySmall(type),
      padding: const EdgeInsets.all(0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
