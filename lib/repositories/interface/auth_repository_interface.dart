import 'package:app_test/models/request/user.dart';
import 'package:app_test/models/response/user.dart' as response_model;

abstract class AuthRepositoryInterface {
  Future<response_model.User> login(
      {required String phone, required String password});
  Future<response_model.User> register({required User user});
}
