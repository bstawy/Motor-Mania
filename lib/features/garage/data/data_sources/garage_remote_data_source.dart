import 'package:dio/dio.dart';

import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../models/add_car_model.dart';

abstract class GarageRemoteDataSource {
  Future<ApiResult<Response>> getGarageCars();
  Future<ApiResult<Response>> getUserCar();
  Future<ApiResult<Response>> selectCar(int carId);
  Future<ApiResult<Response>> switchCar(SwitchEnum switchValue);
  Future<ApiResult<Response>> addCar(AddCarModel car);
  Future<ApiResult<Response>> removeCar(int carId);
}
