import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AuthController {
  AuthController(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<String?> getIdToken() async {
    return _firebaseAuth.currentUser?.getIdToken();
  }
}
