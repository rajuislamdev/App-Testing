import 'package:app_test/componants/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String negativeText;
  final String positiveText;
  final VoidCallback? onNegativePressed;
  final VoidCallback? onPositivePressed;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.negativeText,
    required this.positiveText,
    this.onNegativePressed,
    this.onPositivePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Gap(16.0),
            Text(message),
            const Gap(16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 1,
                  child: CustomButton(
                    text: negativeText,
                    onPressed:
                        onNegativePressed ?? () => Navigator.pop(context, true),
                  ),
                ),
                const Gap(8.0),
                Flexible(
                  flex: 1,
                  child: CustomButton(
                    text: positiveText,
                    backgroundColor: Theme.of(context).colorScheme.error,
                    onPressed:
                        onPositivePressed ?? () => Navigator.pop(context, true),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
