import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'core/caching/hive_manager.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/app_bloc_observer.dart';
import 'motor_mania_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  runApp(const MotorManiaApp());
}
