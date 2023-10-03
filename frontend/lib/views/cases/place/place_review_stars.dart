import 'package:flutter/material.dart';

class PlaceReviewStars extends StatelessWidget {
  const PlaceReviewStars({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < rating; i++)
          Icon(
            Icons.star,
            color: Colors.yellow,
          ),
        for (var i = 0; i < 5 - rating; i++)
          Icon(
            Icons.star,
            color: Colors.grey,
          ),
      ],
    );
  }
}
