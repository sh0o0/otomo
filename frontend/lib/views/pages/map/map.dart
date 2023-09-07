import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:otomo/tools/logger.dart';
import 'package:otomo/views/cases/map/app_map.dart';

class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Map();
  }
}

class _Map extends StatefulWidget {
  const _Map({super.key});

  @override
  State<_Map> createState() => __MapState();
}

class __MapState extends State<_Map> {
  late final MapboxMap _controller;
  PointAnnotationManager? _pointAnnotationManager;

  void _locale() {
    _controller.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        locationPuck: LocationPuck(
          locationPuck3D: LocationPuck3D(
            modelUri:
                "https://raw.githubusercontent.com/KhronosGroup/glTF-Sample-Models/master/2.0/Duck/glTF-Embedded/Duck.gltf",
          ),
        ),
      ),
    );
  }

  void _setCamera() {
    _controller.flyTo(
        CameraOptions(
          center: Point(coordinates: Position(-80.1263, 25.7845)).toJson(),
          zoom: 12.0,
        ),
        MapAnimationOptions(
          duration: 2000,
          startDelay: 0,
        ));
  }

  void _markers() {
    _controller.annotations
      ..createPointAnnotationManager().then((value) async {
        _pointAnnotationManager = value;

        final ByteData bytes =
            await rootBundle.load('assets/symbols/custom-icon.png');
        final Uint8List list = bytes.buffer.asUint8List();
        var options = <PointAnnotationOptions>[];
        for (var i = 0; i < 5; i++) {
          options.add(
            PointAnnotationOptions(
              geometry: createRandomPoint().toJson(),
              image: list,
            ),
          );
        }
        _pointAnnotationManager?.createMulti(options);
        _pointAnnotationManager
            ?.addOnPointAnnotationClickListener(AnnotationClickListener());
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppMap(
          onMapCreated: (controller) {
            _controller = controller;
            _locale();
            _markers();
          },
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              _locale();
              _markers();
              _setCamera();
            },
            child: const Icon(Icons.location_searching),
          ),
        ),
      ],
    );
  }
}

Point createRandomPoint() {
  return Point(coordinates: createRandomPosition());
}

Position createRandomPosition() {
  var random = Random();
  return Position(random.nextDouble() * -360.0 + 180.0,
      random.nextDouble() * -180.0 + 90.0);
}

class AnnotationClickListener extends OnPointAnnotationClickListener {
  @override
  void onPointAnnotationClick(PointAnnotation annotation) {
    logger.debug("onAnnotationClick, id: ${annotation.id}");
  }
}
