import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/place_details.dart';
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

  Widget _buildContent(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeDetailsProvider);

    if (state.value?.isNotSpecified == true) {
      return const Center(child: Text('No place specified'));
    }

    return state.when(
      data: (value) => GooglePlaceDetails(place: value.place!),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
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
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                child: _buildContent(context, ref),
              ),
            ],
          ),
        );
      },
    );
  }
}
