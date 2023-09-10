import 'package:geolocator/geolocator.dart' as geo;
import 'package:injectable/injectable.dart';
import 'package:otomo/abstracts/location_controller.dart';
import 'package:otomo/models/latlng.dart';
import 'package:otomo/models/position.dart';

@Injectable(as: LocationController)
class LocationControllerImpl implements LocationController {

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    geo.LocationPermission permission;

    serviceEnabled = await geo.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await geo.Geolocator.checkPermission();
    if (permission == geo.LocationPermission.denied) {
      permission = await geo.Geolocator.requestPermission();
      if (permission == geo.LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == geo.LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final pos = await geo.Geolocator.getCurrentPosition();
    return _toPosition(pos);
  }

  Position _toPosition(geo.Position pos) {
    return Position(
      latlng: AppLatLng(latitude: pos.latitude, longitude: pos.longitude),
    );
  }
}
