import 'package:injectable/injectable.dart';
import 'package:satyam_assignment/src/core/network/api_client.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';

@singleton
class UserDataSource {
  UserDataSource({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<User>> getUsers() async {
    print(_apiClient.getUsers());
    return _apiClient.getUsers();
  }
}
