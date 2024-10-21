import 'package:flutter/material.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up Success')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => const Text('Welcome to the Flutter app!'),
          ),
        ),
      ),
    );
  }
}
