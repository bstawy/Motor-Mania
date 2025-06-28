import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../domain/entities/car_brand_entity.dart';
import '../../domain/entities/car_brand_model_entity.dart';
import '../../domain/repos/car_brands_repo.dart';
import '../data_sources/car_brands_remote_data_source.dart';
import '../models/car_brand_model.dart';
import '../models/car_brand_model_model.dart';

class CarBrandsRepoImpl extends CarBrandsRepo {
  final CarBrandsRemoteDataSource _remoteDataSource;

  CarBrandsRepoImpl(this._remoteDataSource);

  @override
  Future<Either<ServerFailure, List<CarBrandEntity>>> getCarBrands() async {
    try {
      final response = await _remoteDataSource.getCarBrands();

      if (response.statusCode == 200) {
        final List<CarBrandEntity> carBrands = (response.data['data'] as List)
            .map((carBrand) => CarBrandModel.fromJson(carBrand))
            .toList();

        return Right(carBrands);
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<ServerFailure, List<CarBrandModelEntity>>> getCarBrandModels(
      int brandId) async {
    try {
      final response = await _remoteDataSource.getCarBrandModels(brandId);

      if (response.statusCode == 200) {
        final List<CarBrandModelEntity> carBrands = (response.data['data']
                as List)
            .map((carBrandModel) => CarBrandModelModel.fromJson(carBrandModel))
            .toList();

        return Right(carBrands);
      }
      return Left(
        ServerFailure(
          statusCode: response.statusCode,
          message: response.data['message'],
        ),
      );
    } catch (e) {
      return Left(
        ServerFailure(
          statusCode: 500,
          message: e.toString(),
        ),
      );
    }
  }
}
