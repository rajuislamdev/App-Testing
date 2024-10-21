import 'package:app_test/models/request/user.dart';
import 'package:app_test/models/response/user.dart' as response_model;
import 'package:app_test/repositories/interface/auth_repository_interface.dart';
import 'package:app_test/services/auth_service.dart';
import 'package:app_test/services/request_handler.dart';
import 'package:dio/dio.dart';

class AuthRepository implements AuthRepositoryInterface {
  // singleton instance
  static final AuthRepository _instance = AuthRepository._internal();

  factory AuthRepository() => _instance;

  AuthRepository._internal();

  @override
  Future<response_model.User> login(
      {required String phone, required String password}) async {
    try {
      final response =
          await AuthService().login(phone: phone, password: password);
      if (response.statusCode == 200) {
        return response_model.User.fromMap(response.data);
      }
      throw Exception(response.data['message']);
    } on DioException catch (e) {
      throw Exception(ApiInterceptors.handleError(e));
    }
  }

  @override
  Future<response_model.User> register({required User user}) async {
    try {
      final response = await AuthService().register(user: user);
      if (response.statusCode == 200) {
        return response_model.User.fromMap(response.data);
      }
      throw Exception(response.data['message']);
    } on DioException catch (e) {
      throw Exception(ApiInterceptors.handleError(e));
    }
  }
}
