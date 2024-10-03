import 'package:flutter/material.dart';

import 'colors_manager.dart';

class CustomColorSchemes {
  static final lightColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: ColorsManager.darkBlue,
    primary: ColorsManager.darkBlue,
    surface: ColorsManager.whiteGrey,
    inverseSurface: Colors.white,
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: ColorsManager.dark,
    primary: Colors.white,
    surface: ColorsManager.dark,
    inverseSurface: ColorsManager.lightDark,
  );
}
