import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/config/app_manager/app_manager_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'motor_mania_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    ScreenUtil.ensureScreenSize(),
    initGetIt(),
  ]);

  Bloc.observer = getIt<AppBlocObserver>();

  runApp(
    BlocProvider<AppManagerCubit>(
      create: (context) => AppManagerCubit(),
      child: const MotorManiaApp(),
    ),
  );
}
