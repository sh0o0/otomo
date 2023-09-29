
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:otomo/entities/account.dart';
import 'package:otomo/view_models/user.dart';

Account? readAccount(Ref ref) => ref.read(accountProvider);
