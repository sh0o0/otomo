import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceRatingsAndReviews extends StatelessWidget {
  const PlaceRatingsAndReviews({
    super.key,
    required this.reviews,
    this.reviewCardHeight = 160,
    this.reviewCardWidth = 240,
    this.reviewTextMaxLines = 4,
  });

  final List<PlaceDetailsReview> reviews;
  final double reviewCardHeight;
  final double reviewCardWidth;
  final int reviewTextMaxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeadlineSmall('Rating & Reviews', style: TextStyles.bold),
        Spaces.h8,
        SizedBox(
          height: reviewCardHeight,
          child: PlaceReviewListView(
            reviews: reviews,
            reviewCardWidth: reviewCardWidth,
            reviewTextMaxLines: reviewTextMaxLines,
          ),
        )
      ],
    );
  }
}

class PlaceReviewListView extends StatelessWidget {
  const PlaceReviewListView({
    super.key,
    required this.reviews,
    required this.reviewCardWidth,
    required this.reviewTextMaxLines,
  });

  final List<PlaceDetailsReview> reviews;
  final double reviewCardWidth;
  final int reviewTextMaxLines;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: reviews.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: PlaceReviewCard(
          review: reviews[index],
          width: reviewCardWidth,
          reviewTextMaxLines: reviewTextMaxLines,
        ),
      ),
    );
  }
}

class PlaceReviewCard extends StatelessWidget {
  const PlaceReviewCard({
    super.key,
    required this.review,
    this.height,
    this.width,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.reviewTextMaxLines = 4,
  });

  final PlaceDetailsReview review;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  final int reviewTextMaxLines;

  static const _profileHeight = 50.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: borderRadius,
      ),
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(builder: (context, constrains) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: constrains.maxHeight - _profileHeight,
              child: PlaceReviewText(
                review: review,
                maxLines: reviewTextMaxLines,
              ),
            ),
            SizedBox(
              height: _profileHeight,
              child: PlaceReviewProfile(review: review),
            )
          ],
        );
      }),
    );
  }
}

class PlaceReviewText extends StatelessWidget {
  const PlaceReviewText({
    super.key,
    required this.review,
    this.maxLines = 4,
  });

  final PlaceDetailsReview review;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return BodyMedium(
      (review.text ?? '').replaceAll('\n', ''),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}

class PlaceReviewProfile extends StatelessWidget {
  const PlaceReviewProfile({
    super.key,
    required this.review,
  });

  final PlaceDetailsReview review;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          onBackgroundImageError: (exception, stackTrace) =>
              logger.warn(exception),
          backgroundImage: CachedNetworkImageProvider(
            review.profilePhotoUrl ?? '',
          ),
        ),
        Spaces.w8,
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceReviewStars(rating: review.rating),
            Row(
              children: [
                BodySmall(
                  review.authorName,
                  overflow: TextOverflow.ellipsis,
                ),
                Spaces.w8,
                BodySmall(
                  review.relativeTimeDescription,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.disabled(context),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

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
        for (var i = 0; i < rating; i++) const ReviewStar(active: true),
        for (var i = 0; i < 5 - rating; i++) const ReviewStar(active: false),
      ],
    );
  }
}

class ReviewStar extends StatelessWidget {
  const ReviewStar({
    super.key,
    required this.active,
    this.size = 20,
  });

  final bool active;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: active ? Colors.orange : Colors.grey,
      size: size,
    );
  }
}
