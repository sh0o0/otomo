import 'package:flutter/material.dart';
import 'package:otomo/views/cases/home/home_with_draggable_bottom_sheet.dart';

class NewHome extends StatelessWidget {
  const NewHome({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeWithDraggableBottomSheet(
      bottomSheetBar: Container(color: Colors.red),
      bottomSheet: Container(color: Colors.blue),
      child: const Placeholder(),
    );
  }
}
