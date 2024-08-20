import 'package:flutter/material.dart';

import 'colors_manager.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.darkBlue,
      surface: ColorsManager.whiteGrey,
    ),
    fontFamily: 'Montserrat',
  );

  static final ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.dark,
      surface: ColorsManager.darkBlue,
    ),
    fontFamily: 'Montserrat',
  );
}
