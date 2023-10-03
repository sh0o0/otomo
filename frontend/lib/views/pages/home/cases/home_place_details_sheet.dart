import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/place_details.dart';
import 'package:otomo/views/bases/sheets/sheet_form.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/cases/place/google_place_details.dart';
import 'package:otomo/views/utils/error_library.dart';

class HomePlaceDetailsSheet extends ConsumerWidget {
  const HomePlaceDetailsSheet({
    super.key,
    required this.maxSheetSize,
    required this.minSheetSize,
    required this.initialSheetSize,
    this.snap = false,
    this.snapSizes,
    this.sheetController,
  });

  final double maxSheetSize;
  final double minSheetSize;
  final double initialSheetSize;
  final bool snap;
  final List<double>? snapSizes;
  final DraggableScrollableController? sheetController;

  Widget _buildContent({
    required BuildContext context,
    required WidgetRef ref,
    required ScrollController scrollController,
  }) {
    final state = ref.watch(placeDetailsProvider);
    final theme = Theme.of(context);

    if (state.value?.isNotSpecified == true) {
      return _SingleContent(
        scrollController: scrollController,
        child: Icon(
          Icons.pin_drop_rounded,
          size: 80,
          color: theme.colorScheme.secondary,
        ),
      );
    }

    return state.when(
      data: (value) => GooglePlaceDetails(
        scrollController: scrollController,
        place: value.place!,
        removeTopPadding: true,
      ),
      loading: () => _SingleContent(
        scrollController: scrollController,
        child: const CircularProgressIndicator(),
      ),
      error: (error, _) => _SingleContent(
        scrollController: scrollController,
        child: ErrorText(ErrorLibrary.fromAny(error)),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: initialSheetSize,
      maxChildSize: maxSheetSize,
      minChildSize: minSheetSize,
      snap: snap,
      snapSizes: snapSizes,
      controller: sheetController,
      builder: (context, controller) {
        return SheetForm(
          child: _buildContent(
            context: context,
            ref: ref,
            scrollController: controller,
          ),
        );
      },
    );
  }
}

class _SingleContent extends StatelessWidget {
  const _SingleContent({
    required this.scrollController,
    required this.child,
  });

  final ScrollController scrollController;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(child: child),
      ),
    );
  }
}
