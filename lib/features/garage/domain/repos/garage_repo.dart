import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/car_entity.dart';

abstract class GarageRepo {
  Future<Either<ServerFailure, List<CarEntity>>> getGarageCars();
  Future<Either<ServerFailure, CarEntity>> selectCar(int carId);
  Future<Either<ServerFailure, bool>> removeCar(int carId);
}
