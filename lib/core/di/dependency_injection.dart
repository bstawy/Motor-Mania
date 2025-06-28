import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/data_sources/login_remote_data_source.dart';
import '../../features/auth/login/data/repos/login_repo.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/register/data/data_sources/register_remote_data_source.dart';
import '../../features/auth/register/data/repos/register_repo.dart';
import '../../features/auth/register/logic/register_cubit.dart';
import '../../features/cars/data/data_sources/car_brands_remote_data_source.dart';
import '../../features/cars/data/data_sources/car_brands_remote_data_source_impl.dart';
import '../../features/cars/data/repos_impl/car_brands_repo_impl.dart';
import '../../features/cars/domain/repos/car_brands_repo.dart';
import '../../features/cars/domain/use_cases/get_car_brand_models_use_case.dart';
import '../../features/cars/domain/use_cases/get_car_brands_use_case.dart';
import '../../features/cars/presentation/logic/cars_cubit.dart';
import '../../features/cart/data/data_sources/cart_data_sources.dart';
import '../../features/cart/data/data_sources/cart_local_data_source.dart';
import '../../features/cart/data/data_sources/cart_remote_data_source.dart';
import '../../features/cart/data/repos_impl/cart_repo_impl.dart';
import '../../features/cart/domain/repos/cart_repo.dart';
import '../../features/cart/domain/use_cases/add_product_to_cart_use_case.dart';
import '../../features/cart/domain/use_cases/get_cart_products_use_case.dart';
import '../../features/cart/domain/use_cases/remove_product_from_cart_use_case.dart';
import '../../features/cart/presentation/logic/cart_cubit.dart';
import '../../features/category/data/data_sources/category_data_sources.dart';
import '../../features/category/data/data_sources/category_remote_data_source_impl.dart';
import '../../features/category/data/repos_impl/category_repository_impl.dart';
import '../../features/category/domain/repos/category_repository.dart';
import '../../features/category/domain/use_cases/get_category_products_use_cases.dart';
import '../../features/category/presentation/logic/category_cubit.dart';
import '../../features/favorites/data/data_source/favorites_data_sources.dart';
import '../../features/favorites/data/data_source/favorites_local_data_source.dart';
import '../../features/favorites/data/data_source/favorites_remote_data_source_impl.dart';
import '../../features/favorites/data/repos_impl/favorites_repo_impl.dart';
import '../../features/favorites/domain/repos/favorites_repo.dart';
import '../../features/favorites/domain/use_cases/add_to_favorites_use_case.dart';
import '../../features/favorites/domain/use_cases/get_all_favorites_use_case.dart';
import '../../features/favorites/domain/use_cases/remove_from_favorites_use_case.dart';
import '../../features/favorites/presentation/logic/favorites_cubit.dart';
import '../../features/garage/data/data_sources/garage_remote_data_source.dart';
import '../../features/garage/data/data_sources/garage_remote_data_source_impl.dart';
import '../../features/garage/data/repos_impl/garage_repo_impl.dart';
import '../../features/garage/domain/repos/garage_repo.dart';
import '../../features/garage/domain/use_cases/add_car_use_case.dart';
import '../../features/garage/domain/use_cases/get_garage_cars_use_case.dart';
import '../../features/garage/domain/use_cases/remove_car_use_case.dart';
import '../../features/garage/domain/use_cases/select_car_use_case.dart';
import '../../features/garage/presentation/logic/garage_cubit.dart';
import '../../features/home/data/data_sources/home_data_sources.dart';
import '../../features/home/data/data_sources/home_remote_data_source_impl.dart';
import '../../features/home/data/repos_impl/home_repo_impl.dart';
import '../../features/home/domain/repos/home_repo.dart';
import '../../features/home/domain/use_cases/get_home_categories_use_case.dart';
import '../../features/home/domain/use_cases/get_home_offers_use_case.dart';
import '../../features/home/domain/use_cases/get_home_products_use_case.dart';
import '../../features/home/domain/use_cases/get_user_selected_car_use_case.dart';
import '../../features/home/domain/use_cases/select_next_car_use_case.dart';
import '../../features/home/domain/use_cases/select_previous_car_use_case.dart';
import '../../features/home/presentation/logic/home_cubit/home_cubit.dart';
import '../../features/home/presentation/logic/user_cubit/user_cubit.dart';
import '../../features/product_details/data/data_sources/product_data_sources.dart';
import '../../features/product_details/data/data_sources/product_remote_data_source_impl.dart';
import '../../features/product_details/data/repos_impl/product_repo_impl.dart';
import '../../features/product_details/domain/repos/product_repo.dart';
import '../../features/product_details/domain/use_cases/get_product_details_use_case.dart';
import '../../features/product_details/presentation/logic/product_cubit.dart';
import '../../features/search/data/data_sources/search_data_sources.dart';
import '../../features/search/data/data_sources/search_remote_data_source_impl.dart';
import '../../features/search/data/repos_impl/search_repo_impl.dart';
import '../../features/search/domain/repos/search_repo.dart';
import '../../features/search/domain/use_cases/search_use_case.dart';
import '../../features/search/presentation/logic/search_cubit.dart';
import '../caching/hive_manager.dart';
import '../helpers/app_bloc_observer.dart';
import '../networking/crud_manager.dart';
import '../networking/dio/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & ApiService & HiveManager
  Dio freeDio = DioFactory.getFreeDio();
  Dio tokenDio = DioFactory.getTokenDio();

  getIt.registerLazySingleton<CrudManager>(
    () => CrudManager.getInstance(
      freeDio: freeDio,
      tokenDio: tokenDio,
    ),
  );

  getIt.registerLazySingleton<HiveManager>(
    () => HiveManager.getInstance(),
  );

  // BLoc observer
  getIt.registerSingleton<AppBlocObserver>(AppBlocObserver());

  // Register
  getIt.registerFactory<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSource(getIt()),
  );
  getIt.registerFactory<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));

  // login
  getIt.registerFactory<LoginRemoteDataSource>(
    () => LoginRemoteDataSource(getIt()),
  );
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // home
  getIt.registerFactory<HomeDataSources>(
    () => HomeRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<HomeRepo>(
    () => HomeRepoImpl(getIt()),
  );
  getIt.registerFactory<GetUserSelectedCarUseCase>(
    () => GetUserSelectedCarUseCase(getIt()),
  );
  getIt.registerFactory<SelectNextCarUseCase>(
    () => SelectNextCarUseCase(getIt()),
  );
  getIt.registerFactory<SelectPreviousCarUseCase>(
    () => SelectPreviousCarUseCase(getIt()),
  );
  getIt.registerFactory<GetHomeOffersUseCase>(
    () => GetHomeOffersUseCase(getIt()),
  );
  getIt.registerFactory<GetHomeCategoriesUseCase>(
    () => GetHomeCategoriesUseCase(getIt()),
  );
  getIt.registerFactory<GetHomeProductsUseCase>(
    () => GetHomeProductsUseCase(getIt()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getIt(),
      getIt(),
      getIt(),
    ),
  );

  // User
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt(), getIt(), getIt()));

  // Category
  getIt.registerFactory<CategoryDataSources>(
    () => CategoryRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<CategoryRepository>(
    () => CategoryRepositoryImpl(getIt()),
  );
  getIt.registerFactory<GetCategoryProductsUseCases>(
    () => GetCategoryProductsUseCases(getIt()),
  );
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  // Product
  getIt.registerFactory<ProductDataSources>(
    () => ProductRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<ProductRepo>(
    () => ProductRepoImpl(getIt()),
  );
  getIt.registerFactory<GetProductDetailsUseCase>(
    () => GetProductDetailsUseCase(getIt()),
  );
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));

  // Favorites
  getIt.registerFactory<FavoritesDataSources>(
    () => FavoritesRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSource(getIt()),
  );
  getIt.registerFactory<FavoritesRepo>(
    () => FavoritesRepoImpl(getIt(), getIt()),
  );
  getIt.registerFactory<GetAllFavoritesUseCase>(
    () => GetAllFavoritesUseCase(getIt()),
  );
  getIt.registerFactory<AddToFavoritesUseCase>(
    () => AddToFavoritesUseCase(getIt()),
  );
  getIt.registerFactory<RemoveFromFavoritesUseCase>(
    () => RemoveFromFavoritesUseCase(getIt()),
  );
  getIt.registerFactory<FavoritesCubit>(
    () => FavoritesCubit(getIt(), getIt(), getIt()),
  );

  // search
  getIt.registerFactory<SearchDataSources>(
    () => SearchRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<SearchRepo>(
    () => SearchRepoImpl(getIt()),
  );
  getIt.registerFactory<SearchUseCase>(
    () => SearchUseCase(getIt()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(getIt()),
  );

  //cart
  getIt.registerFactory<CartDataSources>(
    () => CartRemoteDataSource(getIt()),
  );
  getIt.registerFactory<CartLocalDataSource>(
    () => CartLocalDataSource(getIt()),
  );
  getIt.registerFactory<CartRepo>(
    () => CartRepoImpl(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<GetCartProductsUseCase>(
    () => GetCartProductsUseCase(getIt()),
  );
  getIt.registerFactory<AddProductToCartUseCase>(
    () => AddProductToCartUseCase(getIt()),
  );
  getIt.registerFactory<RemoveProductFromCartUseCase>(
    () => RemoveProductFromCartUseCase(getIt()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt(), getIt(), getIt()));

  //garage
  getIt.registerFactory<GarageRemoteDataSource>(
    () => GarageRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<GarageRepo>(
    () => GarageRepoImpl(getIt()),
  );
  getIt.registerFactory<GetGarageCarsUseCase>(
    () => GetGarageCarsUseCase(getIt()),
  );
  getIt.registerFactory<SelectCarUseCase>(
    () => SelectCarUseCase(getIt()),
  );
  getIt.registerFactory<AddCarUseCase>(
    () => AddCarUseCase(getIt()),
  );
  getIt.registerFactory<RemoveCarUseCase>(
    () => RemoveCarUseCase(getIt()),
  );
  getIt.registerFactory<GarageCubit>(
    () => GarageCubit(getIt(), getIt(), getIt(), getIt()),
  );

  //cars
  getIt.registerFactory<CarBrandsRemoteDataSource>(
    () => CarBrandsRemoteDataSourceImpl(getIt()),
  );
  getIt.registerFactory<CarBrandsRepo>(
    () => CarBrandsRepoImpl(getIt()),
  );
  getIt.registerFactory<GetCarBrandsUseCase>(
    () => GetCarBrandsUseCase(getIt()),
  );
  getIt.registerFactory<GetCarBrandModelsUseCase>(
    () => GetCarBrandModelsUseCase(getIt()),
  );
  getIt.registerLazySingleton<CarsCubit>(() => CarsCubit(getIt(), getIt()));
}
