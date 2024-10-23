import 'package:app_test/config/app_theme.dart';
import 'package:app_test/config/hive_constants.dart';
import 'package:app_test/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ValueListenableBuilder(
          valueListenable: Hive.box(HiveConstants.settingsBox).listenable(),
          builder: (context, settingsBox, _) {
            final isDarkMode = settingsBox.get(HiveConstants.isDarkModeKey,
                defaultValue: false) as bool;
            return MaterialApp(
              title: 'Flutter Demo',
              theme: isDarkMode ? AppTheme.dark : AppTheme.light,
              initialRoute: AppRoutes.splash,
              onGenerateRoute: AppRoutes.generateRoute,
            );
          }),
    );
  }
}
