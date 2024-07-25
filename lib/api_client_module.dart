import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:satyam_assignment/injectible.dart';
import 'package:satyam_assignment/src/core/constants/api_constant.dart';
import 'package:satyam_assignment/src/core/network/api_client.dart';

@module
abstract class APIClientModule {
  @Named('baseUrl')
  String get baseUrl => APIConstants.baseUrl;

  @singleton
  ApiClient apiClient() {
    if (!getIt.isRegistered<Dio>()) {
      getIt.registerSingleton<Dio>(Dio());
    }
    final dioInstance = getIt<Dio>();
    dioInstance.options.baseUrl = baseUrl;

    final apiClient = ApiClient(dioInstance, baseUrl: baseUrl);
    return apiClient;
  }
}
