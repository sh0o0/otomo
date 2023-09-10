import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:otomo/entities/lat_lng.dart';

class Converter {
  Converter._();

  static LatLng latLngToGoogle(AppLatLng ll) {
    return LatLng(ll.latitude, ll.longitude);
  }
}
