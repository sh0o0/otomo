import 'package:flutter/material.dart';
import 'package:otomo/domains/entities/place_details.dart';
import 'package:otomo/views/bases/app_bars/app_bar_title.dart';
import 'package:otomo/views/bases/layouts/edge_layout.dart';
import 'package:otomo/views/bases/spaces/spaces.dart';
import 'package:otomo/views/bases/texts/texts.dart';
import 'package:otomo/views/cases/place/place_review_card.dart';
import 'package:otomo/views/utils/localizations.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class PlaceReviewListView extends StatefulWidget {
  const PlaceReviewListView({
    super.key,
    required this.reviews,
    this.initialIndex,
    this.scrollController,
  });

  final List<PlaceDetailsReview> reviews;
  final int? initialIndex;
  final AutoScrollController? scrollController;

  @override
  State<PlaceReviewListView> createState() => _PlaceReviewListViewState();
}

class _PlaceReviewListViewState extends State<PlaceReviewListView> {
  late final AutoScrollController _scrollController;

  @override
  void initState() {
    _scrollController = widget.scrollController ?? AutoScrollController();
    if (widget.initialIndex != null) {
      _scrollController.scrollToIndex(
        widget.initialIndex!,
        preferPosition: AutoScrollPosition.begin,
      );
    }
    super.initState();
  }

  Widget _review({
    required BuildContext context,
    required int index,
    required PlaceDetailsReview review,
  }) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _scrollController,
      index: index,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: PlaceReviewListTile(review: review),
      ),
    );
  }

  List<Widget> _slivers({
    required BuildContext context,
    required List<PlaceDetailsReview> reviews,
  }) {
    final tiles = ListTile.divideTiles(
      context: context,
      tiles: [
        for (final kv in reviews.asMap().entries)
          _review(context: context, index: kv.key, review: kv.value)
      ],
    ).toList();
    return [
      SliverAppBar(
        automaticallyImplyLeading: false,
        pinned: true,
        title: AppBarTitle(title: context.l10n.placeReviews),
        actions: const [CloseButton()],
      ),
      EdgeLayout(
        top: 0.0,
        sliver: true,
        child: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => tiles[index],
            childCount: reviews.length,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: _slivers(
        context: context,
        reviews: widget.reviews,
      ),
    );
  }
}

class PlaceReviewListTile extends StatelessWidget {
  const PlaceReviewListTile({
    super.key,
    required this.review,
  });

  final PlaceDetailsReview review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlaceReviewProfile(review: review),
        Spaces.h8,
        BodyMedium(review.text ?? ''),
      ],
    );
  }
}
