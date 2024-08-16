import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../repos/garage_repo.dart';

class SelectCarUseCase {
  final GarageRepo _garageRepo;

  SelectCarUseCase(this._garageRepo);

  Future<Either<ServerFailure, CarEntity>> execute(int carId) async {
    return await _garageRepo.selectCar(carId);
  }
}
