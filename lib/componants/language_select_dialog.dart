import 'package:app_test/config/hive_constants.dart';
import 'package:app_test/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LanguageSelectDialog extends StatelessWidget {
  const LanguageSelectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.language_outlined, size: 50.sp),
                const Gap(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: LanguageCard(
                        lngCode: 'en',
                        lngName: 'English',
                        onTap: () =>
                            HiveService().setAppLanguage(languageCode: 'en'),
                      ),
                    ),
                    const Gap(16.0),
                    Flexible(
                      flex: 1,
                      child: LanguageCard(
                        lngCode: 'bn',
                        lngName: 'Bangla',
                        onTap: () =>
                            HiveService().setAppLanguage(languageCode: 'bn'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: -12,
              right: -10,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageCard extends StatelessWidget {
  final String lngCode;
  final String lngName;
  final VoidCallback? onTap;
  final bool isSelected;
  const LanguageCard({
    super.key,
    required this.lngCode,
    required this.lngName,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              height: 70.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    lngName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ValueListenableBuilder(
            valueListenable: Hive.box(HiveConstants.settingsBox).listenable(),
            builder: (context, settingsBox, _) {
              final lngCode = settingsBox.get(HiveConstants.languageKey,
                  defaultValue: 'en') as String;
              return Visibility(
                visible: lngCode == this.lngCode,
                child: Positioned(
                  top: -5,
                  left: 0,
                  child: Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                ),
              );
            }),
      ],
    );
  }
}
