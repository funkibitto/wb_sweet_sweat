import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String privKey,
    required String email,
    required String name,
    String? profileImage,
  }) = _User;
}
