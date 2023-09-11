import 'package:flutter/material.dart';
import 'package:otomo/views/cases/home/home_with_draggable_scrollable_bottom_sheet.dart';
import 'package:otomo/views/pages/samples/cases/sample_chat.dart';

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWithDraggableScrollableBottomSheet(
      snap: true,
      snapSizes: const [0.5],
      bottomSheetBar: Container(color: Colors.red),
      bottomSheet: const SampleChat(),
      child: const Placeholder(),
    );
  }
}
