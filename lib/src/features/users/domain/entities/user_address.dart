import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_address.freezed.dart';
part 'user_address.g.dart';
@freezed
class Address with _$Address {
  const factory Address({
    required String street,
    required String city,
    required String zipcode,
  }) = _Address;

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
