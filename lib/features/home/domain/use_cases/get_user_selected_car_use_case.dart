import 'package:dartz/dartz.dart';

import '../entities/car_entity.dart';
import '../repos/user_selected_car_repo.dart';

class GetUserSelectedCarUseCase {
  final UserSelectedCarRepo _userSelectedCarRepo;

  GetUserSelectedCarUseCase(this._userSelectedCarRepo);

  Future<Either<String, CarEntity>> exeute() async {
    return _userSelectedCarRepo.getUserSelectedCar();
  }
}
