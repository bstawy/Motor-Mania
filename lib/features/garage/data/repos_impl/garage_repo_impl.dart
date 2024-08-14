import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/data/models/home_car_model.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../../domain/repos/garage_repo.dart';
import '../data_sources/garage_remote_data_source.dart';

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
}
