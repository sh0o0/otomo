import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:otomo/configs/app_config.dart';

class AppMap extends StatelessWidget {
  const AppMap({
    super.key,
    this.onMapCreated,
    this.cameraOptions,
  });

  final MapCreatedCallback? onMapCreated;
  final CameraOptions? cameraOptions;

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      onMapCreated: onMapCreated,
      resourceOptions: ResourceOptions(
        accessToken: appConfig.mapboxPublicToken,
      ),
      cameraOptions: cameraOptions,
    );
  }
}
