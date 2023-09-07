import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:otomo/configs/app_config.dart';

class AppMap extends StatelessWidget {
  const AppMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      resourceOptions: ResourceOptions(
        accessToken: appConfig.mapboxPublicToken,
      ),
    );
  }
}
