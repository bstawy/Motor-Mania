import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_manager/app_manager_cubit.dart';
import 'core/config/routing/app_router.dart';
import 'core/config/routing/routes.dart';
import 'core/config/theme/app_theme.dart';

class MotorManiaApp extends StatelessWidget {
  const MotorManiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
      bloc: context.read<AppManagerCubit>()..checkUserLoggedIn(),
      builder: (context, state) {
        debugPrint(
            "Current Theme: ${state is ChangeThemeState ? state.currentTheme.toString() : null}");
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Motor Mania',
            themeMode: context.read<AppManagerCubit>().currentThemeMode,
            theme: AppTheme.lightThemeData,
            darkTheme: AppTheme.darkThemeData,
            onGenerateRoute: AppRouter().generateRoute,
            initialRoute: Routes.onBoardingScreens,
            builder: BotToastInit(),
          ),
        );
      },
    );
  }
}
