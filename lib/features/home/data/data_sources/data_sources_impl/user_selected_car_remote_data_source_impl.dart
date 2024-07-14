import 'package:dartz/dartz.dart';

import '../../../../../core/config/constants/api_constants.dart';
import '../../../../../core/networking/crud_manager.dart';
import '../../../domain/entities/car_entity.dart';
import '../../models/car_model.dart';
import '../user_selected_car_remote_data_source.dart';

class UserSelectedCarRemoteDataSourceImpl
    extends UserSelectedCarRemoteDataSource {
  final CrudManager _crudManager;

  UserSelectedCarRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Either<String, CarEntity>> getUserSelectedCar() async {
    try {
      final response = await _crudManager.get(
        EndPoints.userSelectedCar,
        tokenReq: true,
      );

      if (response.statusCode == 200 && response.data['success'] == true) {
        final car = CarModel.fromJson(response.data['data']);
        return Right(car);
      }
      return Left(response.data['message']);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
