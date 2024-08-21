import 'package:dio/dio.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/crud_manager.dart';
import 'car_brands_remote_data_source.dart';

class CarBrandsRemoteDataSourceImpl extends CarBrandsRemoteDataSource {
  final CrudManager _crudManager;

  CarBrandsRemoteDataSourceImpl(this._crudManager);

  @override
  Future<Response> getCarBrands() async {
    return await _crudManager.get(EndPoints.carBrands, tokenReq: true);
  }
}
