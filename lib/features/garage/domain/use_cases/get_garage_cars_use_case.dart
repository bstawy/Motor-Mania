import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/server_failure.dart';
import '../../../home/domain/entities/car_entity.dart';
import '../repos/garage_repo.dart';

class GetGarageCarsUseCase {
  final GarageRepo _garageRepo;

  GetGarageCarsUseCase(this._garageRepo);

  Future<Either<ServerFailure, List<CarEntity>>> execute() async {
    return await _garageRepo.getGarageCars();
  }
}
