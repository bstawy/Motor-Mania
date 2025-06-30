import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/caching/hive_manager.dart';
import 'core/config/app_manager/app_manager_cubit.dart';
import 'core/config/theme/theme_cubit.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'motor_mania_app.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize HydratedBloc storage
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
        (await getApplicationDocumentsDirectory()).path),
  );

  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    initGetIt(),
  ]);

  Bloc.observer = getIt<AppBlocObserver>();
  await getIt<HiveManager>().init();

  final AppManagerCubit appManagerCubit = AppManagerCubit();
  await appManagerCubit.init();

  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => appManagerCubit,
        ),
      ],
      child: const MotorManiaApp(),
    ),
  );
}
