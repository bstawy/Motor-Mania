import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/routing/app_router.dart';
import 'core/config/routing/routes.dart';
import 'core/config/theme/app_theme.dart';

class MotorManiaApp extends StatelessWidget {
  final String token;
  const MotorManiaApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Motor Mania',
        theme: AppTheme.lightThemeData,
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute:
            token.isNotEmpty ? Routes.layoutScreen : Routes.onBoardingScreens,
      ),
    );
  }
}
