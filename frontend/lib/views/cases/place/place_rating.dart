import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceRating extends StatelessWidget {
  const PlaceRating({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSmall('Rating'),
        BodyLarge(
          rating.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
