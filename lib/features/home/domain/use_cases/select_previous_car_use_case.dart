import 'package:dartz/dartz.dart';

import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/failure/server_failure.dart';
import '../entities/car_entity.dart';
import '../repos/home_repo.dart';

class SelectPreviousCarUseCase {
  final HomeRepo _homeRepo;

  SelectPreviousCarUseCase(this._homeRepo);

  Future<Either<ServerFailure, CarEntity>> execute() async {
    return await _homeRepo.switchCar(SwitchEnum.previous);
  }
}
