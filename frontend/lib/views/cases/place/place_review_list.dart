import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/place/place_review_card.dart';

class PlaceReviewListTile extends StatelessWidget {
  const PlaceReviewListTile({
    super.key,
    required this.review,
  });

  final PlaceDetailsReview review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlaceReviewProfile(review: review),
        Spaces.h8,
        BodyMedium(review.text ?? ''),
      ],
    );
  }
}
