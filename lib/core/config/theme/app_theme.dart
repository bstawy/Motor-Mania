import 'package:flutter/material.dart';

import 'colors_manager.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.darkkBlue,
      surface: ColorsManager.whiteGrey,
    ),
    fontFamily: 'Montserrat',
  );
}
