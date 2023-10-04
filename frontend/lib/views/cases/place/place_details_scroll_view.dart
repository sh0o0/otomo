import 'package:flutter/material.dart';
import 'package:otomo/configs/app_config.dart';
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

  static String _getImageUrl({
    required String photoReference,
    required int maxHeight,
  }) =>
      'https://maps.googleapis.com/maps/api/place/photo?maxheight=$maxHeight&photo_reference=$photoReference&key=${appConfig.googleMapApiKey}';

  Widget _buildWidthSized({
    required BuildContext context,
    required Widget child,
  }) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: child,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // overview
        if (place.editorialSummary?.overview != null)
          _buildWidthSized(
            context: context,
            child: BodyMedium(place.editorialSummary!.overview!),
          ),
        // Ratings and & Reviews
        if (place.reviews != null)
          SizedBox(
            height: 200,
            child: _buildWidthSized(
              context: context,
              child: PageView.builder(
                itemCount: place.reviews!.length,
                itemBuilder: (context, index) => PlaceReviewCard(
                  review: place.reviews![index],
                ),
              ),
            ),
          ),

        const TitleMedium('Details'),
        // phone number
        _buildWidthSized(
          context: context,
          child: Column(
            children: ListTile.divideTiles(context: context, tiles: [
              if (place.formattedPhoneNumber != null)
                ListTile(
                  leading: Icon(Icons.phone),
                  title: BodyMedium(place.formattedPhoneNumber!),
                ),
              if (place.website != null)
                ListTile(
                  leading: Icon(Icons.web),
                  title: BodyMedium(place.website!),
                ),
              if (place.formattedAddress != null)
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: BodyMedium(place.formattedAddress!),
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
            ]).toList(),
          ),
        )
      ],
    );
  }

  static List<Widget> slivers({
    required BuildContext context,
    required PlaceDetails place,
  }) {
    return [
      PlaceSliverAppBar(
        name: place.name ?? '',
        removeTopPadding: true,
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
            child: PlaceImagesPageView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              imageUrls: place.photos!
                  .map((e) => _getImageUrl(
                        photoReference: e.photoReference,
                        maxHeight: 980,
                      ))
                  .toList(),
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

