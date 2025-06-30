import 'package:dio/dio.dart';
import 'package:motor_mania/core/networking/generic_api_call.dart';

import '../../../../core/config/constants/api_constants.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/crud_manager.dart';
import 'car_brands_remote_data_source.dart';

class CarBrandsRemoteDataSourceImpl extends CarsBrandsRemoteDataSource {
  final CrudManager _crudManager;

  CarBrandsRemoteDataSourceImpl(this._crudManager);

  @override
  Future<ApiResult<Response>> getCarBrands() async {
    return await executeApiCall(() async {
      return await _crudManager.get(EndPoints.carBrands, tokenReq: true);
    });
  }

  @override
  Future<ApiResult<Response>> getCarBrandModels(int brandId) async {
    final Map<String, dynamic> param = {'brand_id': brandId};

    return await executeApiCall(() async {
      return await _crudManager.get(
        EndPoints.carModels,
        params: param,
        tokenReq: true,
      );
    });
  }
}
