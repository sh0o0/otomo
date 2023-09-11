import 'package:flutter/material.dart';
import 'package:otomo/views/pages/samples/cases/sample_chat.dart';

class NewHome extends StatefulWidget {
  const NewHome({super.key});

  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  final dController = DraggableScrollableController();

  double _sheetHeight = 100;

  @override
  void initState() {
    dController.addListener(() {
      final mediaSize = MediaQuery.of(context).size;
      setState(() {
        _sheetHeight = mediaSize.height * dController.size;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Placeholder(),
          DraggableScrollableSheet(
            maxChildSize: 0.9,
            initialChildSize: 0.1,
            minChildSize: 0.1,
            controller: dController,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Container(
                  color: Colors.amber,
                  height: _sheetHeight,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        color: Colors.red,
                      ),
                      const Expanded(
                        child: SampleChat(),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
    // return HomeWithDraggableBottomSheet(
    //   bottomSheetBar: Container(color: Colors.red),
    //   bottomSheet: const SampleChat(),
    //   child: const Placeholder(),
    // );
  }
}
