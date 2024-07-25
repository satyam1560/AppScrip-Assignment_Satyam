import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_address.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';
@freezed
class User with _$User {
  const factory User({
    required String name,
    required String email,
    required String phone,
    required String username,
    required Address address,
  }) = _User;

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
