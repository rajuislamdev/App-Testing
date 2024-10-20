import 'package:http/http.dart';

abstract class AuthServiceInterface {
  Future<Response> login(String email, String password);
  Future<Response> register(String email,  String password);
}
