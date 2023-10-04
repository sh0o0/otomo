import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/place/place_details_view.dart';
import 'package:otomo/views/cases/place/place_images_page_view.dart';
import 'package:otomo/views/cases/place/place_impressions.dart';
import 'package:otomo/views/cases/place/place_review_card.dart';
import 'package:otomo/views/cases/place/place_sliver_app_bar.dart';
import 'package:otomo/views/cases/place/place_type_chip.dart';

class PlaceDetailsScrollView extends StatelessWidget {
  const PlaceDetailsScrollView({
    super.key,
    required this.place,
    this.scrollController,
    this.removeTopPadding = false,
    this.onClosePressed,
  });

  final PlaceDetails place;
  final ScrollController? scrollController;
  final bool removeTopPadding;
  final VoidCallback? onClosePressed;

  static List<Widget> slivers({
    required BuildContext context,
    required PlaceDetails place,
    VoidCallback? onClosePressed,
  }) {
    return [
      PlaceSliverAppBar(
        name: place.name ?? '',
        removeTopSafePadding: true,
        onClosePressed: onClosePressed,
      ),
      const SliverToBoxAdapter(child: Spaces.h16),
      SliverToBoxAdapter(
        child: PlaceTypeChip.wrap(context: context, types: place.types ?? []),
      ),
      const SliverToBoxAdapter(child: Spaces.h8),
      SliverToBoxAdapter(
        child: PlaceImpressions(
          openingHours: place.openingHours,
          rating: place.rating,
        ),
      ),
      const SliverToBoxAdapter(child: Spaces.h8),
      if (place.photos != null)
        SliverToBoxAdapter(
          child: SizedBox(
            height: 240,
            child: PlacePhotosPageView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              photos: place.photos!.toList(),
            ),
          ),
        ),
      const SliverToBoxAdapter(child: Spaces.h8),
      SliverToBoxAdapter(
        child: BodyMedium(place.editorialSummary?.overview ?? ''),
      ),
      const SliverToBoxAdapter(child: Spaces.h16),
      if (place.reviews != null)
        SliverToBoxAdapter(
          child: PlaceRatingsAndReviews(reviews: place.reviews!),
        ),
      const SliverToBoxAdapter(child: Spaces.h16),
      SliverToBoxAdapter(
        child: PlaceDetailsView(place: place),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: slivers(context: context, place: place),
    );
  }
}
