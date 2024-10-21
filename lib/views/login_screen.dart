import 'package:app_test/componants/custom_button.dart';
import 'package:app_test/providers/auth_controller_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: const Key('emailField'),
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              key: const Key('passwordField'),
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            Consumer(builder: (context, ref, _) {
              final loginState = ref.watch(loginController);
              return loginState.when(
                data: (user) => CustomButton(
                  onPressed: () {
                    ref.read(loginController.notifier).login(
                          phone: emailController.text,
                          password: passwordController.text,
                        );
                  },
                ),
                error: (error, stackTrace) {
                  return ErrorDisplay(
                    errorMessage: error.toString(),
                    onRetry: () {
                      ref.read(loginController.notifier).login(
                            phone: emailController.text,
                            password: passwordController.text,
                          );
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(),
              );
            }),
            TextButton(
              key: const Key('signUpButton'),
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
