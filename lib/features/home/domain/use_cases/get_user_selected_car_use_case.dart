import 'package:dartz/dartz.dart';

import '../../../../core/networking/failure/failures.dart';
import '../entities/car_entity.dart';
import '../repos/home_repo.dart';

class GetUserSelectedCarUseCase {
  final HomeRepo _homeRepo;

  GetUserSelectedCarUseCase(this._homeRepo);

  Future<Either<ServerFailure, CarEntity>> execute() async {
    final response = await _homeRepo.getUserCar();

    return response.fold(
      (failure) => Left(failure),
      (carModel) => Right(carModel.toEntity(50000)),
    );
  }
}
