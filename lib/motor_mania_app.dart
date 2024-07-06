import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/caching/tokens_manager.dart';
import 'core/config/routing/app_router.dart';
import 'core/config/routing/routes.dart';
import 'core/config/theme/app_theme.dart';

class MotorManiaApp extends StatefulWidget {
  const MotorManiaApp({super.key});

  @override
  State<MotorManiaApp> createState() => _MotorManiaAppState();
}

class _MotorManiaAppState extends State<MotorManiaApp> {
  String? token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getToken();
    });
  }

  void getToken() async {
    token = await TokensManager.getAccessToken();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TokensManager.getAccessToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        token = snapshot.data;

        return ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Motor Mania',
            theme: AppTheme.lightThemeData,
            onGenerateRoute: AppRouter().generateRoute,
            initialRoute:
                token != null ? Routes.layoutScreen : Routes.onBoardingScreens,
          ),
        );
      },
    );
  }
}
