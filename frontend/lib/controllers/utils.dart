
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/user.dart';
import 'package:otomo/view_models/user.dart';

User? readUser(Ref ref) => ref.read(authProvider);
