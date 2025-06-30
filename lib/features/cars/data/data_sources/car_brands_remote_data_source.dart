import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';

abstract class CarsBrandsRemoteDataSource {
  Future<ApiResult<Response>> getCarBrands();
  Future<ApiResult<Response>> getCarBrandModels(int brandId);
}
