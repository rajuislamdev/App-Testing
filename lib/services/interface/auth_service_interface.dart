import 'package:app_test/models/request/user.dart';
import 'package:dio/dio.dart';

abstract class AuthServiceInterface {
  Future<Response> login({required String phone, required String password});
  Future<Response> register({required User user});
}
