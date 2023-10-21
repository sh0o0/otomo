import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/domains/repo/otomo.dart';

@injectable
class OtomoControllerImpl {
  const OtomoControllerImpl(this._repository);

  final OtomoRepository _repository;

  Future<void> save(Otomo otomo) => _repository.save(otomo);
  Future<Otomo> get(String userId) => _repository.get(userId);
}
