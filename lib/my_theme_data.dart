import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class MyThemeData {
  /// light , dark mode
  static final ThemeData lightMode = ThemeData(
    // canvasColor: AppColors.primaryLightColor,
    primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // foregroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.blackColor)),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.primaryLightColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
      // showUnselectedLabels: true,
      // backgroundColor: AppColors.primaryLightColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor),
      bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor),
    ),
  );
  static final ThemeData darkMode = ThemeData(
    // canvasColor: AppColors.primaryLightColor,
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // foregroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor)),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: AppColors.primaryDarkColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: AppColors.whiteColor,
      // showUnselectedLabels: true,
      // backgroundColor: AppColors.primaryLightColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
          color: AppColors.blackColor),
      bodySmall: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor),
    ),
  );
}
