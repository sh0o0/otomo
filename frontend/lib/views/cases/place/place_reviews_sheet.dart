import 'package:flutter/material.dart';
import 'package:otomo/domains/entities/place_details.dart';
import 'package:otomo/views/bases/sheets/sheet_form.dart';
import 'package:otomo/views/cases/place/place_review_list_view.dart';

class PlaceReviewsSheet extends StatelessWidget {
  const PlaceReviewsSheet({
    super.key,
    required this.reviews,
    this.initialIndex,
  });

  final List<PlaceDetailsReview> reviews;
  final int? initialIndex;

  static Future<void> show({
    required BuildContext context,
    required List<PlaceDetailsReview> reviews,
    int? initialIndex,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: true,
      builder: (context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: PlaceReviewsSheet(
          reviews: reviews,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SheetForm(
      shadow: false,
      child: PlaceReviewListView(
        reviews: reviews,
        initialIndex: initialIndex,
      ),
    );
  }
}
