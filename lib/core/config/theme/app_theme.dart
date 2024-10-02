import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../text/font_weight_helper.dart';
import 'colors_manager.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.whiteGrey,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: ColorsManager.darkBlue,
      primary: ColorsManager.darkBlue,
      surface: ColorsManager.whiteGrey,
      inverseSurface: Colors.white,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 32.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      displayMedium: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      displaySmall: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      headlineLarge: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      headlineMedium: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      headlineSmall: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      labelLarge: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 10.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      labelMedium: TextStyle(
        color: ColorsManager.blueGrey,
        fontSize: 8.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      labelSmall: TextStyle(
        color: ColorsManager.red,
        fontSize: 7.sp,
        fontWeight: FontWeightHelper.semiBold,
        fontFamily: 'Montserrat',
      ),
    ),
    fontFamily: 'Montserrat',
  );

  static final ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.dark,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ColorsManager.dark,
      primary: Colors.white,
      surface: ColorsManager.dark,
      inverseSurface: ColorsManager.lightDarkBlue,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 32.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      displaySmall: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      headlineLarge: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      labelLarge: TextStyle(
        color: ColorsManager.darkBlue,
        fontSize: 10.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      labelMedium: TextStyle(
        color: ColorsManager.blueGrey,
        fontSize: 8.sp,
        fontWeight: FontWeightHelper.bold,
        fontFamily: 'Montserrat',
      ),
      labelSmall: TextStyle(
        color: ColorsManager.red,
        fontSize: 7.sp,
        fontWeight: FontWeightHelper.semiBold,
        fontFamily: 'Montserrat',
      ),
    ),
    fontFamily: 'Montserrat',
  );
}
