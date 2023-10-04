import 'package:flutter/material.dart';
import 'package:otomo/views/bases/texts/texts.dart';

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
            .map((type) => typeMappings[type])
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

const typeMappings = {
  // "administrative_area_level_1": "一級行政区域",
  // "administrative_area_level_2": "二級行政区域",
  // "administrative_area_level_3": "三級行政区域",
  // "administrative_area_level_4": "四級行政区域",
  // "administrative_area_level_5": "五級行政区域",
  // "administrative_area_level_6": "六級行政区域",
  // "administrative_area_level_7": "七級行政区域",
  "archipelago": "群島",
  // "colloquial_area": "俗語地域",
  "continent": "大陸",
  "country": "国",
  "establishment": "施設",
  "finance": "金融",
  "floor": "フロア",
  "food": "食品",
  "general_contractor": "総合請負業者",
  "geocode": "ジオコード",
  "health": "健康",
  "intersection": "交差点",
  "landmark": "ランドマーク",
  "locality": "地域",
  "natural_feature": "自然地形",
  "neighborhood": "近隣地域",
  "place_of_worship": "礼拝所",
  // "plus_code": "プラスコード",
  "point_of_interest": "興味",
  "political": "政治",
  "post_box": "郵便ポスト",
  // "postal_code": "郵便番号",
  // "postal_code_prefix": "郵便番号のプレフィックス",
  // "postal_code_suffix": "郵便番号のサフィックス",
  // "postal_town": "郵便町",
  "premise": "敷地",
  "room": "部屋",
  "route": "ルート",
  "street_address": "住所",
  "street_number": "番地",
  "sublocality": "地下地域",
  // "sublocality_level_1": "地下地域レベル1",
  // "sublocality_level_2": "地下地域レベル2",
  // "sublocality_level_3": "地下地域レベル3",
  // "sublocality_level_4": "地下地域レベル4",
  // "sublocality_level_5": "地下地域レベル5",
  // "subpremise": "サブプレミス",
  "town_square": "広場"
};
