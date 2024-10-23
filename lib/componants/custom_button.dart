import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
