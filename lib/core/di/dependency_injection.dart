import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/data_sources/login_remote_data_source.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/register/data/data_sources/register_remote_data_source.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../../features/home/data/data_sources/categories_remote_data_source.dart';
import '../../features/home/data/data_sources/data_sources_impl/categories_remote_data_source_impl.dart';
import '../../features/home/data/data_sources/data_sources_impl/products_remote_data_source_impl.dart';
import '../../features/home/data/data_sources/products_remote_data_source.dart';
import '../../features/home/data/repos_impl/categories_repo_impl.dart';
import '../../features/home/data/repos_impl/products_repo_impl.dart';
import '../../features/home/domain/repos/categories_repo.dart';
import '../../features/home/domain/repos/products_repo.dart';
import '../../features/home/domain/use_cases/get_all_categories_use_case.dart';
import '../../features/home/domain/use_cases/get_all_products_use_case.dart';
import '../../features/home/presentation/logic/home_cubit.dart';
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

  // home
  getIt.registerFactory<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(getIt()));
  getIt.registerFactory<CategoriesRepo>(() => CategoriesRepoImpl(getIt()));
  getIt.registerFactory<GetAllCategoriesUseCase>(
      () => GetAllCategoriesUseCase(getIt()));
  getIt.registerFactory<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(getIt()));
  getIt.registerFactory<ProductsRepo>(() => ProductsRepoImpl(getIt()));
  getIt.registerFactory<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt()));
}
