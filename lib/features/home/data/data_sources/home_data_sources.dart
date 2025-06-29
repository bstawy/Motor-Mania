import 'package:dio/dio.dart';

import '../../../../core/helpers/enums/switch_enum.dart';
import '../../../../core/networking/api_result.dart';

abstract class HomeDataSources {
  Future<ApiResult<Response>> getUserCar();
  Future<ApiResult<Response>> switchCar(SwitchEnum switchValue);
  Future<ApiResult<Response>> getOffers();
  Future<ApiResult<Response>> getCategories();
  Future<ApiResult<Response>> getProducts();
}
