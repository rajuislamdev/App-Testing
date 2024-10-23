import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SnackbarHelper {
  static void showSnackbar({
    required BuildContext context,
    required String message,
    bool isSuccess = true,
  }) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: isSuccess ? Colors.green : Colors.red,
          dismissDirection: DismissDirection.startToEnd,
          content: Text(
            message,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
    });
  }
}
