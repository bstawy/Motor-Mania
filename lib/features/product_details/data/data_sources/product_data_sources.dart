import 'package:dio/dio.dart';

import '../../../../core/networking/api_result.dart';

abstract class ProductDataSources {
  Future<ApiResult<Response>> getProductDetails(int id);
}
