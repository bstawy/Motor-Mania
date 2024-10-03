import 'package:flutter/material.dart';

import 'colors/colors_manager.dart';
import 'colors/custom_color_schemes.dart';
import 'texts/custom_text_styles.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.whiteGrey,
    colorScheme: CustomColorSchemes.lightColorScheme,
    textTheme: CustomTextStyles.lightTextStyles,
    fontFamily: 'Montserrat',
  );

  static final ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.dark,
    colorScheme: CustomColorSchemes.darkColorScheme,
    textTheme: CustomTextStyles.darkTextStyles,
    fontFamily: 'Montserrat',
  );
}
