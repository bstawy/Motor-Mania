import 'package:dartz/dartz.dart';

import '../../domain/entities/car_entity.dart';

abstract class UserSelectedCarRemoteDataSource {
  Future<Either<String, CarEntity>> getUserSelectedCar();
}
