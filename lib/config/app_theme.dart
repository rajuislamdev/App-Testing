import 'package:app_test/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._internal();

  factory AppTheme() => _instance;

  AppTheme._internal();

  static final ThemeData _lightTheme = _createLightTheme();
  static final ThemeData _darkTheme = _createDarkTheme();

  static ThemeData get light => _lightTheme;
  static ThemeData get dark => _darkTheme;

  static ThemeData _createLightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        brightness: Brightness.light,
        surfaceContainer: AppColors.lightTextFormFieldFillColor,
      ),
      elevatedButtonTheme: _elevatedButtonTheme(),
      inputDecorationTheme: _inputDecorationLightTheme(),
      scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: _lightTextTheme,
      appBarTheme: _appBarTheme(),
      dialogTheme: DialogTheme(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        barrierColor: AppColors.darkScaffoldColor.withOpacity(0.8),
        backgroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    );
  }

  static ThemeData _createDarkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark().copyWith(
        primary: AppColors.primaryColor,
        brightness: Brightness.dark,
        surfaceContainer: AppColors.darkTextFormFieldFillColor,
      ),
      elevatedButtonTheme: _elevatedButtonTheme(),
      inputDecorationTheme: _inputDecorationDarkTheme(),
      scaffoldBackgroundColor: AppColors.darkScaffoldColor,
      textTheme: _darkTextTheme,
      appBarTheme: _appBarTheme(),
      dialogTheme: DialogTheme(
        barrierColor: AppColors.whiteColor.withOpacity(0.3),
        backgroundColor: AppColors.darkScaffoldColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      elevation: 0.0,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 48.h),
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationLightTheme() {
    return InputDecorationTheme(
      fillColor: AppColors.lightTextFormFieldFillColor,
      filled: true,
      labelStyle: TextStyle(
        color: AppColors.lightHintColor,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.lightBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.lightBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationDarkTheme() {
    return InputDecorationTheme(
      fillColor: AppColors.darkTextFormFieldFillColor,
      filled: true,
      labelStyle: TextStyle(
        color: AppColors.darkHintColor,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.darkBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: AppColors.darkBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    );
  }

  // Light Theme Text
  static final TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 96.0.sp, // Extra large text for very large headings
      fontWeight: FontWeight.bold,
      color: Colors.black, // Adjust color as needed
    ),
    displayMedium: TextStyle(
      fontSize: 60.0.sp, // Large headings
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 48.0.sp, // Medium headings
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 34.0.sp, // Large headlines
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 24.0.sp, // Standard headlines
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.0.sp, // Small headlines
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0.sp, // Large titles
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 18.0.sp, // Medium titles
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0.sp, // Small titles
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0.sp, // Main body text
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp, // Secondary body text
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0.sp, // Small body text
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0.sp, // Labels
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0.sp, // Smaller labels
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0.sp, // Very small labels
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  // Dark Theme Text
  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 96.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white, // White text for dark theme
    ),
    displayMedium: TextStyle(
      fontSize: 60.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 48.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 34.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.white,
    ),
  );
}
