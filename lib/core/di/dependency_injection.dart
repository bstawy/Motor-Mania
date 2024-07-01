import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/data_sources/login_remote_data_source.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/register/data/data_sources/register_remote_data_source.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../networking/crud_manager.dart';
import '../networking/dio/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService
  Dio freeDio = DioFactory.getFreeDio();
  Dio tokenDio = DioFactory.getTokenDio();

  getIt.registerLazySingleton<CrudManager>(() => CrudManager.getInstance(
        freeDio: freeDio,
        tokenDio: tokenDio,
      ));

  // Register
  getIt.registerFactory<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSource(getIt()));
  getIt.registerFactory<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // login
  getIt.registerFactory<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(getIt()));
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
