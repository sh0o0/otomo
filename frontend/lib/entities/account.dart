import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required String uid,
    String? email,
    required AuthProvider authProvider,
  }) = _Account;
}



enum AuthProvider {
  google,
  apple,
}
