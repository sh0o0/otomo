import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:otomo/domains/entities/otomo.dart';
import 'package:otomo/domains/repo/otomo.dart';

@Injectable(as: OtomoRepository)
class OtomoRepositoryImpl implements OtomoRepository {
  const OtomoRepositoryImpl(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<Otomo> get(String userId) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> save(Otomo otomo) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
