import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_manager/app_manager_cubit.dart';
import 'core/config/routing/app_router.dart';
import 'core/config/routing/routes.dart';
import 'core/config/theme/app_theme.dart';
import 'core/config/theme/theme_cubit.dart';

class MotorManiaApp extends StatelessWidget {
  const MotorManiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final ThemeMode appTheme = state;

        return BlocBuilder<AppManagerCubit, AppManagerState>(
          builder: (context, state) {
            bool isFirstTimeUser =
                context.read<AppManagerCubit>().isFirstTimeUser;

            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Motor Mania',
                  themeMode: appTheme,
                  theme: AppTheme.lightThemeData,
                  darkTheme: AppTheme.darkThemeData,
                  navigatorKey: AppRouter.navigatorKey,
                  onGenerateRoute: AppRouter().generateRoute,
                  initialRoute: isFirstTimeUser
                      ? Routes.onBoardingScreens
                      : Routes.layoutScreen,
                  builder: BotToastInit(),
                );
              },
            );
          },
        );
      },
    );
  }
}
