import 'package:flutter/material.dart';
import 'package:otomo/configs/app_config.dart';
import 'package:otomo/entities/place_details.dart' as place_details;
import 'package:otomo/views/bases/images/app_cached_network_image.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({
    super.key,
    required this.place,
  });

  final place_details.PlaceDetails place;

  String _getImageUrl({
    required String photoReference,
    required int maxHeight,
  }) =>
      'https://maps.googleapis.com/maps/api/place/photo?maxheight=$maxHeight&photo_reference=$photoReference&key=${appConfig.googleMapApiKey}';

  Widget _buildTopImages(BuildContext context) {
    final photos = place.photos;
    if (photos == null || photos.isEmpty) {
      final theme = Theme.of(context);
      return Container(
        color: theme.colorScheme.surface,
      );
    }

    return PageView.builder(
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return AppCachedNetworkImage(
          imageUrl: _getImageUrl(
            photoReference: photos[index].photoReference,
            maxHeight: photos[index].height,
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildTop(BuildContext context) {
    final openNow = place.openingHours?.openNow;
    const whiteStyle = TextStyle(color: Colors.white);
    const boldWhiteStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return SizedBox(
      height: 240,
      child: Stack(
        children: [
          _buildTopImages(context),
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLarge(
                  place.name ?? '',
                  style: boldWhiteStyle,
                ),
                Spaces.h8,
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                    Spaces.w4,
                    Flexible(
                      child: BodyMedium(
                        place.formattedAddress ?? '',
                        style: boldWhiteStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                (openNow == null)
                    ? Spaces.zero
                    : BodyMedium(openNow ? 'Open' : 'Closed', style: whiteStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Spaces.h16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              Spaces.w4,
              BodyMedium(place.rating.toString()),
              Spaces.w8,
              BodyMedium('${place.userRatingsTotal} ratings'),
            ],
          ),
        ),
        Spaces.h16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BodyMedium(place.formattedPhoneNumber ?? ''),
        ),
        Spaces.h16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BodyMedium(place.website ?? ''),
        ),
        Spaces.h16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BodyMedium(place.url ?? ''),
        ),
        Spaces.h16,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      child: Column(
        children: [
          _buildTop(context),
          _buildContent(context),
        ],
      ),
    );
  }
}
