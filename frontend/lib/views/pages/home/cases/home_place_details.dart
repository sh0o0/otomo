import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/view_models/place_details.dart';
import 'package:otomo/views/cases/error/error_text.dart';
import 'package:otomo/views/cases/place/place_details.dart';
import 'package:otomo/views/utils/error_library.dart';

class HomePlaceDetails extends ConsumerWidget {
  const HomePlaceDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(placeDetailsProvider);

    if (state.value?.isNotSpecified == true) {
      return const Center(child: Text('No place specified'));
    }

    return state.when(
      data: (value) => PlaceDetails(basic: value.basic!),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: ErrorText(ErrorLibrary.fromAny(error)),
      ),
    );
  }
}
