import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/caching/hive_manager.dart';
import 'core/config/app_manager/app_manager_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'motor_mania_app.dart';

bool themeIsDark = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    initGetIt(),
  ]).then((_) {
    Bloc.observer = getIt<AppBlocObserver>();
    getIt<HiveManager>().init();

    runApp(
      BlocProvider<AppManagerCubit>(
        create: (context) => AppManagerCubit(),
        child: const MotorManiaApp(),
      ),
    );
  });
}
