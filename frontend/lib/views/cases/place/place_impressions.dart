import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart' as place_details;
import 'package:otomo/views/cases/place/place_open_now.dart';
import 'package:otomo/views/cases/place/place_rating.dart';

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
    return Column(
      children: [
        const Divider(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _impressions(context: context)
              .asMap()
              .entries
              .map((entry) => Container(
                    padding: entry.key == 0
                        ? const EdgeInsets.only(right: 16)
                        : const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Theme.of(context).colorScheme.outlineVariant,
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
