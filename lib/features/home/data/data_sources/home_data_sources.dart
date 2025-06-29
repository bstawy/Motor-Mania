import 'package:dio/dio.dart';
import 'package:motor_mania/core/networking/api_result.dart';

import '../../../../core/helpers/enums/switch_enum.dart';

abstract class HomeDataSources {
  Future<ApiResult<Response>> getUserCar();
  Future<ApiResult<Response>> switchCar(SwitchEnum switchValue);
  Future<ApiResult<Response>> getOffers();
  Future<ApiResult<Response>> getCategories();
  Future<ApiResult<Response>> getProducts();
}
