import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../helpers/extensions/theme_ext.dart';
import '../constants/app_constant_keys.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void setTheme(ThemeMode themeMode) => emit(themeMode);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final String themeString =
        json[CachingKeys.userTheme] as String? ?? ThemeKeys.system;

    final ThemeMode appThemeMode = ThemeModeExtension.fromString(themeString);

    return appThemeMode;
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    return {CachingKeys.userTheme: state.name};
  }
}
