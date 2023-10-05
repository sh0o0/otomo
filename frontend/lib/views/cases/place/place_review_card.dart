import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/avatars/app_circle_avatar.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/pages/place_reviews.dart';

class PlaceRatingsAndReviews extends StatelessWidget {
  const PlaceRatingsAndReviews({
    super.key,
    required this.reviews,
    this.reviewCardHeight = 160,
    this.reviewCardWidth = 240,
    this.reviewTextMaxLines = 4,
    this.sidePadding = 0,
  });

  final List<PlaceDetailsReview> reviews;
  final double reviewCardHeight;
  final double reviewCardWidth;
  final int reviewTextMaxLines;
  final double sidePadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sidePadding),
          child: const HeadlineSmall(
            'Rating & Reviews',
            style: TextStyles.bold,
          ),
        ),
        Spaces.h8,
        SizedBox(
          height: reviewCardHeight,
          child: PlaceReviewCardListView(
            reviews: reviews,
            reviewCardWidth: reviewCardWidth,
            reviewTextMaxLines: reviewTextMaxLines,
            firstPadding: sidePadding,
          ),
        )
      ],
    );
  }
}

class PlaceReviewCardListView extends StatelessWidget {
  const PlaceReviewCardListView({
    super.key,
    required this.reviews,
    required this.reviewCardWidth,
    required this.reviewTextMaxLines,
    this.firstPadding = 0,
    this.padding = 8,
  });

  final List<PlaceDetailsReview> reviews;
  final double reviewCardWidth;
  final int reviewTextMaxLines;
  final double firstPadding;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: reviews.length,
      itemBuilder: (context, index) => Padding(
        padding: index == 0
            ? EdgeInsets.only(left: firstPadding, right: padding)
            : EdgeInsets.symmetric(horizontal: padding),
        child: GestureDetector(
          onTap: () => PlaceReviewsPage.showBottomSheet(
            context: context,
            reviews: reviews,
          ),
          child: PlaceReviewCard(
            review: reviews[index],
            width: reviewCardWidth,
            reviewTextMaxLines: reviewTextMaxLines,
          ),
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
    return LayoutBuilder(builder: (context, constrains) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AppCircleAvatar(imageUrl: review.profilePhotoUrl ?? ''),
          Spaces.w8,
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlaceReviewStars(rating: review.rating),
              SizedBox(
                width: constrains.maxWidth - 48,
                child: Row(
                  children: [
                    Flexible(
                      child: BodySmall(
                        review.authorName,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spaces.w8,
                    BodySmall(
                      review.relativeTimeDescription,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.disabled(context),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      );
    });
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
