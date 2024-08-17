import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../repos/garage_repo.dart';

class RemoveCarUseCase {
  final GarageRepo _repo;

  RemoveCarUseCase(this._repo);

  Future<Either<ServerFailure, bool>> call(int carId) async {
    return await _repo.removeCar(carId);
  }
}
