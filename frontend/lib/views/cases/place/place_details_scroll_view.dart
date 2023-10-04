import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
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
  }) {
    return [
      PlaceSliverAppBar(
        name: place.name ?? '',
        removeTopSafePadding: true,
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
        child: Column(
          children: [
            const HeadlineSmall('Details', style: TextStyles.bold),
            Spaces.h8,
          ],
        ),
      ),
      SliverList.list(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            if (place.formattedPhoneNumber != null)
              ListTile(
                leading: Icon(Icons.phone),
                title: BodyMedium(place.formattedPhoneNumber ?? ''),
              ),
            if (place.website != null)
              ListTile(
                leading: Icon(Icons.web),
                title: BodyMedium(place.website ?? ''),
              ),
            if (place.formattedAddress != null)
              ListTile(
                leading: Icon(Icons.location_on),
                title: BodyMedium(place.formattedAddress ?? ''),
              ),
            if (place.currentOpeningHours != null)
              ExpansionTile(
                leading: Icon(Icons.access_time),
                title: BodyMedium('Opening Hours'),
                children: [
                  for (var period in place.currentOpeningHours!.periods!)
                    ListTile(
                      title: BodyMedium(period.open.time),
                      subtitle: BodyMedium(period.open.day.toString()),
                    ),
                ],
              ),
          ],
        ).toList(),
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
