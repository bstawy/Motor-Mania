import 'package:dartz/dartz.dart';

import '../../domain/entities/car_entity.dart';
import '../../domain/repos/user_selected_car_repo.dart';
import '../data_sources/user_selected_car_remote_data_source.dart';

class UserSelectedCarRepoImpl extends UserSelectedCarRepo {
  final UserSelectedCarRemoteDataSource _userSelectedCarRemoteDataSource;

  UserSelectedCarRepoImpl(this._userSelectedCarRemoteDataSource);

  @override
  Future<Either<String, CarEntity>> getUserSelectedCar() async {
    final response =
        await _userSelectedCarRemoteDataSource.getUserSelectedCar();

    return response.fold(
      (error) => Left(error),
      (car) => Right(car),
    );
  }
}
