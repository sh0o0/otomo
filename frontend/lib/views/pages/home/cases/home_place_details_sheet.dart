import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/constants/screen_names.dart';
import 'package:otomo/tools/analytics.dart';
import 'package:otomo/view_models/place_details.dart';
import 'package:otomo/views/bases/sheets/sheet_form.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/cases/photo/google_place_photo.dart';
import 'package:otomo/views/cases/photo/photo_gallery_screen.dart';
import 'package:otomo/views/cases/place/place_details_scroll_view.dart';
import 'package:otomo/views/cases/place/place_reviews_sheet.dart';
import 'package:otomo/views/utils/error_library.dart';

class HomePlaceDetailsSheet extends HookConsumerWidget {
  const HomePlaceDetailsSheet({
    super.key,
    required this.maxSheetSize,
    required this.minSheetSize,
    required this.initialSheetSize,
    this.snap = false,
    this.snapSizes,
    required this.sheetController,
  });

  final double maxSheetSize;
  final double minSheetSize;
  final double initialSheetSize;
  final bool snap;
  final List<double>? snapSizes;
  final DraggableScrollableController sheetController;

  List<Widget> _buildSlivers({
    required BuildContext context,
    required WidgetRef ref,
    required ScrollController scrollController,
  }) {
    final state = ref.watch(placeDetailsProvider);
    final theme = Theme.of(context);

    if (state.value?.isNotSpecified == true) {
      return [
        _SingleContent(
          child: Icon(
            Icons.pin_drop_rounded,
            size: 80,
            color: theme.colorScheme.secondary,
          ),
        )
      ];
    }

    return state.when(
      data: (value) => PlaceDetailsScrollView.slivers(
        context: context,
        place: value.place!,
        removeTopPadding: true,
        bottomPadding: true,
        onClosePressed: () => sheetController.animateTo(
          minSheetSize,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOutExpo,
        ),
        onReviewCardTap: (context, index) => PlaceReviewsSheet.show(
          context: context,
          reviews: value.place?.reviews ?? [],
          initialIndex: index,
        ),
        onPhotoTap: (context, index) => PhotoGalleryScreen.showFullscreenDialog(
            context: context,
            initialIndex: index,
            images: value.place?.photos
                    ?.map(
                      (e) => GooglePlacePhoto.provider(e.photoReference),
                    )
                    .toList() ??
                []),
      ),
      loading: () => [
        const _SingleContent(
          child: CircularProgressIndicator(),
        )
      ],
      error: (error, _) => [
        _SingleContent(
          child: ErrorText(ErrorLibrary.fromAny(error)),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      void listener() {
        Analytics.logDraggableScrollableSheet(
          screenName: ScreenNames.placeDetailsSheet.name,
          currentSize: sheetController.size,
          maxSize: maxSheetSize,
          minSize: minSheetSize,
          snapSizes: snapSizes ?? [],
        );
      }

      sheetController.addListener(listener);
      return () => sheetController.removeListener(listener);
    }, const []);

    return DraggableScrollableSheet(
      initialChildSize: initialSheetSize,
      maxChildSize: maxSheetSize,
      minChildSize: minSheetSize,
      snap: snap,
      snapSizes: snapSizes,
      controller: sheetController,
      builder: (context, controller) {
        return SheetForm(
          child: CustomScrollView(
            controller: controller,
            slivers: _buildSlivers(
              context: context,
              ref: ref,
              scrollController: controller,
            ),
          ),
        );
      },
    );
  }
}

class _SingleContent extends StatelessWidget {
  const _SingleContent({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 40),
      sliver: SliverToBoxAdapter(child: Center(child: child)),
    );
  }
}
