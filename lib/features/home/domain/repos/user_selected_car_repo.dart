import 'package:dartz/dartz.dart';

import '../entities/car_entity.dart';

abstract class UserSelectedCarRepo {
  Future<Either<String, CarEntity>> getUserSelectedCar();
}
