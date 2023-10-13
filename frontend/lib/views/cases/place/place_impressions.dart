import 'package:flutter/material.dart';
import 'package:otomo/configs/app_themes.dart';
import 'package:otomo/domains/entities/place_details.dart' as place_details;
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';

class PlaceImpressions extends StatelessWidget {
  const PlaceImpressions({super.key, this.openingHours, this.rating});

  final place_details.PlaceDetailsOpeningHours? openingHours;
  final double? rating;

  List<Widget> _impressions({required BuildContext context}) {
    return [
      if (openingHours?.openNow != null)
        PlaceOpenNow(openNow: openingHours!.openNow!),
      if (rating != null) PlaceRating(rating: rating!),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final impressions = _impressions(context: context);
    if (impressions.isEmpty) {
      return Spaces.zero;
    }

    return Column(
      children: [
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: impressions
              .asMap()
              .entries
              .map((entry) => Container(
                    padding: entry.key == 0
                        ? const EdgeInsets.only(right: 16)
                        : const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    child: entry.value,
                  ))
              .toList(),
        ),
        const Divider(),
      ],
    );
  }
}

class PlaceOpenNow extends StatelessWidget {
  const PlaceOpenNow({
    super.key,
    required this.openNow,
  });

  final bool openNow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appTheme = theme.extension<AppTheme>()!;
    return Column(
      children: [
        const TitleSmall('営業時間', style: TextStyles.bold),
        TitleMedium(
          openNow ? '営業中' : '営業時間外',
          style: TextStyle(
            color: openNow ? appTheme.activeColor : appTheme.dangerColor,
          ),
        )
      ],
    );
  }
}

class PlaceRating extends StatelessWidget {
  const PlaceRating({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSmall('評価', style: TextStyles.bold),
        TitleMedium(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
