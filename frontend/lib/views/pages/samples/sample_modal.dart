import 'package:flutter/material.dart';
import 'package:otomo/tools/logger.dart';

class SampleModal extends StatefulWidget {
  const SampleModal({Key? key}) : super(key: key);

  @override
  State<SampleModal> createState() => _SampleModalState();
}

class _SampleModalState extends State<SampleModal> {
  final double _headerHeight = 100.0;
  final double _maxHeight = 600.0;
  // bool _isDragUp = true;
  double _bodyHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child: Text("Custom Scrollable Bottom Sheet ")),
          Positioned(
            bottom: 0.0,
            child: AnimatedContainer(
              constraints: BoxConstraints(
                maxHeight: _maxHeight,
                minHeight: _headerHeight,
              ),
              duration: const Duration(milliseconds: 10),
              curve: Curves.easeInOut,
              height: _bodyHeight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onVerticalDragUpdate: (DragUpdateDetails data) {
                      logger.debug('drag update');
                      double _draggedAmount =
                          _size.height - data.globalPosition.dy;
                      setState(() {
                        _bodyHeight = _draggedAmount;
                      });
                      logger.debug(this._bodyHeight.toString());
                    },
                    onVerticalDragEnd: (DragEndDetails data) {},
                    child: Container(
                      width: _size.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2.0,
                              blurRadius: 4.0),
                        ],
                      ),
                      height: _headerHeight,
                      child: Text("drag me"),
                    ),
                  ),
                  SizedBox(
                    width: _size.width,
                    height: _bodyHeight,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (itemBuilder, index) {
                    return ListTile(
                      title: Text("item $index"),
                    );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
