import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/config/configs_cubits/language_cubit.dart';
import 'core/config/configs_cubits/theme_cubit.dart';

class AppInitializer extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeMode theme, Locale locale)
      builder;

  const AppInitializer({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, userTheme) {
        return BlocBuilder<LanguageCubit, Locale>(
          builder: (context, userLocale) {
            return builder(context, userTheme, userLocale);
          },
        );
      },
    );
  }
}
