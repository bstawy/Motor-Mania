import 'package:flutter/material.dart';

extension ThemeTextExtension on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension ThemeColorsExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;
}
