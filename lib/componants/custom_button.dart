import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('CustomButton'),
      onPressed: onPressed,
      child: const Text('Login'),
    );
  }
}

class ErrorDisplay extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const ErrorDisplay(
      {super.key, required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
        ElevatedButton(
          key: const Key('loginButton'),
          onPressed: onRetry,
          child: const Text('Retry'),
        ),
      ],
    );
  }
}
