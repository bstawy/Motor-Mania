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
    return BlocListener<AppManagerCubit, AppManagerState>(
      bloc: context.read<AppManagerCubit>()..checkUserLoggedIn(),
      listener: (context, state) {},
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Motor Mania',
          themeMode: ThemeMode.dark,
          theme: AppTheme.lightThemeData,
          onGenerateRoute: AppRouter().generateRoute,
          initialRoute: Routes.onBoardingScreens,
          builder: BotToastInit(),
        ),
      ),
    );
  }
}
