import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              key: const Key('signUpEmailField'),
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              key: const Key('signUpPasswordField'),
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              key: const Key('signUpSubmitButton'),
              onPressed: () {
                // Simulate sign-up success
                Navigator.pushReplacementNamed(context, '/third');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
