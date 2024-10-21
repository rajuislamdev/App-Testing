import 'package:app_test/models/request/user.dart';
import 'package:app_test/models/response/user.dart' as response_model;
import 'package:app_test/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<AsyncValue<response_model.User?>> {
  LoginController() : super(const AsyncData(null));

  Future<void> login({required String phone, required String password}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await AuthRepository().login(phone: phone, password: password);
    });
  }
}

class RegisterController
    extends StateNotifier<AsyncValue<response_model.User?>> {
  RegisterController() : super(const AsyncData(null));

  Future<void> register({required User user}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await AuthRepository().register(user: user);
    });
  }
}
