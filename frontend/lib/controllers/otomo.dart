import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/domains/repo/otomo.dart';
import 'package:otomo/tools/logger.dart';

@injectable
class OtomoControllerImpl {
  const OtomoControllerImpl(this._repository);

  final OtomoRepository _repository;

  Future<void> save(Otomo otomo) {
    logger.info('OtomoControllerImpl.save');
    return _repository.save(otomo);
  }

  Future<Otomo> get(String userId) {
    logger.info('OtomoControllerImpl.get');
    return _repository.get(userId);
  }
}
