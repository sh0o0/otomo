import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart' as place_details;
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/place/place_review_stars.dart';

class PlaceReviewCard extends StatelessWidget {
  const PlaceReviewCard({
    super.key,
    required this.review,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;
  final place_details.PlaceDetailsReview review;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          BodySmall(review.text ?? ''),
          Row(
            children: [
              CircleAvatar(
                onBackgroundImageError: (exception, stackTrace) =>
                    logger.warn(exception),
                backgroundImage: NetworkImage(review.profilePhotoUrl ?? ''),
              ),
              Column(
                children: [
                  PlaceReviewStars(rating: review.rating),
                  Row(
                    children: [
                      BodySmall(review.authorName),
                      BodySmall(review.relativeTimeDescription),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
