import 'package:flutter/material.dart';
import 'package:otomo/entities/place_details.dart';
import 'package:otomo/views/bases/sheets/sheet_form.dart';
import 'package:otomo/views/cases/place/place_review_list_view.dart';

class PlaceReviewsPage extends StatelessWidget {
  const PlaceReviewsPage({
    super.key,
    required this.reviews,
  });

  final List<PlaceDetailsReview> reviews;

  static Future<void> showBottomSheet({
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
        body: SheetForm(
          shadow: false,
          child: PlaceReviewListView(
            reviews: reviews,
            initialIndex: initialIndex,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlaceReviewListView(reviews: reviews),
    );
  }
}
