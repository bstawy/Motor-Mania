import 'package:dartz/dartz.dart';
import 'package:motor_mania/core/helpers/enums/switch_enum.dart';
import 'package:motor_mania/core/networking/failure/server_failure.dart';
import 'package:motor_mania/features/home/domain/entities/car_entity.dart';
import 'package:motor_mania/features/home/domain/repos/home_repo.dart';

class SelectNextCarUseCase {
  final HomeRepo _homeRepo;

  SelectNextCarUseCase(this._homeRepo);

  Future<Either<ServerFailure, CarEntity>> execute() async {
    return await _homeRepo.switchCar(SwitchEnum.next);
  }
}
