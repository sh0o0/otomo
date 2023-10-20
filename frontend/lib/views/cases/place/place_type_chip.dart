import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/utils/localizations.dart';

class PlaceTypeChip extends StatelessWidget {
  const PlaceTypeChip({
    super.key,
    required this.typeName,
  });

  final String typeName;

  static Widget wrap({
    required BuildContext context,
    required List<String> types,
  }) =>
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: types
            .map((type) => _getTypeMappings(context)[type])
            .nonNulls
            .map((name) => PlaceTypeChip(typeName: name))
            .toList(),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: BodySmall(
        typeName,
        style: TextStyle(color: color),
      ),
    );
  }
}

Map<String, String> _getTypeMappings(BuildContext context) => {
      "archipelago": context.l10n.placeTypeArchipelago,
      "continent": context.l10n.placeTypeContinent,
      "country": context.l10n.placeTypeCountry,
      "establishment": context.l10n.placeTypeEstablishment,
      "finance": context.l10n.placeTypeFinance,
      "floor": context.l10n.placeTypeFloor,
      "food": context.l10n.placeTypeFood,
      "general_contractor": context.l10n.placeTypeGeneralContractor,
      "health": context.l10n.placeTypeHealth,
      "intersection": context.l10n.placeTypeIntersection,
      "landmark": context.l10n.placeTypeLandmark,
      "locality": context.l10n.placeTypeLocality,
      "natural_feature": context.l10n.placeTypeNaturalFeature,
      "neighborhood": context.l10n.placeTypeNeighborhood,
      "place_of_worship": context.l10n.placeTypePlaceOfWorship,
      "point_of_interest": context.l10n.placeTypePointOfInterest,
      "political": context.l10n.placeTypePolitical,
      "post_box": context.l10n.placeTypePostBox,
      "premise": context.l10n.placeTypePremise,
      "room": context.l10n.placeTypeRoom,
      "route": context.l10n.placeTypeRoute,
      "street_address": context.l10n.placeTypeStreetAddress,
      "street_number": context.l10n.placeTypeStreetNumber,
      "sublocality": context.l10n.placeTypeSublocality,
      "town_square": context.l10n.placeTypeTownSquare,
    };
