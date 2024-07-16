import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/home_product_entity.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_remote_data_source.dart';
import '../models/home_car_model.dart';
import '../models/home_category_model.dart';
import '../models/home_product_model.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);
  @override
  Future<Either<ServerFailure, CarModel>> getUserCar() async {
    try {
      final response = await _homeRemoteDataSource.getUserCar();

      if (response.statusCode == 200 && response.data['success'] == true) {
        final CarModel userCar = CarModel.fromJson(response.data['data']);

        return Right(userCar);
      }

      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: '400',
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<HomeCategoryEntity>>>
      getHomeCategories() async {
    try {
      final response = await _homeRemoteDataSource.getHomeCategories();

      if (response.statusCode == 200 && response.data['success'] == true) {
        List<HomeCategoryEntity> homeCategories =
            (response.data['data'] as List)
                .map((i) => HomeCategoryModel.fromJson(i))
                .toList();

        return Right(homeCategories);
      }

      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: '400',
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<HomeProductEntity>>>
      getHomeProducts() async {
    try {
      final response = await _homeRemoteDataSource.getHomeProducts();

      if (response.statusCode == 200 && response.data['success'] == true) {
        final List<HomeProductModel> homeProducts =
            (response.data['data'] as List)
                .map((i) => HomeProductModel.fromJson(i))
                .toList();

        return Right(homeProducts);
      }

      return Left(
        ServerFailure(
          statusCode: response.statusCode.toString(),
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: '400',
          message: e.toString(),
        ),
      );
    }
  }
}
