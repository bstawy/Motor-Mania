import 'package:motor_mania/core/networking/api_result.dart';

import '../entities/car_brand_entity.dart';
import '../entities/car_brand_model_entity.dart';

abstract class CarBrandsRepo {
  Future<ApiResult<List<CarBrandEntity>?>> getCarBrands();
  Future<ApiResult<List<CarBrandModelEntity>?>> getCarBrandModels(int brandId);
}
