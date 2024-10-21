import 'package:app_test/controllers/auth_controller.dart';
import 'package:app_test/models/response/user.dart' as response_model;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginController =
    StateNotifierProvider<LoginController, AsyncValue<response_model.User?>>(
        (ref) {
  return LoginController();
});

final registerController =
    StateNotifierProvider<RegisterController, AsyncValue<response_model.User?>>(
        (ref) {
  return RegisterController();
});
