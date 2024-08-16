import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../entities/car_entity.dart';
import '../repos/home_repo.dart';

class GetUserSelectedCarUseCase {
  final HomeRepo _homeRepo;

  GetUserSelectedCarUseCase(this._homeRepo);

  Future<Either<ServerFailure, CarEntity>> execute() async {
    return await _homeRepo.getUserCar();
  }
}
