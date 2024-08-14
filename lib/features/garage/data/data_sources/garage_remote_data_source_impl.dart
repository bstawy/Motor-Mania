import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import 'garage_remote_data_source.dart';

class GarageRemoteDataSourceImpl extends GarageRemoteDataSource {
  final CrudManager _crudManager;

  GarageRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getGarageCars() async {
    return await _crudManager.get(EndPoints.userCars, tokenReq: true);
  }
}
