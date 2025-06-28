import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/models/home_car_model.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../../domain/repos/garage_repo.dart';
import '../data_sources/garage_remote_data_source.dart';
import '../models/add_car_model.dart';

class GarageRepoImpl extends GarageRepo {
  final GarageRemoteDataSource _garageRemoteDataSource;

  GarageRepoImpl(this._garageRemoteDataSource);

  @override
  Future<Either<ServerFailure, List<CarEntity>>> getGarageCars() async {
    try {
      final response = await _garageRemoteDataSource.getGarageCars();

      if (response.statusCode == 200) {
        final List<CarEntity> cars = (response.data['data'] as List)
            .map((car) => CarModel.fromJson(car))
            .toList();

        return Right(cars);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode,
            message: 'Failed to get garage cars',
          ),
        );
      }
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
  Future<Either<ServerFailure, CarEntity>> selectCar(int carId) async {
    try {
      final response = await _garageRemoteDataSource.selectCar(carId);

      if (response.statusCode == 200) {
        final CarEntity car = CarModel.fromJson(response.data['data']);
        return Right(car);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode,
            message: response.data['message'],
          ),
        );
      }
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
  Future<Either<ServerFailure, bool>> addCar(AddCarModel car) async {
    try {
      final response = await _garageRemoteDataSource.addCar(car);

      if (response.statusCode == 201) {
        return const Right(true);
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
  Future<Either<ServerFailure, bool>> removeCar(int carId) async {
    try {
      final response = await _garageRemoteDataSource.removeCar(carId);

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode,
            message: response.data['message'],
          ),
        );
      }
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
