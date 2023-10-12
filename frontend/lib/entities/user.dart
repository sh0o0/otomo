import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otomo/entities/date.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  @JsonSerializable(explicitToJson: true)
  const factory User({
    required String id,
    required Date birthday,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  int get age {
    int result = DateTime.now().year - birthday.year;
    if (DateTime.now().month < birthday.month ||
        (DateTime.now().month == birthday.month &&
            DateTime.now().day < birthday.day)) {
      result--;
    }
    return result;
  }
}
