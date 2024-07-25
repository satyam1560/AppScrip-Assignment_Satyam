import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:satyam_assignment/src/features/users/domain/entities/user_entity.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/users')
  Future<List<User>> getUsers();


}
