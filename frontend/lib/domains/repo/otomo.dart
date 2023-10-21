import 'package:otomo/domains/entities/otomo.dart';

abstract class OtomoRepository {
  Future<void> save(Otomo otomo);
  Future<Otomo> get(String userId);
}
