
import 'package:otomo/models/position.dart';

abstract class LocationController {
  Future<Position> determinePosition();
}
