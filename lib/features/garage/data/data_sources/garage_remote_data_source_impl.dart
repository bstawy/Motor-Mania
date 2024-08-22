import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import '../models/add_car_model.dart';
import 'garage_remote_data_source.dart';

class GarageRemoteDataSourceImpl extends GarageRemoteDataSource {
  final CrudManager _crudManager;

  GarageRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getGarageCars() async {
    return await _crudManager.get(EndPoints.userCars, tokenReq: true);
  }

  @override
  Future<Response> selectCar(int carId) async {
    final Map<String, dynamic> param = {'carId': carId};

    return _crudManager.post(
      EndPoints.selectCar,
      params: param,
      tokenReq: true,
    );
  }

  @override
  Future<Response> addCar(AddCarModel car) async {
    final bodyParams = car.toJson();

    return await _crudManager.post(
      EndPoints.addCar,
      body: bodyParams,
      tokenReq: true,
    );
  }

  @override
  Future<Response> removeCar(int carId) async {
    final Map<String, dynamic> param = {'id': carId};

    return await _crudManager.delete(
      EndPoints.removeCar,
      params: param,
      tokenReq: true,
    );
  }
}
