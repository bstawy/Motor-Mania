import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';

abstract class HomeDataSources {
  Future<ApiResult<Response>> getOffers();
  Future<ApiResult<Response>> getCategories();
  Future<ApiResult<Response>> getProducts();
}
