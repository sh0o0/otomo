import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/sheets/sheet_form.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/place/place_review_card.dart';

class PlaceReviewsPage extends StatelessWidget {
  const PlaceReviewsPage({
    super.key,
    required this.reviews,
  });

  final List<PlaceDetailsReview> reviews;

  static Future<void> show({
    required BuildContext context,
    required List<PlaceDetailsReview> reviews,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => PlaceReviewsPage(
        reviews: reviews,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tiles = ListTile.divideTiles(
      context: context,
      tiles: [
        for (final review in reviews)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: PlaceReviewListTile(review: review),
          ),
      ],
    ).toList();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SheetForm(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: Align(
                alignment: Alignment.centerLeft,
                child: HeadlineMedium('Reviews'),
              ),
              automaticallyImplyLeading: false,
              shape: Border(bottom: BorderSide(color: theme.dividerColor)),
              actions: [
                IconButton(
                  icon: const Icon(Icons.close_rounded),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return tiles[index];
                },
                childCount: reviews.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
