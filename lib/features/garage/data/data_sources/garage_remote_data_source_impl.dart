import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import '../../../../core/networking/generic_api_call.dart';
import '../models/add_car_model.dart';
import 'garage_remote_data_source.dart';

class GarageRemoteDataSourceImpl extends GarageRemoteDataSource {
  final CrudManager _crudManager;

  GarageRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> getGarageCars() async {
    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.userCars, tokenReq: true);
    });
  }

  @override
  Future<ApiResult<Response>> getUserCar() async {
    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.userSelectedCar, tokenReq: true);
    });
  }

  @override
  Future<ApiResult<Response>> selectCar(int carId) async {
    final Map<String, dynamic> param = {'carId': carId};

    return await executeApiCall(() async {
      return _crudManager.post(
        EndPoints.selectCar,
        params: param,
      );
    });
  }

  @override
  Future<ApiResult<Response>> switchCar(SwitchEnum switchValue) async {
    final param = {'next': switchValue.index};

    return await executeApiCall(() async {
      return _crudManager.get(
        EndPoints.changeCar,
        params: param,
        tokenReq: true,
      );
    });
  }

  @override
  Future<ApiResult<Response>> addCar(AddCarModel car) async {
    final bodyParams = car.toJson();

    return await executeApiCall(() async {
      return await _crudManager.post(
        EndPoints.addCar,
        body: bodyParams,
      );
    });
  }

  @override
  Future<ApiResult<Response>> removeCar(int carId) async {
    final Map<String, dynamic> param = {'id': carId};

    return await executeApiCall(() async {
      return _crudManager.delete(
        EndPoints.removeCar,
        params: param,
        tokenReq: true,
      );
    });
  }
}
