import 'package:flutter/material.dart';

class UserConfigs {
  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
}
