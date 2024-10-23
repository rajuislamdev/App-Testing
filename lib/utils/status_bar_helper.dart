import 'package:app_test/utils/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarHelper {
  static void setStatusBarStyle(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // Transparent status bar
        statusBarIconBrightness: context.isDarkMode
            ? Brightness.light
            : Brightness.dark, // Icon brightness based on theme
        statusBarBrightness: context.isDarkMode
            ? Brightness.dark
            : Brightness.light, // Status bar brightness based on theme
      ),
    );
  }
}
