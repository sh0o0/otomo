import 'package:otomo/domains/entities/user.dart';

abstract class UserRepository {
  Future<void> save(User user);
  Future<User> get(String userId);
}
