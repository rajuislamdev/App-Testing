import 'package:app_test/config/app_constants.dart';
import 'package:app_test/models/request/user.dart';
import 'package:app_test/services/api_client.dart';
import 'package:app_test/services/interface/auth_service_interface.dart';
import 'package:dio/dio.dart';

class AuthService implements AuthServiceInterface {
  // singleton instance
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;

  AuthService._internal();
  @override
  Future<Response> login(
      {required String phone, required String password}) async {
    final response = await ApiClient()
        .post(AppConstants.login, data: {'phone': phone, 'password': password});
    return response;
  }

  @override
  Future<Response> register({required User user}) async {
    final response = await ApiClient().post(AppConstants.signUp, data: user);
    return response;
  }
}
