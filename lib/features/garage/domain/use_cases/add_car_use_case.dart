import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../data/models/add_car_model.dart';
import '../repos/garage_repo.dart';

class AddCarUseCase {
  final GarageRepo _repo;

  AddCarUseCase(this._repo);

  Future<Either<ServerFailure, bool>> call(AddCarModel car) async {
    return await _repo.addCar(car);
  }
}
